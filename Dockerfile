FROM node:lts-buster
COPY package.json .


RUN npm install pm2 -g
RUN npm install --legacy-peer-deps

COPY . .
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg webp git && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*
USER node
RUN git clone https://github.com/OwnerCO/SHABAN-MD-V5.git /home/node/SHABAN-MD-V5
WORKDIR /home/node/SHABAN-MD-V5
RUN chmod -R 777 /home/node/SHABAN-MD-V5/
EXPOSE 7860
ENV NODE_ENV=production
CMD ["npm", "start"]
