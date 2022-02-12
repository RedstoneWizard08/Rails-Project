FROM gitpod/workspace-full

RUN sudo apt-get update && \
    sudo apt-get -y upgrade && \
    sudo apt-get -y install curl wget bash \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    nvm install 17 && \
    nvm use 17 && \
    sudo npm install --global npm jshint && \
    curl -sSL https://get.rvm.io | bash -s stable && \
    rvm get stable --auto-dotfiles && \
    gem install bundler rails
