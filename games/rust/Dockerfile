# Copyright (c) 2022 Unately
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

FROM --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL maintainer="hello@unately.com"
LABEL org.opencontainers.image.source https://github.com/upackages/gears
LABEL org.opencontainers.image.description "The game image for the Rust game."
LABEL org.opencontainers.image.licenses=MIT

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 \
	&& apt update \
	&& apt upgrade -y \
	&& apt install -y lib32gcc-s1 lib32stdc++6 unzip curl iproute2 tzdata libgdiplus libsdl2-2.0-0:i386 \
	&& curl -sL https://deb.nodesource.com/setup_14.x | bash - \
	&& apt install -y nodejs \
	&& mkdir /node_modules \
	&& npm install --prefix / ws \
	&& useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
COPY ./wrapper.js /wrapper.js

CMD [ "/bin/bash", "/entrypoint.sh" ]
