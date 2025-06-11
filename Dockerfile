# Use Official image of Nginx, taking its version 1.27 as a base.
FROM debian:latest

# Update package list and install git.
RUN apt update && apt install git -y

# Install nginx server.
RUN apt install nginx -y

# Set up of the working directory within the container.
WORKDIR /usr/share/nginx/html

# Clone github repository and move the files to the working directory that has been previously configured.
RUN git clone https://github.com/djesuscp/testExamenDAWpage && \ 
    mv /usr/share/nginx/html/testExamenDAWpage/* /var/www/html

# Set up entrypoint.
CMD ["nginx", "-g", "daemon off;"]
