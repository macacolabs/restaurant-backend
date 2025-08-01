# 🛒 Spring Boot REST API - E-Commerce Backend

> Next.js와 React.js를 위한 RESTful API 서버

[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.4-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://www.oracle.com/java/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-blue.svg)](https://www.mysql.com/)
[![JWT](https://img.shields.io/badge/JWT-Auth-green.svg)](https://jwt.io/)
[![Docker](https://img.shields.io/badge/Docker-Supported-blue.svg)](https://www.docker.com/)

## 📋 프로젝트 개요

이 프로젝트는 **Spring Boot 3.x** 기반의 RESTful API 서버로 백엔드 시스템을 제공합니다. JWT 기반 인증, 상품 관리, 주문 처리, 리뷰 시스템 등의의 기능을 구현하고 있습니다.

### ✨ 주요 특징

- 🔐 **JWT 기반 인증 시스템**
- 🛍️ **완전한 상품 관리 시스템** (CRUD, 검색, 카테고리별 조회)
- 📦 **주문 및 구매 처리**
- ⭐ **상품 리뷰 시스템**
- 🖼️ **이미지 업로드 및 관리**
- 📄 **페이징 처리**
- 🌐 **CORS 설정**
- 🐳 **Docker 지원**
- ☁️ **AWS Elastic Beanstalk 배포 지원**

## 🛠️ 기술 스택

### Backend

- **Framework**: Spring Boot 3.5.4
- **Language**: Java 17
- **Security**: Spring Security + JWT
- **Database**: MySQL 8.0
- **ORM**: Spring Data JPA + Hibernate
- **Build Tool**: Gradle

### Libraries & Dependencies

- **JWT**: JJWT 0.9.1
- **Object Mapping**: ModelMapper 3.1.1
- **File Processing**: Commons IO 2.11.0
- **Annotation Processing**: Lombok
- **Testing**: JUnit 5 + Spring Security Test

### DevOps & Deployment

- **Containerization**: Docker
- **Cloud Platform**: AWS Elastic Beanstalk
- **Database**: AWS RDS (MySQL)
- **File Storage**: Static Resources

## 🏗️ 프로젝트 구조

```
src/main/java/com/ohgiraffers/restapi/
├── auth/                     # 인증 및 보안 관련
│   ├── config/              # 설정 클래스
│   ├── filter/              # 인증 필터
│   ├── handler/             # 인증 핸들러
│   └── interceptor/         # JWT 인터셉터
├── common/                  # 공통 클래스
│   ├── Criteria.java        # 페이징 기준
│   ├── PageDTO.java         # 페이지 정보
│   ├── PagingResponseDTO.java
│   └── ResponseDTO.java     # 공통 응답 형식
├── exception/               # 예외 처리
├── member/                  # 회원 관리
│   ├── controller/         # 회원/인증 컨트롤러
│   ├── dto/                # 회원 DTO
│   ├── entity/             # 회원 엔티티
│   ├── repository/         # 회원 레포지토리
│   └── service/            # 회원 서비스
├── product/                 # 상품 관리
│   ├── controller/         # 상품 컨트롤러
│   ├── dto/                # 상품 DTO
│   ├── entity/             # 상품 엔티티
│   ├── repository/         # 상품 레포지토리
│   └── service/            # 상품 서비스
├── purchase/                # 주문 관리
├── review/                  # 리뷰 관리
└── util/                    # 유틸리티 클래스
```

## 🔌 API 엔드포인트

### 🔐 인증 (Authentication)

| Method | Endpoint       | Description | Auth Required |
| ------ | -------------- | ----------- | ------------- |
| `POST` | `/auth/signup` | 회원가입    | ❌            |
| `POST` | `/auth/login`  | 로그인      | ❌            |

### 👤 회원 (Member)

| Method | Endpoint                     | Description    | Auth Required |
| ------ | ---------------------------- | -------------- | ------------- |
| `GET`  | `/api/v1/members/{memberId}` | 회원 정보 조회 | ✅            |

### 🛍️ 상품 (Product)

| Method | Endpoint                              | Description               | Auth Required |
| ------ | ------------------------------------- | ------------------------- | ------------- |
| `GET`  | `/api/v1/products`                    | 상품 목록 조회 (페이징)   | ❌            |
| `GET`  | `/api/v1/products/{productCode}`      | 상품 상세 조회            | ❌            |
| `GET`  | `/api/v1/products/search?s={keyword}` | 상품 검색                 | ❌            |
| `GET`  | `/api/v1/products/meals`              | 식사 카테고리 상품 조회   | ❌            |
| `GET`  | `/api/v1/products/dessert`            | 디저트 카테고리 상품 조회 | ❌            |

### 📦 주문 (Order)

| Method | Endpoint                      | Description         | Auth Required |
| ------ | ----------------------------- | ------------------- | ------------- |
| `POST` | `/api/v1/purchase`            | 상품 주문           | ✅            |
| `GET`  | `/api/v1/purchase/{memberId}` | 회원 주문 내역 조회 | ✅            |

### ⭐ 리뷰 (Review)

| Method | Endpoint                        | Description    | Auth Required |
| ------ | ------------------------------- | -------------- | ------------- |
| `POST` | `/api/v1/reviews`               | 상품 리뷰 등록 | ✅            |
| `GET`  | `/api/v1/reviews/{productCode}` | 상품 리뷰 조회 | ❌            |

### 📄 API 응답 형식

모든 API는 다음과 같은 공통 응답 형식을 사용합니다:

```json
{
  "status": "OK",
  "message": "조회 성공",
  "data": {
    // 실제 데이터
  }
}
```

## ⚙️ 환경 설정

### 1. 필수 요구사항

- Java 17+
- MySQL 8.0+
- Gradle 7.0+

### 2. 환경 변수 설정

개발 환경에 따라 다음 환경 변수를 설정하세요:

```bash
# 데이터베이스 설정
SPRING_DATASOURCE_URL=jdbc:mysql://localhost:3306/sample
SPRING_DATASOURCE_USERNAME=your_username
SPRING_DATASOURCE_PASSWORD=your_password

# 이미지 베이스 URL
IMAGE_BASE_URL=http://localhost:8080

# CORS 설정
CORS_ALLOWED_ORIGINS=http://localhost:3000,http://localhost:3001
```

### 3. application.yml 설정

주요 설정 항목들:

```yaml
spring:
  datasource:
    url: ${SPRING_DATASOURCE_URL:jdbc:mysql://localhost:3306/test}
    username: ${SPRING_DATASOURCE_USERNAME:user}
    password: ${SPRING_DATASOURCE_PASSWORD:password}
    driver-class-name: com.mysql.cj.jdbc.Driver

  jpa:
    hibernate:
      ddl-auto: none
    properties:
      hibernate:
        dialect: org.hibernate.dialect.MySQL8Dialect
        show_sql: true
        format_sql: true

jwt:
  key: your-jwt-secret-key
  time: 1800000 # 30분
```

## 🚀 실행 방법

### 로컬 개발 환경

1. **프로젝트 클론**

```bash
git clone <repository-url>
cd springboot-restapi
```

2. **데이터베이스 설정**

```bash
# MySQL 서버 시작
mysql -u root -p

# 데이터베이스 생성
CREATE DATABASE springreact;

# 초기 데이터 입력
mysql -u root -p springreact < initdb/01-init.sql
```

3. **애플리케이션 실행**

```bash
# Gradle을 사용한 실행
./gradlew bootRun

# 또는 JAR 파일 빌드 후 실행
./gradlew build
java -jar build/libs/springboot-restapi-0.0.1-SNAPSHOT.jar
```

## ☁️ AWS 배포

### AWS Elastic Beanstalk 배포

1. **필수 AWS 서비스 설정**

   - RDS MySQL 인스턴스 생성
   - Elastic Beanstalk 환경 생성

2. **환경 변수 설정**

   Elastic Beanstalk 콘솔에서 다음 환경 변수를 설정:

   ```
   SPRING_DATASOURCE_URL=jdbc:mysql://your-rds-endpoint:3306/test
   SPRING_DATASOURCE_USERNAME=your-db-username
   SPRING_DATASOURCE_PASSWORD=your-db-password
   IMAGE_BASE_URL=http://your-app-url.elasticbeanstalk.com
   CORS_ALLOWED_ORIGINS=http://your-frontend-domain.com
   ```

3. **배포**

```bash
# JAR 파일 빌드
./gradlew build

# Elastic Beanstalk에 배포
# (AWS CLI 또는 콘솔을 통해 업로드)
```

## 🗄️ 데이터베이스 스키마

### 주요 테이블

- **TBL_MEMBER**: 회원 정보
- **TBL_AUTHORITY**: 권한 정보
- **TBL_MEMBER_ROLE**: 회원-권한 관계
- **TBL_PRODUCT**: 상품 정보
- **TBL_CATEGORY**: 상품 카테고리
- **TBL_ORDER**: 주문 정보
- **TBL_REVIEW**: 상품 리뷰

상세한 스키마는 `initdb/01-init.sql` 파일을 참조하세요.

## 🔒 보안

- **JWT 기반 인증**: Stateless 인증 방식
- **BCrypt 패스워드 암호화**: 안전한 비밀번호 저장
- **CORS 설정**: 특정 도메인만 허용
- **SQL Injection 방지**: JPA/Hibernate 사용

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
