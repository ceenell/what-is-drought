FROM artifactory.wma.chs.usgs.gov/docker-official-mirror/debian:stretch

LABEL maintainer="gw-w_vizlab@usgs.gov"

# Run updates and install curl
RUN apt-get update && \
      apt-get upgrade -y && \
      apt-get install curl -y && \
      apt-get purge -y --auto-remove && \
      apt-get clean

# Enable the NodeSource repository and install the latest nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
      apt-get install nodejs -y

# Create temp directory for building viz app
RUN mkdir -p /tmp/what-is-drought

# Copy source code
WORKDIR /tmp/what-is-drought
COPY . .
# Set environment variables for build target and tile source and then run config.sh
ARG BUILDTARGET="test"
ARG VUE_BUILD_MODE="development"
ENV E_BUILDTARGET=$BUILDTARGET
ENV E_VUE_BUILD_MODE=$VUE_BUILD_MODE

# Build the Vue app.
RUN npm install
RUN chmod +x ./build.sh && ./build.sh

