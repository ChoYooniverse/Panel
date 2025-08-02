# 기존의 Ubuntu 22.04 이미지 사용
FROM ubuntu:22.04

# 필요한 패키지 설치
RUN apt update && \
    apt install -y software-properties-common wget curl git openssh-client tmate python3 && \
    apt clean

# 웹 서버의 루트 디렉터리 생성 및 더미 페이지 추가
RUN mkdir -p /app
WORKDIR /app
RUN echo "Tmate Session is available. Check the logs for connection details." > index.html

# 컨테이너가 노출할 포트 지정
EXPOSE 6080

# 웹 서버를 메인 프로세스로 실행하고, 백그라운드에서 Tmate 실행
CMD python3 -m http.server 6080 & \
    tmate -F && \
    wait
