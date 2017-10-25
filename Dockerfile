# Create image based on the official Node 6 image from dockerhub
FROM node:6
MAINTAINER Patrick Ryan <pjryan126@gmail.com>

# Create the group and user to be used in this container
RUN groupadd angulargroup && useradd -m -g angulargroup -s /bin/bash angular

# Create a directory where our app will be placed
RUN mkdir -p /home/angular/project

# Change directory so that our commands run inside this new directory
WORKDIR /home/angular/project

# Copy dependency definitions
COPY ./project /home/angular/project/

# serve application on configured port
RUN sed -i "s/ng serve/ng serve --port ${PORT}/" /home/angular/project/package.json

# Install dependecies
RUN npm install

RUN chown -R angular:angulargroup /home/angular

USER node