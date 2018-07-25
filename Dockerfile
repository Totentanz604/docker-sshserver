FROM phusion/baseimage:latest

LABEL maintainer="totentech@gmail.com"

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y wget curl python mercurial git sqlite3 mlocate sudo apt-utils mc vim screen man python-software-properties colordiff bash-completion apt-file apt-transport-https ca-certificates mono-complete traceroute net-tools && \
	apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
	echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list && \
	apt-get update && \
	apt-get install -y docker-engine=1.11.1-0~xenial docker-compose && \
	bash -c "`curl -sL https://raw.githubusercontent.com/michaelsauter/crane/master/download.sh`" && sudo mv crane /usr/local/bin/crane && \
	adduser --disabled-password --gecos "" totentanz && \
	echo "totentanz\tALL=(ALL:ALL) NOPASSWD: ALL\n" > /etc/sudoers.d/totentanz && \
    chmod 0440 /etc/sudoers.d/totentanz && \
    mkdir /home/totentanz/.ssh && \
    chown totentanz:totentanz /home/totentanz/.ssh && \
    chmod 0770 /home/totentanz/.ssh && \
	echo "colorscheme elflord" > /home/totentanz/.vimrc && \
	echo "syntax on" >> /home/totentanz/.vimrc && \
	echo "set hlsearch" >> /home/totentanz/.vimrc && \
	echo "set so=7" >> /home/totentanz/.vimrc && \
	echo "set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c" >> /home/totentanz/.vimrc && \
	echo "set number" >> /home/totentanz/.vimrc && \
	echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAwc1GIcOy0WP9NNl8BvDiJ4Kgz43V2Ops8lZJpJj9zrD9csuNOlNYmMnZM7x1XSE9oq5D0yPCC8QzbbPaIxmgoaISog+ZtqkhYeeC/vi/4oaLSOxbfvNTZYQjE3tArP06Ah7kqJpoNc5m5jTkXrRxNUWD5Mz3yRIE86H6muub16e/PMFOWOcsf3RmcyKS8nwGjKRsf4Jegt8yOSun8DS55KE9pUTlmY+W+mDQVkfKH5akoQ0dEhEdJdWgUZogChZaRHDy3y2A6OALS65IBY4O6UqlDKuXOZBliz5gO8RRnekHy9mlB4OW5HwckMOZZwfRtEvNvPE/l3zlqB842RdFZQ== Totentanz@TOTENTANZ-PC" >> /home/totentanz/.ssh/authorized_keys && \
	rm -f /etc/service/sshd/down && \
    sudo -u totentanz -H mkdir /home/totentanz/dev && \
    sudo -u totentanz -H git clone https://github.com/banga/powerline-shell /home/totentanz/dev/powerline-shell && \
    cd /home/totentanz/dev/powerline-shell && \
    sudo -u totentanz -H ./install.py && \
    echo "function _update_ps1() {  PS1=\"\$(~/dev/powerline-shell/powerline-shell.py \$? 2> /dev/null)\"; }" >> /home/totentanz/.bashrc && \
    echo "if [ \"\$TERM\" != linux ]; then PROMPT_COMMAND=\"_update_ps1; \$PROMPT_COMMAND\"; fi" >> /home/totentanz/.bashrc && \
    chown totentanz:totentanz /home/totentanz/.bashrc
