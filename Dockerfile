FROM node:19-alpine3.15 as dev-deps
WORKDIR /app
COPY package.json package.json
RUN yarn install --frozen-lockfile


FROM node:19-alpine3.15 as builder
WORKDIR /app
COPY --from=dev-deps /app/node_modules ./node_modules
COPY . .
# RUN yarn test
RUN yarn build


FROM nginx:1.23.3
EXPOSE 80
COPY --from=builder /app/dist /usr/share/nginx/html
COPY assets/ /usr/share/nginx/html/assets
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d


# daemon off: primer plano
CMD [ "nginx", "-g", "daemon off;" ]
