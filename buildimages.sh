#!/bin/sh

# remove stale images
docker rmi -f $(docker images -f "dangling=true" -q) > /dev/null 2>&1

# clear off exisiting images when found
images_list=("only-ubuntu" "only-alpine" "scratch-ubuntu" "scratch-alpine")

for var in "${images_list[@]}"
do
    RUNNING=$(docker image inspect $var 2> /dev/null);
    if [ $? -ne 1 ]; then
        docker rmi $var > /dev/null 2>&1
    fi;
done

# remove existing build cache
# echo "Y" | docker builder prune > /dev/null 2>&1

# build our images
docker build -f=only-alpine -t only-alpine .
docker build -f=scratch-alpine -t scratch-alpine .
docker build -f=only-ubuntu -t only-ubuntu .
docker build -f=scratch-ubuntu -t scratch-ubuntu .

# clear the screen
printf "\033c"

# print information about our images
for var in "${images_list[@]}"
do
   docker images $var | awk 'NR==2 { print $1 " == " $NF }'
done
