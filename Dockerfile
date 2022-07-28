# syntax=docker/dockerfile:1

FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem update --system && gem install bundler

WORKDIR /chatapp
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install

# Add entrypoint conditions
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-P", "3000"]
