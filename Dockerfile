FROM ubuntu:16.04

WORKDIR /build

RUN apt-get update

RUN apt-get install wget -y

RUN wget https://www.inet.no/dante/files/dante-1.4.2.tar.gz

RUN tar -xvf dante-1.4.2.tar.gz

WORKDIR /build/dante-1.4.2

RUN apt-get install libwrap0 libwrap0-dev -y
RUN apt-get install gcc make -y

RUN mkdir /home/dante
RUN ./configure --prefix=/home/dante
RUN make
RUN make install

WORKDIR /app

COPY ./danted.conf /etc/danted.conf

COPY ./startup.sh /app
RUN chmod +x ./startup.sh

RUN rm -rf /build

CMD [ "/app/startup.sh" ]