echo 'FROM  phusion/baseimage:0.10.0' > Dockerfile
echo 'CMD   ["/sbin/my_init"]' >> Dockerfile
echo 'RUN  apt-get update && apt-get install -y wget curl\' >> Dockerfile
echo '&& curl -sL https://deb.nodesource.com/setup_10.x | bash\' >> Dockerfile
echo '&& apt-get  install -y nodejs git-core\' >> Dockerfile
echo '&& npm install pm2 -g --no-optional && npm install yarn@1.9.4 -g \' >> Dockerfile
echo '&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*' >> Dockerfile
echo 'COPY . /var/www/node' >> Dockerfile
echo 'RUN chmod -R 777 var/www/node /var/log/ \' >> Dockerfile
echo '&& useradd -m node && mkdir /var/log/nodejs && chown -R node:node /var/www/node /var/log/cd /var/www/node && /sbin/setuser node yarn install && /sbin/setuser node yarn build:tsoa' >> Dockerfile
echo 'EXPOSE 3030' >> Dockerfile
echo 'RUN mkdir /etc/service/pm2 && chmod -R 777 /etc/service/pm2' >> Dockerfile
echo 'ADD ./scripts/pm2.sh /etc/service/pm2/run' >> Dockerfile
echo 'RUN chmod -R 777 /etc/service/pm2' >> Dockerfile
