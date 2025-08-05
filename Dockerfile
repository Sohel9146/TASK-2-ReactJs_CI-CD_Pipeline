# Stage - 1 Build Reac App

FROM node:18 AS builder

WORKDIR /myapp

COPY . .

RUN npm install

RUN npm run build

# Stage - 2 Serve with Nginx

FROM nginx:alpine

COPY --from=builder /myapp/build /usr/share/nginx/html

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]