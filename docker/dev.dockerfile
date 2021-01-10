FROM python:3.8.6

RUN apt-get update -y && \
  apt-get install --no-install-recommends -y -q \
  git libpq-dev python-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install -U pip
RUN pip install dbt

RUN useradd -ms /bin/bash dbt
USER dbt

WORKDIR /home/dbt/app