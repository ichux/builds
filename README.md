# How to build
```bash
# docker build --no-cache -f=only-alpine -t only-alpine .

source buildimages.sh
```

# How to run
```bash
# docker run -it --rm binary ls -lh hw

source runimages.sh
```

# ISTYLEPY
```bash
# build
docker build -f=istylepy -t istylepy .

# format some codes
docker run --rm --volume $(pwd):/src --workdir /src istylepy bash -c "isort . && flake8 . && black ."

# enter into shell
docker run -it --rm --volume $(pwd):/src istylepy

# run with specific user
docker run -it --rm --volume $(pwd):/src --user "$(id -u)":"$(id -g)" istylepy

# printf "docker run --rm --volume $(PWD):/src --workdir /src istylepy:latest black . && isort . --profile black" | pbcopy
```

# Misc

```bash
# WORKDIR /usr/share
# COPY --chown=daemon:daemon build/distributions/my-app.tar .
# RUN tar -xf my-app.tar && rm my-app.tar
```
