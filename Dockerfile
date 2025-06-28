# Use OpenJDK base image
FROM openjdk:17

# Create app directory
WORKDIR /app

# Copy source
COPY src /app

# Compile
RUN javac Hello.java

# Run
CMD ["java", "Hello"]
