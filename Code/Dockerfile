#!/bin/bash

FROM gradle:6.3.0-jdk11
RUN mkdir fitervari_backend
COPY fitervari_backend /fitervari_backend
WORKDIR /fitervari_backend
RUN chmod +x gradlew
RUN ./gradlew build
EXPOSE 8080
RUN echo "Quarkus is UP"
