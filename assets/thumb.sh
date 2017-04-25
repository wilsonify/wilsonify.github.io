#######################################################
# This script will create thumbnail images
# of all files found in the images directory.
# images/thumbnails directory must exist.
# Not recursive, nested directories will be skipped.
#
#######################################################
for i in images/*; do
  path=`dirname $i`
  filename=`basename $i`
  target="$path/thumbnails/thumb.$filename"
  if [ -d "$i" ]; then
    echo "$filename is a directory "
  elif [ -f "$target" ]; then
    echo "$target already exists"
  else  
    echo "create $target"
    convert -thumbnail 473x209 "$i" "$target"
  fi
done
