# Muti build example
# Tagged as builder phase (use 'as')

FROM node:alpine as builder
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# Using FROM again sets up an nginx environment
# /usr/share/nginx/html is the default dir where staic files are served from

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html





