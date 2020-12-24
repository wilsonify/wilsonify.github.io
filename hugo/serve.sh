docker run -it --rm \
-p 49159:1313 \
--user $UID:$GID \
-v $PWD:/src \
klakegg/hugo \
server --watch
