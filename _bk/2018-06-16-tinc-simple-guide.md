---
title: tinc 创建虚拟局域网
date: 2018-06-16
comment: tinc、p2p、vpn
---

TeamViewer 最近经常提示商业用途被强制切断。微软自家的远程控制感觉很好用，而且免费不是嘛。
接下来解决 NAT 的问题就行了，目标很明确，组个虚拟局域网。个人使用最好可以 P2P 直连，避免中转。
搜索一把，找到大家推荐的 ZeroTier（商业软件）以及两个开源项目 n2n, tinc。感觉 tinc 更加活跃，就用这个试试了。

## 介绍
介绍什么的可以访问 [官网](https://tinc-vpn.org) 或者 [github](https://github.com/gsliepen/tinc) 项目自己了解。
个人理解就是中心节点给边缘节点牵桥搭线，或者说是有公网 ip 的设备帮助没有公网 ip 的设备实现 P2P 直连。
tinc 说明使用的是私有协议，并没有看具体源码，所以实现细节也不是很清楚。

## 我的环境
一台 vps，办公室电脑 PC1，家里的电脑 PC2。vps 是 linux 系统，作为中心节点，两台 PC 都是 windows 系统，作为边缘节点。

## linux 安装
可以通过 yum dnf 或者 apt-get 进行安装，也可以自己编译安装。
安装完后，创建配置文件:
tinc.conf: 配置网络名、中心节点名、网络端口
tinc-up: 打开 tinc 时执行的文件，需要执行权限
tinc-down: 关闭 tinc 时执行的文件，需要执行权限
host/vps: 公网地址、端口号、子网地址、公钥(自动生成)
<pre><code>
/etc/tinc
`-- vpn
    |-- tinc.conf
    |-- tinc-up
    |-- tinc-down
    `-- hosts
        |-- home
        |-- office
        `-- vps
</code></pre>


## windows 安装
去官网下载最新版本 [here](https://tinc-vpn.org/download/)，安装好。
安装 [openvpn](https://openvpn.net/index.php/download/community-downloads.html)，创建虚拟网卡(也可以直接使用目录下的 add-tap.bat 创建虚拟网卡)。
安装目录下新建文件夹 vpn, vpn 目录下新建文件夹 hosts
<pre><code>
/ProgramFiles/tinc
`-- vpn
    |-- tinc.conf
    `-- hosts
        |-- home
        |-- office
        `-- vps
</code></pre>



* 以上过程使用的 tinc 版本是 1.0.34


