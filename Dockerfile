FROM ubuntu:vivid

RUN apt-get -q update
RUN apt-get install --yes -q \
    git \
    mercurial \
    python-dev \
    python3-dev \
    python-tox \
    pypy \
    python-pip \
    python3-pip \
    libffi-dev \
    libssl-dev \
    libyaml-dev \
    libmysqlclient-dev \
    curl \
    wget \
    && apt-get clean
