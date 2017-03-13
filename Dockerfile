FROM phusion/baseimage:latest

MAINTAINER Totentanz604 "Totentanz604@mt2015.com"

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y wget curl python mercurial git sqlite3 mlocate sudo apt-utils mc vim screen man python-software-properties colordiff bash-completion apt-file  apt-transport-https ca-certificates && \
	apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
	echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list && \
	apt-get update && \
	apt-get install -y docker-engine=1.11.1-0~xenial docker-compose && \
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
	echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAkJwptsBKkijsniH4qzmJkTdyZkO/8RN1ta9l4rCbTGgKQKDXVmwFLlb2z9+7zE5Kl4cIoGUPUJAD/YrQ806XjjLih6Iio9AWLyL46h1L8D1J7o8E/LWwM+VnIQnaRUBtSVT5s2YG/eeLMhwMRyTA5MJskRKFDiJDjTlQ9rEb18YfZGMXa6zjpFc5RLYCoTh/1gfiF9MjkrbQURzG3nJhfEyF1lQVvXBr/uDGQq5QJSktLij+AWWGj++GWAuZr38mQm4SE5ugxg3MxGwmLkrS/HfR5Jf2ocixizddtJNGfZnmXhshYyae2iDVAavnkf36uRQJxkFPyoHEHj//1QkIU8LskNyvA5mE73JBSwtLxjavMGeNnmMv7vsOTy8Gcl5M/zyAoQaqWPoqE7eS8T54DeTmdv5fvWSxgkGDK/xDtqTi5qR0r4G9YBW2K30YmDSZitcjmDgtO+i7y4sumJ+BYpe+9+9KO3mXzeagMSqhX1FMi5l9IW9srDpkiyd5jEG9FYbsT7Kla69apM+a8LFXmLvm04yKuet1DLq3E4o1zXTqEtW3KxnYvk0QWwxWdm0m80L3dXGcZWEmroxXbKDlnAbHGjG+/UwDwWcOuVraJRYVs1a/nqZfvmKXx/EXWfmQIbI6rckO2yTEzumo+a2ogIqxp1xDcBErN3YAxe0+hak=  work@example.com" > /home/totentanz/.ssh/authorized_keys && \
	echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAkxvKp3RKx9MOH31rKyr9rkxyxJxNybNgFcRmg/D6mJpmmuWYeptB3NFqSVo+JhgZpZVGhpMCe9Kk3zNIuUDQ++VieWNR4/cXH4wfP4RO8btJ54xrxz2w/uK0UPNSRFju2cqPJs1zaUhszf+/Jd6IQFq6REcv2Aex2gpEyN+4Lv68NFjNmQ39Fgyxc8I++IC7utOJ7Ak00HMMPlAc+AQHBO/DGJCrLesP38tEv6DLRYhrYxUd0bp0Q8jvOwDlx56NBKNWYnMx+Sf0z4RijwubUhbKuxK3UGcVYaE34MaXP9CbWarQs+NeYravOD1HYV9e1Ym6zA1sTWXxHb0NUd0PzQ== work2@example.com" >> /home/totentanz/.ssh/authorized_keys && \
	rm -f /etc/service/sshd/down
