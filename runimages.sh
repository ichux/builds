#!/bin/sh

images_list=("only-ubuntu" "only-alpine" "scratch-ubuntu" "scratch-alpine")

# run our code
for var in "${images_list[@]}"
do
   printf "$var: " && docker run -it --rm $var
done
