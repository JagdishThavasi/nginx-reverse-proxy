# Use the Bitnami Nginx container image as the base image
FROM bitnami/nginx:latest

# Install curl for health check and jq for JSON manipulation

#RUN apt-get update && apt-get install -y jq && apt-get clean


# Copy a custom Nginx configuration file
COPY nginx.conf /opt/bitnami/nginx/conf/nginx.conf

# Expose the HTTP and HTTPS ports (if needed)
EXPOSE 80
# EXPOSE 443

# Set the logging to stdout (redirect logs to stdout)
RUN ln -sf /dev/stdout /opt/bitnami/nginx/logs/access.log \
    && ln -sf /dev/stderr /opt/bitnami/nginx/logs/error.log

# Start Nginx when the container runs
CMD ["/opt/bitnami/scripts/nginx/entrypoint.sh"]
