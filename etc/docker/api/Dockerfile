FROM ruby:2.6.4-alpine

RUN apk update && \
    apk add --update nodejs nodejs-npm && \
    apk add --no-cache bash tzdata libxml2-dev curl-dev make gcc libc-dev g++ mariadb-dev mysql-client

ENV BUNDLE_PATH=/bundle

RUN mkdir /app
WORKDIR /app

COPY ./api/src/Gemfile ./Gemfile
COPY ./api/src/Gemfile.lock ./Gemfile.lock

RUN gem install bundler & bundle install  && \
    rm -rf /usr/local/bundle/cache/* /usr/local/share/.cache/* /var/cache/* /tmp/*
ADD ./api/src /app
ADD ./etc/docker/api/entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["bundle", "exec", "rails", "db:create"]
CMD ["bundle", "exec", "rails", "db:migrate"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
