FROM alpine:3.19

# Install dependencies
RUN apk add --no-cache \
    bash \
    git \
    python3 \
    py3-pip

# Install Python packages
RUN pip3 install --break-system-packages requests

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make it executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
