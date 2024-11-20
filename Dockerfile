FROM oven/bun:alpine as build
WORKDIR /app

COPY package.json bun.lockb ./
RUN bun install --production

COPY public ./public
COPY src ./src
COPY astro.config.mjs . 
COPY tsconfig.json .

RUN bun astro build && rm -rf /root/.bun

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]