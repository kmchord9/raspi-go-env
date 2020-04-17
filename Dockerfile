FROM resin/rpi-raspbian:stretch-20

RUN DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata
# timezone setting
ENV TZ=Asia/Tokyo 

RUN apt-get update && apt-get install -y --no-install-recommends \
  wget \
  vim \
  git-all \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

RUN wget https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz \
  && tar -C /usr/local -xzf go1.13.5.linux-amd64.tar.gz \
  && rm go1.13.5.linux-amd64.tar.gz 

ENV PATH $PATH:/usr/local/go/bin 

CMD /bin/bash 
