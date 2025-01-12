#!/bin/bash

#>>>>>>>>>>>>>>>>>>> tax.miner.proxy 安装目录配置 <<<<<<<<<<<<<<<<<<<<<<<
# 默认情况下不要修改，如果需要进行 tax.miner.proxy 多开时候（不熟悉 linux 系统的话，强烈不建议多开）
# 复制一份本文件，然后再修改这个路径
# 不要修改 /root/ 部分， tax_miner_proxy 部分可以修改，但是不要写中文进去
# 不要直接修改这个文件，不要直接使用默认的监听端口
dirname="/root/tax_miner_proxy"



#>>>>>>>>>>>>>>>>>>>>>>>> 下面内容请不要修改<<<<<<<<<<<<<<<<<<<<

[[ $(id -u) != 0 ]] && echo -e "请使用root权限运行" && exit 1

cmd="apt-get"
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo "此脚本不支持该系统" && exit 1
fi


install() {
    $cmd update -y
    $cmd install curl wget -y
    
    echo "tax.miner.proxy 启动脚本生成器"
    read -p "$(echo -e "请选择使用平台，linux服务器 请输入 1，币印盒子内置抽水 请输入 2：")" flag
    arch=""
    if [[ $flag == 2 ]]; then
        wget https://raw.githubusercontent.com/tax2022/tax_miner_proxy/master/biyinhezi/tools.sh -O /tmp/tax-miner-proxy.sh
        arch="hezi"
    else
        wget https://raw.githubusercontent.com/tax2022/tax_miner_proxy/master/linux/tools.sh -O /tmp/tax-miner-proxy.sh
        arch="linux"
    fi

    read -p "$(echo -e"下载完成，请输入目录后缀，例如 tax ：" )" suffix
    sed "s/\/root\/tax_miner_proxy/\/root\/tax_miner_proxy-$suffix/g" /tmp/tax-miner-proxy.sh  > /root/tax-miner-proxy-"$suffix"-"$arch".sh
    chmod u+x /root/tax-miner-proxy-"$suffix"-"$arch".sh
    echo "tools 脚本生成成功，请查看：/root/tax-miner-proxy-$suffix-$arch.sh"
}

install
