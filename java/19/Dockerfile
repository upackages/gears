# Copyright (c) 2022 Unately
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

FROM  --platform=$TARGETOS/$TARGETARCH eclipse-temurin:19

LABEL maintainer="hello@unately.com"
LABEL org.opencontainers.image.source https://github.com/upackages/gears
LABEL org.opencontainers.image.description "The headless version 19 of eclipse-temurin."
LABEL org.opencontainers.image.licenses=MIT

RUN apt-get update -y \
    && apt-get dist-upgrade -y \
 	&& apt-get install -y curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6 wget \
 	&& useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]
