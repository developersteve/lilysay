FROM grycap/cowsay:latest

# Copy both cow files
COPY lilypad.cow /usr/share/cowsay/cows/lilypad.cow
COPY lilyfrog.cow /usr/share/cowsay/cows/lilyfrog.cow

# Remove the existing symbolic link if it exists
RUN rm -f /usr/share/cowsay/cows/default.cow

# Set a new symbolic link that can be changed at runtime
RUN ln -s /usr/share/cowsay/cows/lilypad.cow /usr/share/cowsay/cows/default.cow

ENTRYPOINT ["/bin/sh", "-c", "ln -sf /usr/share/cowsay/cows/${COWFILE:-lilypad}.cow /usr/share/cowsay/cows/default.cow && if [ -z \"$1\" ]; then echo \"Pass me an input called Message, like: docker run <container> 'moo'\"; else /usr/games/cowsay \"$1\"; fi"]