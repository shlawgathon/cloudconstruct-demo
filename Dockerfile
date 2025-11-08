# Simple production-ready image for Express Hello World
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Set NODE_ENV for production
ENV NODE_ENV=production

# Install only production dependencies first (leverage Docker layer caching)
COPY package.json ./
RUN npm install --omit=dev

# Copy application source
COPY src ./src

# Expose the app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
