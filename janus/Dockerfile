FROM ubuntu:20.04

LABEL maintainer="Sascha Böck <alpenflizzer@gmail.com>"

# Copy installation scripts in
COPY *.sh ./

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Vienna

# Prepare the system
RUN ./setup.sh
# Install dependencies
RUN ./dependencies.sh
# Install extras
RUN ./extras.sh
# Install libsrtp 2.3.0 (To reduce risk of broken interoperability with future WebRTC versions)
RUN ./libsrtp.sh
# Install usrsctp for data channel support
RUN ./usrsctp.sh
# Install websocket dependencies
RUN ./websockets.sh

# Copy the apache configuration files ready for when we need them
COPY apache2/*.conf ./
# Install and prepare apache
RUN ./apache.sh

# Clone, build and install the gateway
RUN ./janus.sh
# Put configs in place
COPY conf/*.jcfg /opt/janus/etc/janus/

# Declare the ports we use
#EXPOSE 10080 7088 7089 7188 7189 8088 8089 8188 8189
EXPOSE 10080 7088 8088 8188

# Define the default start-up command
CMD ./startup.sh
