# Apple Silicon을 위한 python 3.7 용 ME203 docker 폴더

## 1. Docker 설치

[docker 설치 url](https://docs.docker.com/desktop/setup/install/mac-install/)

## 2. no-AVX Tensorflow 설치

[tensorflow 1.15.0 설치](https://app.box.com/s/spuank3te8y19uffoi7jk7y0jyvk75pm)

설치 후 파일은 wheels 폴더로 직접 이동 혹은 아래 커맨드 입력

```bash
mv ~/Downloads/tensorflow-1.15.0-cp37-cp37m-linux_x86_64.whl ./wheels/
```

## 3. docker 실행

```bash
docker-compose up --build
```

## 4. (optional) 인터랙티브 쉘 접속

```bash
docker-compose run --rm mecha bash
```

---

```bash
# build 완료후
python Check_dependencies_laptop.py
```

```bash
# 쉘 탈출
exit
```
