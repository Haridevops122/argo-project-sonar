FROM eclipse-temurin:21-jre

# Create non-root user
RUN useradd -r -u 1001 -g root appuser

WORKDIR /app

COPY --chown=appuser:root target/java-devops-app-0.0.1-SNAPSHOT.jar app.jar

# Run application as non-root user
USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
