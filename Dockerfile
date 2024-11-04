# Build stage
FROM denoland/deno:latest as build

COPY . /app

WORKDIR /app

# Compile the Deno application
RUN deno compile --unstable --allow-net --allow-read --allow-env --allow-write --output=hello-srv main.ts

# Start from a minimal Debian image
FROM debian:bullseye-slim

# Copy the binary from the build stage
COPY --from=build /app/hello-srv /hello-srv

# Export the port
EXPOSE 8000

# Run the binary
CMD ["/hello-srv"]
