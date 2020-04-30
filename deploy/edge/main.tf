provider "datadog" {}

provider "kustomization" {
  # TODO: Include fetching configs as part of the tutorial and point to them here
  # For now, fix this path :)
  kubeconfig_path = "/Users/jdharrington/.kube/conf.d/truss-nonprod-cmh-shared-cluster.yaml"
}

module "pod_monitors" {
  source = "git@github.com:instructure/truss.git//modules/monitors/pod"
  #source           = "../../..//truss/modules/monitors/pod"
  name_prefix      = "[truss-demo][edge][cmh]"
  tags             = ["app:truss-demo", "env:edge", "region:cmh"]
  query_labels     = ["cluster:bridge-truss/nonprod/cmh", "kube_namespace:truss-demo-edge", "app:truss-demo"]
  aggregate_labels = ["cluster", "kube_container_name", "kube_namespace", "app"]
  pod_name_label   = "app"
}

data "kustomization" "truss_demo" {
  path = "${path.root}/kustomize"
}

resource "kustomization_resource" "truss_demo" {
  for_each = data.kustomization.truss_demo.ids
  manifest = data.kustomization.truss_demo.manifests[each.value]
}
