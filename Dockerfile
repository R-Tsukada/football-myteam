FROM ruby:3.3.0-bookworm

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client yarn

WORKDIR /football-myteam
COPY Gemfile /football-myteam/Gemfile
COPY Gemfile.lock /football-myteam/Gemfile.lock
RUN bundle install

COPY package.json /football-myteam/package.json
COPY yarn.lock  /football-myteam/yarn.lock
RUN rm -rf node_modules
RUN yarn install --check-files
RUN yarn playwright install-deps && \
    yarn playwright install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
