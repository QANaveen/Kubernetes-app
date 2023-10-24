FROM node:latest As build

WORKDIR /app
 
COPY package.json /app
 
RUN npm install

COPY . /app

FROM gcr.io/distroless/nodejs18-debian11

WORKDIR /app

COPY --from=build /app /app

EXPOSE 7500

CMD ["app.js"]