# linux/amd64 에뮬로 빌드/실행할 것
FROM python:3.7-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 로컬 휠 파일 복사
COPY wheels/tensorflow-1.15.0-cp37-cp37m-linux_x86_64.whl /wheels/tensorflow-1.15.0-cp37-cp37m-linux_x86_64.whl
COPY requirements.txt ./

# TensorFlow를 제외한 나머지 의존성 먼저 설치
RUN pip install --no-cache-dir -r requirements.txt

# no-AVX TensorFlow 1.15.0 설치
RUN pip install --no-cache-dir /wheels/tensorflow-1.15.0-cp37-cp37m-linux_x86_64.whl

# 소스 복사
COPY . .

ENV MPLBACKEND=Agg \
    PYTHONUNBUFFERED=1 \
    PYTHONFAULTHANDLER=1

CMD ["python", "Check_dependencies_laptop.py"]
