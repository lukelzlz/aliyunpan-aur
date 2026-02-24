# aliyunpan-go-bin

阿里云盘命令行客户端 AUR 包（预编译版本）

## 安装

### 从 AUR 安装（发布后）

```bash
yay -S aliyunpan-go-bin
# 或
paru -S aliyunpan-go-bin
```

### 本地安装

```bash
git clone https://github.com/lukelzlz/aliyunpan-aur.git
cd aliyunpan-aur
makepkg -si
```

## 使用

```bash
# 登录
aliyunpan login

# 查看文件列表
aliyunpan ls

# 上传文件
aliyunpan upload /local/path /remote/path

# 下载文件
aliyunpan download /remote/path /local/path

# 同步
aliyunpan sync start
```

## 支持的架构

- x86_64 (amd64)
- aarch64 (arm64)
- i686 (386)
- armv7h (armv7)

## 自动更新

本仓库使用 GitHub Actions 自动检测上游更新并自动更新 PKGBUILD。

- 每天检查一次新版本
- 自动下载新版本并计算校验和
- 自动提交更新

## 上游项目

- 仓库: https://github.com/tickstep/aliyunpan
- 许可证: Apache-2.0

## 相关 AUR 包

- `aliyunpan-go` - 从源码编译版本
- `aliyunpan-go-bin` - 本包，预编译版本
- `aliyunpan-cli` - Python 版本客户端
