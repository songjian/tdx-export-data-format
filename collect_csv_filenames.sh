#!/bin/bash

# 进入到 files 目录
cd files

# 创建或清空 tdx_stocks.csv 文件
> ../tdx_stocks.csv

# 遍历目录下所有 .csv 文件
for file in *.csv; do
    # 去掉后缀名
    base_name=$(basename "$file" .csv)
    # 拆出前两个字符
    first_two_chars=$(echo "$base_name" | cut -c1-2)
    # 去掉前两个字符
    remaining_chars=$(echo "$base_name" | cut -c3-)
    # 将前两个字符和剩余的字符写入 tdx_stocks.csv
    echo "$first_two_chars,$remaining_chars" >> ../tdx_stocks.csv
done

# 在 tdx_stocks.csv 的第一行插入 "交易所简码,股票代码"
sed -i '1i交易所简码,股票代码' ../tdx_stocks.csv
