FROM ruby:2.7.1-slim as builder

RUN apt-get update -y && \
    apt-get install -y cmake && \
    apt-get clean && \
    rm -f /var/lib/apt/lists/*_*

ARG APP_ENV=production
ARG BUNDLE_WITHOUT="development test"
ARG BUNDLE_JOBS=4

ENV BUNDLE_JOBS=$BUNDLE_JOBS BUNDLE_WITHOUT=$BUNDLE_WITHOUT

WORKDIR /app

COPY Gemfile* ./

RUN gem install bundler:"$(tail -n 1 Gemfile.lock | xargs)"
RUN bundle check || bundle install

ARG SERVER_VERSION
ARG APP_ENV

ENV SERVER_VERSION=$SERVER_VERSION
ENV APP_ENV=$APP_ENV

COPY . .

CMD ["bin/start"]
