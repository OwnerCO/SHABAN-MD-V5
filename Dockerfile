FROM node:lts-buster
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg webp git && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*
USER node
RUN git clone https://github.com/OwnerCO/SHABAN-MD-V5.git /home/node/SHABAN-MD-V5
WORKDIR /home/node/SHABAN-MD-V5
RUN chmod -R 777 /home/node/SHABAN-MD-V5/
RUN npm install -g pm2
EXPOSE 7860
ENV NODE_ENV=production
CMD ["npm", "start"]
