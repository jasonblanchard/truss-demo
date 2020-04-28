FROM ruby:2.7-slim

RUN bundle config --global frozen 1
RUN bundle config set system 'true'

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 4567

COPY app.rb ./

CMD ["ruby", "./app.rb"]
