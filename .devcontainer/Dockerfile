# Use an official Ruby runtime as a parent image
FROM ruby:2.7

# Install necessary libraries for Ruby2d 
RUN apt-get update -qq && apt-get install -y libsdl2-dev libsdl2-ttf-dev \
    libpango1.0-dev libgl1-mesa-dev libfreeimage-dev \
    libopenal-dev libsndfile-dev

# Set working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app/

# Install any needed packages specified in Gemfile.lock (if it exists)
RUN if [ -f Gemfile.lock ]; then bundle install; fi

# Run game.rb when the container launches
CMD ["ruby", "game.rb"]