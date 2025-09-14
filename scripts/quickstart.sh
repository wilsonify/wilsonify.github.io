docker run -it --rm \
--user $UID:$GID \
-v $PWD:/src \
klakegg/hugo \
new site quickstart
