#!/bin/bash

# 创建新的 csv 文件
echo "交易所简码,股票代码,日期,开盘,最高,最低,收盘,成交量,成交额" > merged.csv

# 遍历 files 目录下的所有 csv 文件
for file in files/*.csv
do
    # 提取文件名的前两个字符和剩余的字符
    filename=$(basename -- "$file")
    exchange_code=${filename:0:2}
    stock_code=${filename:2:-4}

    # 读取文件的每一行（除了第一行），在每行的开始添加交易所简码和股票代码，然后追加到 merged.csv 文件中
    tail -n +2 "$file" | awk -v ex="$exchange_code" -v sc="$stock_code" -F ',' 'BEGIN {OFS = ","} {print ex, sc, $0}' >> merged.csv
done