#!/bin/bash

# Tmate 세션을 백그라운드에서 시작합니다.
tmate -F &

# Railway가 제공하는 PORT 환경 변수를 사용해서 Python 웹 서버를 실행합니다.
# PORT 변수가 없으면 기본값으로 6080을 사용합니다.
python3 -m http.server ${PORT:-6080}
