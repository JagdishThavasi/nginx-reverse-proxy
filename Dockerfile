# Use the Bitnami Nginx container image as the base image
FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/log/nginx 

# Set the logging to stdout (redirect logs to stdout)
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Start Nginx when the container runs
#CMD ["/opt/bitnami/scripts/nginx/entrypoint.sh"]

RUN chown 9000:9000 /etc/nginx/nginx.conf

RUN chown 9000:9000 /var/log/nginx 

USER 9000:9000


EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
