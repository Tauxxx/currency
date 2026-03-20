FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

# Install production dependencies only
RUN npm ci --omit=dev

COPY . .

# Expose port
ENV PORT=3000
EXPOSE 3000
# ENV PORT=8080
# EXPOSE 8080

# CMD ["npm", "start"]
CMD ["node", "app.js"]