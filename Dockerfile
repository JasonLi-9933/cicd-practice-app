FROM node:16-alpine as builder 
# builder phase 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build --> where build file locate
FROM nginx
#                   FROM       TO
COPY --from=builder /app/build /usr/share/nginx/html
# default command is: start nginx
