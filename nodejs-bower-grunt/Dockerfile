FROM google/nodejs:0.10.32
MAINTAINER Truc Nguyen <truc.nguyen@bonitasoft.com>

# Install vim
RUN apt-get -y install vim

# Install Bower & Grunt
RUN npm install -g bower grunt-cli

# Define working directory.
WORKDIR /app

# Expose HTTP port
EXPOSE 3000

# Define default command.
CMD ["bash"]
