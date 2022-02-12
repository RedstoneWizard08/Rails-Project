FROM gitpod/workspace-full

RUN sudo apt-get update && \
    sudo apt-get -y upgrade && \
    sudo apt-get -y install curl wget bash

SHELL [ "/bin/bash", "-c" ]

RUN curl -fSsL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    source $HOME/.bashrc && \
    export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
    nvm install 17 && \
    nvm use 17 && \
    source $HOME/.bashrc && \
    export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
    npm install --global npm jshint

WORKDIR [ "/home/gitpod" ]

RUN cd $HOME && \
    curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles && \
    source $HOME/.bashrc && \
    export PATH="$PATH:$HOME/.rvm/bin" && \
    rvm get stable --auto-dotfiles && \
    source $HOME/.bashrc && \
    sudo chmod -R a+rwx /workspace && \
    rvm install 3.0.3 && \
    rvm use 3.0.3

ENV PATH="$PATH:$HOME/.rvm/bin:$HOME/.rvm/rubies/ruby-3.0.3/bin"

RUN source $HOME/.bashrc && \
    export PATH="$PATH:$HOME/.rvm/bin:$HOME/.rvm/rubies/ruby-3.0.3/bin" && \
    PATH="$PATH:$HOME/.rvm/bin:$HOME/.rvm/rubies/ruby-3.0.3/bin" && \
    gem install bundler rails solargraph bcrypt colorize io securerandom
