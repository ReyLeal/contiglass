# syntax=docker/dockerfile:1

# Keep Ruby selectable since this repo doesn't pin it.
# If the build fails with OpenSSL/system library issues, try changing RUBY_IMAGE
# to another rubylang/ruby tag (e.g. 2.6.10-focal).
ARG RUBY_IMAGE=rubylang/ruby:2.6.10-bionic

FROM ${RUBY_IMAGE} AS base

ENV RAILS_ENV=production \
    BUNDLE_WITHOUT=development:test \
    BUNDLE_PATH=/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

WORKDIR /app

# Runtime dependencies
RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      libpq5 \
     shared-mime-info \
      nodejs \
 && rm -rf /var/lib/apt/lists/*

# Match the repo's bundler version (Gemfile.lock -> BUNDLED WITH)
# This must be present in the *runtime* image because `bin/rails` loads `bin/spring`
# which requires Bundler before the app boots.
RUN gem install bundler -v 2.2.15

FROM base AS build

# Build dependencies
RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends \
      build-essential \
      git \
      libpq-dev \
 && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# Assets precompile usually needs SECRET_KEY_BASE even if it's just a dummy.
# Real value is provided at runtime via Fly secrets.
ENV SECRET_KEY_BASE=dummy_secret_key_base_please_override_in_fly_secrets_0123456789abcdef0123456789abcdef
RUN bundle exec rake assets:precompile

FROM base

COPY --from=build /bundle /bundle
COPY --from=build /app /app

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
