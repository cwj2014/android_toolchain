#!/bin/bash

#下载ndk版本android-ndk-r19c
wget https://dl.google.com/android/repository/android-ndk-r19c-linux-x86_64.zip
#解压缩
unzip android-ndk-r19c-linux-x86_64.zip
#NDK目录
export NDK_HOME=`pwd`/android-ndk-r19c
#生成交叉编译链工具
toolchain=${NDK_HOME}/build/tools/make-standalone-toolchain.sh
#生成交叉编译链保存在当前目录子文件夹android-toolchain
install_root=`pwd`/android-toolchain

#生成32位库最低支持到android4.3，64位库最低支持到android5.0
platforms=(
  "android-18"
  "android-18"
  "android-21"
  "android-18"
  "android-21"
)
#支持以下5种cpu框架
archs=(
  "arm"
  "arm"
  "arm64"
  "x86"
  "x86_64"
)
#cpu型号
abis=(
  "armeabi"
  "armeabi-v7a"
  "arm64-v8a"
  "x86"
  "x86_64"
)
echo $NDK_HOME
echo "安装在目录:$install_root"

num=${#abis[@]}

for ((i=0; i<num; i++))
do
   bash $toolchain --arch=${archs[i]} --platform=${platforms[i]} --abis=${abis[i]} --install-dir=$install_root/${abis[i]}
done
