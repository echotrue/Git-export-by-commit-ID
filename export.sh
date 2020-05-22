#!/bin/bash
# -------------------------------------------------
# Filename： export.sh
# Date: 2020-5-22 17:37:24
# Author: axlrose
# Description: Script for git export
# -------------------------------------------------


# Project directory
file_dir=/xxx/xxx/xxx/
# Export directory
export_dir=/xxx/xxx/xxx/

for key2 in $*
do
    echo -e "\033[33mcommit ${key2}\033[0m"
    file_list=$(git show --name-only --pretty=format:%n $key2)

    for file in $file_list
    do
      echo -e "--${file}"
      file_path=$file_dir$file
      export_path=$export_dir$file

      export_path_dir=$(dirname $export_path)
      if [ ! -d $export_path_dir ]; then
          mkdir -p -m 755 $export_path_dir
      fi

      $(cp -rvf $file_path $export_path)
    done

    echo -e "\033[32mcommit ${key2} Export complete！ \033[0m"
done

read -p "Press any key to close the window！" -n 1