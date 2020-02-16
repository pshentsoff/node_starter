FROM node:alpine

RUN echo 'kernel.unprivileged_userns_clone=1' > /etc/sysctl.d/00-local-userns.conf \
	&& echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
	&& echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
	&& apk update && apk upgrade \
	&& apk add --no-cache \
	    sudo \
	    shadow \
	&& rm -rf /var/lib/apt/lists/* \
	/var/cache/apk/* \
	/usr/share/man \
	/tmp/*

WORKDIR /app

#RUN groupadd --gid 1000 node \
#  && useradd --uid 1000 --gid node \
#  	--shell /bin/sh --create-home node \
#  && chown -R node:node /app
#
USER node

COPY ./docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]
