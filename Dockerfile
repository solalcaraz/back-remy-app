FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

COPY . .

RUN chmod +x ./gradlew
RUN ./gradlew build -x test

RUN rm build/libs/*-plain.jar

EXPOSE 8080

CMD ["sh", "-c", "java -jar build/libs/*.jar"]