FROM ubuntu

RUN apt-get update 
RUN apt-get install -y curl gnupg gnupg2 gnupg1 build-essential

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# install truffle
RUN yarn global add truffle

WORKDIR /src
