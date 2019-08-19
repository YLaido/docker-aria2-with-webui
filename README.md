Aria2，集成 Aria2-WebUI
---

Fork 自 `abcminiuser/docker-aria2-with-webui`。

使用最新的 Alpine 版本，以及最新的稳定 Aria2 客户端（来自 Alpine 的软件包存储库）和最新的 Aria2-WebUI。

## 安装 ##

```bash
# 方法一，自行编译
git clone https://github.com/LJason77/docker-aria2-with-webui.git
cd docker-aria2-with-webui
docker build -t aria2 .
# 方法二
docker pull ljason/docker-aria2-with-webui
```

## 运行 ##

```bash
# 方法一安装
docker run -d --name aria2 --network host -v /DOWNLOAD_DIR:/data -e SECRET=YOUR_SECRET_CODE aria2
# 方法二安装
docker run -d --name aria2 --network host -v /DOWNLOAD_DIR:/data -e SECRET=YOUR_SECRET_CODE ljason/docker-aria2-with-webui
```

WebUI 可从 81 端口访问。4 端口可直接下载文件，可在 `连接设置` 里面设置 `直接下载` 地址：http://ip:4/ 。

## User / Group Identifiers

**Note:** (This section stolen from [LinuxServer.io](http://linuxserver.io)'s
excellent container documentation.)

Sometimes when using data volumes (`-v` flags) permissions issues can arise
between the host OS and the container. We avoid this issue by allowing you to
specify the user PUID and group PGID. Ensure the data volume directory on the
host is owned by the same user you specify and it will "just work" TM.

In this instance `PUID=1001` and `PGID=1001`. To find yours use id user as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Credits

As mentioned, this is a lightly modified version of the container by
`XUJINKAI/aria2-with-webui` - all credits to him.
