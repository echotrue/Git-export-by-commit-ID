#!/bin/bash

#file dir
file_dir=/f/wnmp/wwwroot/h5game/
#export dir
export_dir=/f/tool/www/new/

for key2 in $*
do
    file_list=$(git show --name-only --pretty=format:%n $key2)
    for file in $file_list
    do
      echo -e "\033[37mExport file:$file \033[0m"
      file_path=$file_dir$file
      export_path=$export_dir$file

      export_path_dir=$(dirname $export_path)
      if [ ! -d $export_path_dir ]; then
          # Get dir
          mkdir -p -m 755 $export_path_dir
          echo -e "\033[32mCreate dir: $export_path_dir done \033[0m"
      fi

      #copy
      cp_re=$(cp -rvf $file_path $export_path)
#      echo $cp_re
      echo -e "\033[32mDone！ \033[0m"
    done
done

echo $'\n'

read -p "Press any key to close the window！" -n 1