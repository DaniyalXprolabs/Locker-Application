FROM ruby:3.1.2

RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client yarn

ADD . /docker-locker-application

WORKDIR /docker-locker-application

RUN bundle install
# RUN rails webpacker:install
EXPOSE 3000

CMD ["bash"]
