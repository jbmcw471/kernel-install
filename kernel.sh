cd /

if [ ! -d "/kernel/" ];then
mkdir /kernel
fi

cd /kernel



url="linux-4.19.1"
kernel=`find /boot -name "config-*.x86_64"`
echo 下载文件：$url
echo 您的配置文件：$kernel

echo -e "\033[47;31m正在安装环境\033[0m"
yum -y install wget
yum groupinstall "development tools"
sudo apt-get install wget
echo -e "\033[41;33m环境已安装\033[0m"

echo -e "\n"

rm -rf $url.tar.xz
echo -e "\033[47;31m正在下载内核\033[0m"
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/${url}.tar.xz
echo -e "\033[41;33m内核下载完毕\033[0m"

echo -e "\n"

echo -e "\033[47;31m正在解压内核\033[0m"
rm -rf ${url}
tar xvJf ${url}.tar.xz
echo -e "\033[41;33m内核解压完毕\033[0m"

echo -e "\n"

cd ${url}
cp $kernel /kernel/${url}/.config


echo -e "\033[47;31m正在编译内核\033[0m"
make
echo -e "\033[41;33m内核编译完毕\033[0m"


echo -e "\033[47;31m正在安装内核模块\033[0m"
make modules_install
echo -e "\033[41;33m内核模块安装完毕\033[0m"


echo -e "\033[47;31m正在安装内核\033[0m"
make install
echo -e "\033[41;33m内核安装完毕\033[0m"
