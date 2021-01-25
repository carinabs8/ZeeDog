FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs
RUN mkdir /ZeeDog
WORKDIR /ZeeDog
COPY Gemfile /ZeeDog/Gemfile
COPY Gemfile.lock /ZeeDog/Gemfile.lock
RUN bundle install
COPY . /ZeeDog

COPY entrypoint.sh /usr/bin
ENTRYPOINT ["entrypoint.sh"]
RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
