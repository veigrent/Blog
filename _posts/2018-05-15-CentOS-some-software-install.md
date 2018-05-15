
---
title: 新装的CentOS
date: 2018-05-15
comment: dnf、python、vim
---

刚装上CentOS，总习惯先更新下软件，但这个并没有yum install就搞定了，总需要搜索一番，那这次就记录下来吧。

## 安装dnf
CentOS装上之后是yum，没有dnf，对于我个人而言其实，dnf最大的好处是没有了升级python的烦恼。
可是直接通过yum安装dnf貌似不行。
<pre><code>wget http://springdale.math.ias.edu/data/puias/unsupported/7/x86_64/dnf-conf-0.6.4-2.sdl7.noarch.rpm
wget http://springdale.math.ias.edu/data/puias/unsupported/7/x86_64//dnf-0.6.4-2.sdl7.noarch.rpm
wget http://springdale.math.ias.edu/data/puias/unsupported/7/x86_64/python-dnf-0.6.4-2.sdl7.noarch.rpm
yum install python-dnf-0.6.4-2.sdl7.noarch.rpm  dnf-0.6.4-2.sdl7.noarch.rpm dnf-conf-0.6.4-2.sdl7.noarch.rpm</code></pre>

## 安装python3
能不自己编译就不编译了，也懒得下包，找源吧。
<pre><code>sudo dnf install -y https://centos7.iuscommunity.org/ius-release.rpm
sudo dnf update
sudo dnf install -y python36u python36u-libs python36u-devel python36u-pip
python3.6 -V
</code></pre>

## 更新vim到vim8
下载源码自己编译当然是可以的，但是如果可以直接升级又何必要这么麻烦呢，添加一下vim8的yum源，更新一下就行了。
<pre><code>sudo curl -L https://copr.fedorainfracloud.org/coprs/mcepl/vim8/repo/epel-7/mcepl-vim8-epel-7.repo -o /etc/yum.repos.d/mcepl-vim8-epel-7.repo
sudo dnf update
</code></pre>

* Reference:
* [gist](https://gist.github.com/yevrah/21cdccc1dc65efd2a4712781815159fb)
* [RoseHosting](https://www.rosehosting.com/blog/how-to-install-python-3-6-4-on-centos-7/)
* [Serverfault](https://serverfault.com/questions/874471/centos-7-4-can-not-install-dnffrom-epel)


