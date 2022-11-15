# Name Image development (can be anything)
FROM node:16.18-alpine3.15 AS development
# Specify Working directory inside container
WORKDIR /home/contact-api

COPY ["package*.json", "./"]
# Install deps inside container
RUN npm install
COPY . ./
RUN npm run build
CMD npm run start 

EXPOSE 3333

# Build another image named production
FROM node:16.18-alpine3.15 AS production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

# Set work dir
WORKDIR /home/contact-api

COPY --from=development /home/contact-api .

EXPOSE 3333

# run app
CMD node ./dist/apps/main.js