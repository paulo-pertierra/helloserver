FROM docker:dind AS build

COPY . /app

WORKDIR /app

# Compile the Deno application

RUN docker build -t titopow/hello-srv .

# Push the image to Docker Hub

RUN docker push titopow/hello-srv

CMD ["tail", "-f", "/dev/null"]