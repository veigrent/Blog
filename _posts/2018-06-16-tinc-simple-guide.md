---
title: tinc 创建虚拟局域网
date: 2018-06-16
comment: tinc、p2p、vpn
---

TeamViewer 最近经常提示商业用途被强制切断。微软自家的远程控制感觉很好用，而且免费不是嘛。
接下来解决 NAT 的问题就行了，目标很明确，组个虚拟局域网。个人使用最好可以 P2P 直连，避免中转。
搜索一把，找到大家推荐的 ZeroTier（商业软件）以及两个开源项目 n2n, tinc。感觉 tinc 更加活跃，就用这个试试了。

## 介绍
介绍什么的可以访问[官网](tinc-vpn.org)或者[github](github.com/gsliepen/tinc)项目自己了解。
个人理解就是中心节点给边缘节点牵桥搭线，或者说是有公网 ip 的设备帮助没有公网 ip 的设备实现 P2P 直连。
tinc 说明使用的是私有协议，所以具体如何实现的p2p连接我不清楚细节。

## 我的环境
一台 vps，办公室电脑 PC1，家里的电脑 PC2。vps 是 linux 系统，作为中心节点，两台 PC 都是 windows 系统，作为边缘节点。

## linux 安装
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
去官网下载最新版本 [here](tinc-vpn.org/download/)，安装好。
安装 [openvpn](openvpn.net/index.php/download/community-downloads.html)，创建虚拟网卡(也可以直接使用目录下的 add-tap.bat 创建虚拟网卡)。
安装目录下新建文件夹vpn, vpn目录下新建文件夹hosts
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


