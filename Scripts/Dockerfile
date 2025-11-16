#DOCKER BUILD ARGUMENTS
ARG ARCH

#BASE IMAGE
FROM ${ARCH:-amd64}/ubuntu:24.04

#ARGUMENTS IN BUILD STAGE
ARG ARCH
ARG BUILDPLATFORM

#ENVIRONMENT
ENV TZ=Etc/UTC
#ENV FONTCONFIG_PATH=/etc/fonts

#INSTALL REQUIRED LIBRARIES
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y \
		tzdata \
		libunwind8 \
		libglib2.0 \
		libsoup2.4-1 \
		libpango-1.0-0 \
		fontconfig

#ADD APPLICATION TO DOCKER IMAGE
ADD / /app/

#EXPOSE PORT AND RUN APPLICATION
EXPOSE 80
WORKDIR /app
CMD ["sh", "-c", "/app/SudokuWeb"]
