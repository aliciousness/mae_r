FROM node:18

# need to install nodemon
RUN npm install -g nodemon

# make app dir
RUN mkdir -p /app

# Change into the working directory 
WORKDIR /app

# copy package.json 
COPY package.json ./

# install dependencies
RUN npm install

# Copy the rest of the files 
COPY . .

# make scripts executible 
RUN chmod +x /app/scripts/*

# Copy the entrypoint script
COPY ./scripts/entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

EXPOSE 3000

# run the application
CMD ["npm", "run", "dev"]
