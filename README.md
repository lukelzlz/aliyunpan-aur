# aliyunpan-xby-desktop

小白羊网盘 - 阿里云盘第三方桌面客户端 AUR 包

## 功能特点

- 多账号登录
- 在线播放视频（原始/转码）
- 在线预览图片、文档、PDF
- 文件管理（上传、下载、重命名、移动、删除）
- 批量改名、在线解压
- 连接 Aria2 下载
- 回收站、收藏夹、分享功能

## 安装

### 从 AUR 安装（发布后）

```bash
yay -S aliyunpan-xby-desktop
# 或
paru -S aliyunpan-xby-desktop
```

### 本地安装

```bash
git clone https://github.com/lukelzlz/aliyunpan-aur.git
cd aliyunpan-aur
makepkg -si
```

## 使用

安装后直接运行：
```bash
aliyunpan-xby
```

或者在应用菜单中找到"小白羊网盘"

## 支持的架构

- x86_64
- aarch64 (ARM64)
- armv7h (ARMv7)

## 自动更新

本仓库使用 GitHub Actions 自动检测上游更新并自动更新 PKGBUILD。

- 每天检查一次新版本
- 自动下载新版本并计算校验和
- 自动提交更新

## 上游项目

- 仓库: https://github.com/gaozhangmin/aliyunpan
- 许可证: MIT

## 相关 AUR 包

- `aliyunpan-go-bin` - CLI 命令行版本
- `aliyunpan-cli` - Python CLI 客户端
