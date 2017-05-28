FROM ruby:2.3.4

RUN apt-get update


ENV REDIS_HOST '172.17.0.3'
ENV REDIS_PORT '6379'
ENV RAILS_ENV 'production'
ENV APP_DIR /app
RUN mkdir -p $APP_DIR

WORKDIR $APP_DIR
COPY ./redis_app $APP_DIR
RUN bundle install
EXPOSE 3000
ENTRYPOINT puma -e production -d
