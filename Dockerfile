# 1. Bun 공식 이미지를 기반으로 시작합니다.
FROM oven/bun:1

# 2. 작업 디렉토리를 /app으로 설정합니다.
WORKDIR /app

# 3. 의존성 파일을 먼저 복사합니다. (Docker 캐시를 활용해 빌드 속도 향상)
COPY package.json ./

# 4. Bun을 이용해 의존성을 설치합니다.
RUN bun install

# 5. 나머지 프로젝트 소스 코드를 복사합니다.
COPY . .

# 6. Astro 개발 서버가 사용하는 4321 포트를 외부에 노출합니다.
EXPOSE 4321

# 7. 컨테이너가 시작될 때 기본으로 실행할 명령어를 정의합니다.
# "bun run dev"는 Astro 개발 서버를 실행하며, --host 옵션으로 모든 네트워크에서 접속을 허용합니다.
CMD ["bun", "run", "dev", "--host"]