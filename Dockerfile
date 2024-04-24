FROM grycap/cowsay:latest

# Copy the cowsay binary to bin
COPY cowsay /usr/local/bin/cowsay

# Make sure cowsay is executable
RUN chmod +x /usr/local/bin/cowsay

# Copy both cow files
COPY lilypad.cow /usr/local/share/cows/lilypad.cow
COPY lilyfrog.cow /usr/local/share/cows/lilyfrog.cow

# Set a symbolic link that can be changed at runtime
RUN ln -s /usr/local/share/cows/lilypad.cow /usr/local/share/cows/default.cow

# Use a single entrypoint command that handles the symbolic link and cowsay execution
ENTRYPOINT ["/bin/sh", "-c", "ln -sf /usr/local/share/cows/${COWFILE:-lilypad}.cow /usr/local/share/cows/default.cow && exec /usr/local/bin/cowsay \"$@\"", "cowsay"]
