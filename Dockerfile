FROM ruby:2.5.9-alpine
RUN apk add \
    build-base \
    postgresql-dev \
    tzdata \
    nodejs
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
