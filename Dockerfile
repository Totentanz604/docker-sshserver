FROM phusion/baseimage:latest

LABEL maintainer="totentech@gmail.com"

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget curl python mercurial git sqlite3 mlocate sudo apt-utils mc vim screen man python-software-properties colordiff bash-completion apt-file apt-transport-https ca-certificates mono-complete traceroute net-tools
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get install -y docker-engine=1.11.1-0~xenial docker-compose
RUN bash -c "`curl -sL https://raw.githubusercontent.com/michaelsauter/crane/master/download.sh`" && sudo mv crane /usr/local/bin/crane
RUN adduser --disabled-password --gecos "" totentanz
RUN echo "totentanz\tALL=(ALL:ALL) NOPASSWD: ALL\n" > /etc/sudoers.d/totentanz
RUN chmod 0440 /etc/sudoers.d/totentanz
RUN mkdir /home/totentanz/.ssh
RUN chown totentanz:totentanz /home/totentanz/.ssh
RUN chmod 0770 /home/totentanz/.ssh
RUN echo "colorscheme elflord" > /home/totentanz/.vimrc
RUN echo "syntax on" >> /home/totentanz/.vimrc
RUN echo "set hlsearch" >> /home/totentanz/.vimrc
RUN echo "set so=7" >> /home/totentanz/.vimrc
RUN echo "set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c" >> /home/totentanz/.vimrc
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAg2C8l300CFqZ4S5MIwP2TbuClQ43DZD2SOCmWvAEn/f+GlK4OOyFuN7CvJc19B27iEkiu46lWonLcVhVSt7n8v7oP8vGFVFOAE3CsPzOZlgKcFack/3bYAQ0YGH8M1NSIDhVY6YUAWEwpgYBcRShlRy13FI3I9yZ+DVhHycjBeq8Gp6S/6KBI6+166fKORbuXqSmeRasMn3I25AfFBuy2wGdgcyLc3jCBNbor11eknjUjif49Kr4109+zgfPIJP7DONzHYw+z5tIUa4YJBwUOU9c0UNOWkoOyATu8VdPJUEu7Dg74c7RqTWQU+mxcNKX2HQ1gKXEdAeBFLmxeJkFpw== Totentanz@TOTENTANZ-PC" >> /home/totentanz/.ssh/authorized_keys
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAwc1GIcOy0WP9NNl8BvDiJ4Kgz43V2Ops8lZJpJj9zrD9csuNOlNYmMnZM7x1XSE9oq5D0yPCC8QzbbPaIxmgoaISog+ZtqkhYeeC/vi/4oaLSOxbfvNTZYQjE3tArP06Ah7kqJpoNc5m5jTkXrRxNUWD5Mz3yRIE86H6muub16e/PMFOWOcsf3RmcyKS8nwGjKRsf4Jegt8yOSun8DS55KE9pUTlmY+W+mDQVkfKH5akoQ0dEhEdJdWgUZogChZaRHDy3y2A6OALS65IBY4O6UqlDKuXOZBliz5gO8RRnekHy9mlB4OW5HwckMOZZwfRtEvNvPE/l3zlqB842RdFZQ== Totentanz@TOTENTANZ-PC" >> /home/totentanz/.ssh/authorized_keys
RUN echo "set number" >> /home/totentanz/.vimrc
RUN rm -f /etc/service/sshd/down
RUN chown totentanz:totentanz /home/totentanz/.bashrc
