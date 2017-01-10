FROM docker:latest

# Update and Install Packages
RUN apk update && apk fetch \
    apache-ant \
    openssh-client \
    rsync \
    && rm -rf /var/cache/apk/*

# Disable host key checking from within builds as we cannot interactively accept them
# TODO: It might be a better idea to bake ~/.ssh/known_hosts into the container
RUN mkdir -p ~/.ssh
RUN printf "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

