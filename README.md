## 开始使用
> git clone https://github.com/scjtqs/docker-kodbox.git  docker-kodbox

> cd docker-kodbox

> docker-compose up -d


## 关闭

> docker-compose down


## 一些默认参数

> 安装时的数据库地址，将“127.0.0.1”改成db,用户root，密码root。

> redis的地址填"redis" 端口就它默认的就好

> nginx 的反向代理配置需要自己写了，我这里就没有预制了。


### nginx 反向代理的部分片段
````nginx
location / {
         proxy_http_version 1.1;
#        proxy_redirect off;
          proxy_pass http://182.168.50.127:9080;
         proxy_set_header Host $http_host;
         proxy_set_header X-Forwarded-Proto $scheme;
         proxy_set_header X-Real-IP $remote_addr;
         proxy_set_header Upgrade $http_upgrade;
         proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
 }

````

# 升级流程
> docker-compose 升级镜像真tm方便：
>
> 1、docker-compose down 停止服务（这步可以不用执行）
>
> 2、docker-compose pull 更新image
>
> 3、docker-compose up -d 启动服务
>
> 3、docker image prune 删除旧的镜像
