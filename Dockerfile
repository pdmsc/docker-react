FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# to create a separate build phase we just make use of FROM
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
