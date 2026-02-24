# aliyunpan-wine

阿里云盘官方客户端 - 通过 Wine 在 Arch Linux 上运行

## 特点

- 🎯 **官方客户端** - 直接使用阿里云盘 Windows 官方版本
- 🍷 **Wine 运行** - 无需虚拟机，原生 Linux 体验
- 🔄 **自动安装** - 首次运行自动初始化 Wine 环境并安装

## 安装

### 从 AUR 安装（发布后）

```bash
yay -S aliyunpan-wine
# 或
paru -S aliyunpan-wine
```

### 本地安装

```bash
git clone https://github.com/lukelzlz/aliyunpan-aur.git
cd aliyunpan-aur
makepkg -si
```

## 使用

### 首次运行

```bash
aliyunpan
```

首次运行会自动：
1. 创建 Wine 前缀 (`~/.local/share/wineprefixes/aliyunpan`)
2. 初始化 Wine 环境
3. 安装阿里云盘客户端
4. 启动程序

### 其他命令

```bash
aliyunpan install     # 重新安装
aliyunpan uninstall   # 卸载（调用 Wine 卸载程序）
aliyunpan winecfg     # 打开 Wine 配置
aliyunpan help        # 显示帮助
```

## 依赖

- wine
- wine-gecko
- wine-mono
- xdg-utils

### 可选依赖

- winetricks - 安装额外 Windows 组件
- ttf-ms-fonts - 微软字体（更好的显示效果）

## 故障排除

### 中文显示问题

```bash
# 安装中文字体
sudo pacman -S wqy-microhei

# 或复制 Windows 字体到 Wine
cp /path/to/windows/fonts/sim* ~/.local/share/wineprefixes/aliyunpan/drive_c/windows/Fonts/
```

### 程序无法启动

```bash
# 重新初始化 Wine 环境
rm -rf ~/.local/share/wineprefixes/aliyunpan
aliyunpan install
```

### 高 DPI 显示问题

```bash
# 打开 Wine 配置，设置 DPI
aliyunpan winecfg
# 在"显示"选项卡中调整 DPI
```

## CI 自动更新

本仓库使用 GitHub Actions 自动检测新版本：
- 每天检查官方是否有新版本
- 自动更新 PKGBUILD

## 相关项目

- [Deepin Wine 阿里云盘](https://aur.archlinux.org/packages/deepin-wine-adrive) - 使用 Deepin Wine 的版本
- [小白羊网盘](https://github.com/gaozhangmin/aliyunpan) - 第三方原生客户端
- [aliyunpan CLI](https://github.com/tickstep/aliyunpan) - 命令行客户端

## 免责声明

本项目仅用于学习和研究目的。阿里云盘是阿里巴巴集团的商标。请遵守阿里云盘的用户协议。

## License

MIT (仅限打包脚本) - 软件本身版权归阿里巴巴集团所有
