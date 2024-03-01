FROM maven:amazoncorretto as build
WORKDIR /javaapp
COPY . .
RUN mvn clean install

FROM openjdk:9
WORKDIR /app
COPY --from=build /java/target/gs-maven-0.1.0.jar app.jar
EXPOSE 8099
CMD ["java", "-jar", "app.jar"]
