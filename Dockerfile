# Root Dockerfile for Node.js backend
FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 5000
CMD ["node", "index.js"]  # Adjust if your entry point is different
