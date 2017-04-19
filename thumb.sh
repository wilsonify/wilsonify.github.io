for i in ./assets/images/*; do
  if [ -d "$i" ]; then
    echo "$i is a directory "
  elif [ -f "./thumbnails/thumb.$i" ]; then
    echo "./thumbnails/$i already exists"
  else  
    echo "Prcoessing $i ..."
    convert -thumbnail 473x209 $i ./thumbnails/thumb.$i
    echo "./thumbnails/thumb.$i created"
  fi
done
