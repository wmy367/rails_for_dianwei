# 湖南大学 电子义务维修基地 网站 RoR

**安装 RVM**

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
# 如果上面的连接失败，可以尝试:
curl -L https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable
```
**载入rvm**
```
source ~/.rvm/scripts/rvm
```
**安装 ruby**
```
rvm install 2.3.0
```
**安装 rails**
```
gem install rails -v 5.0.6
```
**安装 bundler**
```
gem install bundler
```
