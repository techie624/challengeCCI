# Which OS base Image is being used
FROM ubuntu:18.04

#-----------------------------------------------------------------------------#
# Perform as root

USER root

#-----------------------------------------------------------------------------#
# Install node js

RUN apt-get update \
  && apt-get install -y curl vim nginx \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get install -y nodejs build-essential \
  && cd /etc/ nginx && git clone --depth 1 https://github.com/techie624/challengeCCI.git -b develop \
  && cp /etc/nginx/challengecci/nginx.conf /etc/nginx/nginx.conf \
  && service nginx start

#-----------------------------------------------------------------------------#
# Expose ports

EXPOSE 80

ENTRYPOINT ["/bin/bash"]