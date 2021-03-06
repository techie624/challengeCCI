# Which OS base Image is being used
FROM ubuntu:18.04

#-----------------------------------------------------------------------------#
# Perform as root

USER root

#-----------------------------------------------------------------------------#
# Install node js

RUN apt-get update \
  && apt-get install -y curl vim nginx git wget unzip libglib2.0-0 libnss3 libx11-6 \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get install -y nodejs build-essential \
  && cd /etc/nginx && git clone --depth 1 https://github.com/techie624/challengeCCI.git -b develop
RUN cp /etc/nginx/challengeCCI/nginx.conf /etc/nginx/nginx.conf \
  && service nginx start

#-----------------------------------------------------------------------------#
# install selenium

# RUN cd /etc/nginx/challengeCCI/ && \
#   npm install selenium-webdriver --save && \
#   wget http://chromedriver.storage.googleapis.com/88.0.4324.96/chromedriver_linux64.zip && \
#   unzip chromedriver_linux64.zip
# RUN bash chromeInit.sh

#-----------------------------------------------------------------------------#
# Expose ports

EXPOSE 80

#-----------------------------------------------------------------------------#
# Create entrypoint

#USER root
RUN touch /docker-entrypoint.sh
RUN echo '#!/usr/bin/env bash' >> /docker-entrypoint.sh
RUN echo "service nginx restart" >> /docker-entrypoint.sh
RUN echo "/bin/bash" >> /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh

ENTRYPOINT ["bash", "/docker-entrypoint.sh"]

