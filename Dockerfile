# OpenJDK 17 기반 이미지 사용
FROM openjdk:17-jdk-slim

# 작업 디렉토리 설정
WORKDIR /app

# Gradle Wrapper와 build.gradle 복사
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .

# 소스 코드 복사
COPY src src

# Gradle build (테스트 제외)
RUN chmod +x ./gradlew
RUN ./gradlew bootJar -x test

# JAR 파일을 app.jar로 복사
RUN cp build/libs/*.jar app.jar

# 포트 노출
EXPOSE 8001

# 애플리케이션 실행
CMD ["java", "-jar", "app.jar"]