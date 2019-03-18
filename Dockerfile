FROM node:8.15.1-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . . 
RUN npm run build 
# /app/build <-- build folder 

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html



