
FROM docker:latest

#
# Install the AWS CLI using python/pip.
#
RUN apk add --no-cache --update python py-pip;
RUN pip install awscli --ignore-installed six;

#
# Install the ecs-task-deploy CLI using nodejs.
#
RUN apk add --update nodejs nodejs-npm
RUN npm install -g ecs-task-deploy

#
# Install additional utils useful for deployments
#
RUN apk add --update curl
RUN apk add --update unzip

#
# Install docker compose
#
RUN curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

#
# Bootstrap folders which are usually setup using the `aws configure` command.
#
RUN mkdir ~/.aws;
