FROM ruby:2.6.5
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev libxslt-dev libxml2-dev nodejs
RUN apt-get update && \
    apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn
RUN gem install bundler

# Rails App
ENV APP_DIR = /gig_app
RUN mkdir /gig_app
WORKDIR /gig_app
COPY Gemfile /gig_app/Gemfile
COPY Gemfile.lock /gig_app/Gemfile.lock
RUN bundle install
RUN yarn install
COPY . /gig_app
RUN mkdir -p tmp/sockets

# Start the main process.
CMD bundle exec puma
