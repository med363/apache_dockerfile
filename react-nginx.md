FROM node:18 as builder

WORKDIR /app

RUN apt update && \

    apt install git -y
    
# . to be in /app directory not in /app/internationalize
RUN git clone  https://github.com/youssef-of-web/internationalization.git .

RUN npm i

RUN npm run build

FROM nginx:.21.0-allpine as production
ENV NODE_ENV production
#copy build assets from builder image
#dans le build tt le code va etre cree dans unn dossier build 
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
#start nginx
CMD ["nginx","-g","daemon off;"]
