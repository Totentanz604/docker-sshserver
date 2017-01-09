FROM phusion/baseimage:latest

MAINTAINER Totentanz604 "Totentanz604@mt2015.com"

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget curl python mercurial git sqlite3 mlocate sudo apt-utils mc vim screen man python-software-properties colordiff bash-completion apt-file
RUN rm -f /etc/service/sshd/down
