FROM ruby:3.3-slim

ENV RAILS_ENV=development \
    RACK_ENV=development \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    LANG=C.UTF-8

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    curl \
    ca-certificates \
    git \
    tzdata \
    imagemagick \
    libpq-dev \
    libyaml-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN gem install bundler

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN if [ -d bin ]; then chmod +x bin/* || true; fi

EXPOSE 3000

CMD ["bash", "-lc", "bin/rails db:prepare && bin/rails server -b 0.0.0.0 -p 3000"]
