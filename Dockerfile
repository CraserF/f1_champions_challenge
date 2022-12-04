# Install OS
FROM ubuntu:latest AS build-env

# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget
# Install Flutter
RUN git clone https://github.com/flutter/flutter.git
ENV PATH="$PATH:/flutter/bin"
RUN flutter channel stable
# Run basic check to download Dark SDK
RUN flutter doctor
# Copy current env
RUN flutter config --enable-web
# Copy files to container and build
USER root
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web
# Stage 2 - Create the run-time image
FROM nginx:alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/
EXPOSE 3000
