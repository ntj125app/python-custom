FROM python:3.13-slim

# Update and install dependencies
RUN apt-get update && apt-get install -y curl && apt-get upgrade -y && \
    apt-get autoclean -y
