#!/etc/bash
DIR_NAME=$1
FILE_NAME=$2

echo 'compile...'

nasm -f elf $DIR_NAME/$FILE_NAME.asm

echo 'link...'

ld -m elf_i386 $DIR_NAME/$FILE_NAME.o -o $DIR_NAME/$FILE_NAME

echo 'run...'

# 使用循环处理参数
count=0
for arg in "$@"; do
  count=$((count+1))
  if [ $count -ge 3 ]; then
    truncated_args="$truncated_args $arg"
  fi
done

./$DIR_NAME/$FILE_NAME $truncated_args