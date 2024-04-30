FROM grycap/cowsay:latest

COPY lilypad.cow /usr/share/cowsay/cows/lilypad.cow
COPY lilyfrog.cow /usr/share/cowsay/cows/lilyfrog.cow

RUN rm -f /usr/share/cowsay/cows/default.cow

RUN ln -s /usr/share/cowsay/cows/lilypad.cow /usr/share/cowsay/cows/default.cow

ENTRYPOINT ["/bin/sh", "-c", "ln -sf /usr/share/cowsay/cows/${COWFILE:-lilypad}.cow /usr/share/cowsay/cows/default.cow && if [ -z \"$1\" ]; then echo \"Pass me an input called Message, like: docker run <container> 'moo'\"; else /usr/games/cowsay \"$1\"; fi"]


