FROM ruby:3.1.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client yarn

WORKDIR /football
COPY Gemfile /football/Gemfile
COPY Gemfile.lock /football/Gemfile.lock
RUN bundle install

COPY package.json /football/package.json
COPY yarn.lock  /football/yarn.lock
RUN yarn install --check-files
RUN bundle exec rails webpacker:install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
