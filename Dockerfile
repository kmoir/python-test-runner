FROM ubuntu:vivid

RUN apt-get -q update \
    && apt-get install --yes -q \
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
    software-properties-common \
    && apt-get clean

RUN add-apt-repository --yes ppa:fkrull/deadsnakes
RUN apt-get -q update \
    && apt-get install --yes -q \
    python2.6 \
    python2.6-dev \
    && apt-get clean

# Ubuntu's virtualenv.py uses same new-style formatting that Python 2.6 doesn't support.
# We need to revert that for Python 2.6 to function correctly with it.
RUN sed -i -e 's,{}-\*.whl,{0}-*.whl,' /usr/lib/python3/dist-packages/virtualenv.py
