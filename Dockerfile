FROM ruby:2.7.8

RUN gem install bundler -v 1.17.3

WORKDIR /usr/src/app
ADD . /usr/src/app

RUN bundle install

ENV RACK_ENV production

ENTRYPOINT ["rackup", "-o", "0.0.0.0"]