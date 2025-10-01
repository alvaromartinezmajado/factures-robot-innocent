FROM alpine:3.18

# Install required packages
RUN apk add --no-cache \
    git \
    mariadb-client \
    bash \
    curl \
    openssh-client \
    dcron \
    inotify-tools

# Create working directory
WORKDIR /app

# Copy monitoring scripts
COPY scripts/ /app/scripts/
COPY entrypoint.sh /app/entrypoint.sh

# Make scripts executable
RUN chmod +x /app/scripts/*.sh /app/entrypoint.sh

# Set up git configuration
RUN git config --global user.name "InvoicePlane Auto-Sync" && \
    git config --global user.email "noreply@invoiceplane.local" && \
    git config --global init.defaultBranch main

# Create directory for SSH keys if needed
RUN mkdir -p /root/.ssh

ENTRYPOINT ["/app/entrypoint.sh"]