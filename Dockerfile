FROM grycap/cowsay:latest

# Copy both cow files
COPY lilypad.cow /usr/share/cowsay/cows/lilypad.cow
COPY lilyfrog.cow /usr/share/cowsay/cows/lilyfrog.cow

# Remove the existing symbolic link if it exists
RUN rm -f /usr/share/cowsay/cows/default.cow

# Set the default to lilypad
RUN ln -s /usr/share/cowsay/cows/lilypad.cow /usr/share/cowsay/cows/default.cow

# Define default message and image
ENV DEFAULT_MESSAGE="Hello World"
ENV DEFAULT_IMAGE="lilypad"

# Set the entry point to dynamically link the cow file and run cowsay
ENTRYPOINT ["/bin/sh", "-c", "ln -sf /usr/share/cowsay/cows/${1:-$DEFAULT_IMAGE}.cow /usr/share/cowsay/cows/default.cow && /usr/games/cowsay \"$0\""]

# Set default argument values
CMD ["$DEFAULT_MESSAGE"]
