FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    bash \
    curl \
    wget \
    nano \
    git \
    python3 \
    python3-pip \
    openssh-server \
    sudo \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install ttyd
RUN wget -O /usr/local/bin/ttyd \
    https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 \
    && chmod +x /usr/local/bin/ttyd

RUN useradd -m -s /bin/bash user && \
    echo "user:user" | chpasswd && \
    adduser user sudo

RUN mkdir /run/sshd

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 7681

CMD ["/start.sh"]
