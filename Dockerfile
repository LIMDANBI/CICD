FROM ubuntu:22.04

# apt 패키지 설치시 사용자 상호 작용 방지
ARG DEBIAN_FRONTEND=noninteractive

# 필요한 tool 설치
RUN apt-get update && \
    apt-get -y install build-essential vim git gcc cmake