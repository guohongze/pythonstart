#!/bin/bash
#安装依赖包
yum -y group install "Development Tools"
yum install -y wget
yum -y install openssl-devel bzip2-devel expat-devel gdbm-devel readline-devel sqlite-devel vim
#下载安装包
wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tar.xz
#解压
tar xf Python-3.6.8.tar.xz
cd Python-3.6.8
#编译
./configure --prefix=/usr/local/python3.6
make && make install
#软连接
ln -fs /usr/local/python3.6/bin/python3 /usr/local/bin/
ln -fs /usr/local/python3.6/bin/pip3 /usr/local/bin/
mv /usr/bin/python /usr/bin/python.bak
ln -fs /usr/local/python3.6/bin/python3.6 /usr/bin/python
ln -fs /usr/local/python3.6/bin/pip3.6 /usr/bin/pip
#替换yum python解释器
sed -i 's/\#\!\/usr\/bin\/python/\#\!\/usr\/bin\/python2.7/g' /usr/bin/yum
sed -i 's/\#\!\s\/usr\/bin\/python/\#\!\/usr\/bin\/python2.7/g' /usr/libexec/urlgrabber-ext-down
