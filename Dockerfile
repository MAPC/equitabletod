FROM ruby:2.0.0-p648

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp


# Compile Assets
RUN bundle exec rake assets:precompile

# Add a script to be executed every time the container starts.
COPY /bin/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
