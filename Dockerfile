# Use Node.js as base image
FROM node:latest

# Set the working directory
WORKDIR /usr/src/app

# Install system dependencies required by Chrome
RUN apt-get update && \
    apt-get install -y \
    gconf-service \
    libasound2 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    fonts-liberation \
    libappindicator1 \
    libnss3 \
    lsb-release \
    xdg-utils \
    wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add Chrome repository and install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get install -y google-chrome-stable

# Cleanup
RUN rm -rf /var/lib/apt/lists/*

# Set Chrome environment variables to run in headless mode
ENV CHROME_BIN=/usr/bin/google-chrome
ENV CHROME_PATH=/usr/lib/chromium/

# Copy package.json and package-lock.json (if available)
# COPY package*.json ./

# Install Node.js dependencies
# RUN npm install

# Copy the rest of the application source code
# COPY . .

# Expose port 9876 for Karma
# EXPOSE 9876

# Command to run tests
# CMD ["npm", "test"]
