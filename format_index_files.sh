#!/bin/bash

# 进入到 input 目录
cd index_files

# 遍历目录下所有文件
for file in *; do
    # 检查是否为文件
    if [ -f "$file" ]; then
        # # 删除最后两行
        # sed -i '$d' "$file"
        # sed -i '$d' "$file"
        # 删除最后一行
        sed -i '$d' "$file"
        # 在文件的第一行插入特定文本
        sed -i '1i日期,开盘,最高,最低,收盘,成交量,成交额' "$file"
    fi
done
