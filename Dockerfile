FROM ruby:3.1.2

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN apt-get update -qq && apt-get install -y zlib1g-dev build-essential libssl-dev \
    libreadline-dev libyaml-dev libxml2-dev libxslt1-dev \
    libcurl4-openssl-dev software-properties-common nodejs yarn libffi-dev

RUN gem install bundler
RUN bundle install

COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoints/web-entrypoint.sh /usr/bin/web-entrypoint.sh
RUN chmod +x /usr/bin/web-entrypoint.sh
ENTRYPOINT ["sh", "/usr/bin/web-entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]