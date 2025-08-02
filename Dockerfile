FROM ubuntu:22.04

# 필요한 패키지 설치
RUN apt update && \
    apt install -y software-properties-common wget curl git openssh-client tmate python3 && \
    apt clean

# 웹 서버의 루트 디렉터리 생성 및 더미 페이지 추가
RUN mkdir -p /app
WORKDIR /app
RUN echo "Tmate Session is available. Check the logs for connection details." > index.html

# 위에서 만든 start.sh 파일을 컨테이너에 복사합니다.
COPY start.sh .

# start.sh 파일에 실행 권한을 부여합니다.
RUN chmod +x start.sh

# Railway가 컨테이너를 실행할 때 start.sh 스크립트를 실행하도록 설정합니다.
CMD ["./start.sh"]
