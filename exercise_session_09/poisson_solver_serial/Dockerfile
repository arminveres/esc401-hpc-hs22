# FROM ubuntu:trusty
FROM ubuntu:bionic

RUN apt-get update && apt-get install -y --no-install-recommends \
    make \
    g++ \
    # python3 \
    # python3-pip \
    # python3-tk \
    && rm -rf /var/lib/apt/lists/*

# RUN python3 -m pip install --upgrade pip setuptools wheel
# RUN pip3 install pip numpy matplotlib tk

COPY . /poisson

RUN cd /poisson && make

WORKDIR /poisson

CMD ./main
