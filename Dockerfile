#build phase
FROM node:alpine 
WORKDIR "/app"
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

#run phase
#every FROM marks a new phase
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
#--from allows to point to the phase we want to copy from
# 0 refers to the first phase

# the folder app/build contains everything we need 
# the usr/... folder is recommended by nginx doc