FROM node:alpine

#RUN apk --update add curl  

COPY server.js /
COPY healthcheck.js /

EXPOSE 8080 8081

#HEALTHCHECK --interval=5s --timeout=10s --retries=3 CMD curl -sS 127.0.0.1:8080 || exit 1
HEALTHCHECK --interval=12s --timeout=12s --start-period=30s \  
CMD node /healthcheck.js


CMD [ "node", "/server.js" ]
