# stage 1
FROM node:latest as amann11/circleci-node-aws

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/app-docker /usr/share/nginx/html