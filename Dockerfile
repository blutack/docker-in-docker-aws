
FROM docker:latest

#
# Install the AWS CLI using python/pip.
#
RUN apk add --no-cache --update python py-pip python3;
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

# Install fargate command
RUN wget https://github.com/blutack/fargate/releases/download/v0.2.4/fargate
RUN mv fargate /bin/fargate
RUN chmod +x /bin/fargate

# Install gettext for envsubst
RUN apk add --update gettext

#
# Install docker compose
#
RUN apk add python-dev libffi-dev openssl-dev gcc libc-dev make 
RUN pip install docker-compose

#
# Bootstrap folders which are usually setup using the `aws configure` command.
#
RUN mkdir ~/.aws;
