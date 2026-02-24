# Maintainer: Luke <lukelzlz@users.noreply.github.com>

pkgname=aliyunpan-xby-desktop
_pkgname=aliyunpan
pkgver=3.13.5
pkgrel=1
pkgdesc="小白羊网盘 - 阿里云盘第三方桌面客户端，支持多账号、在线播放、文件管理"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/gaozhangmin/aliyunpan"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'alsa-lib' 'libnotify' 'libxtst' 'xdg-utils')
provides=('aliyunpan-xby')
conflicts=('aliyunpan-xby' 'aliyunpan-xby-bin')

source_x86_64=("$_pkgname-$pkgver-x86_64.AppImage::https://github.com/gaozhangmin/aliyunpan/releases/download/v$pkgver/XBYDriver-$pkgver-linux-x86_64.AppImage")
source_aarch64=("$_pkgname-$pkgver-aarch64.AppImage::https://github.com/gaozhangmin/aliyunpan/releases/download/v$pkgver/XBYDriver-$pkgver-linux-arm64.AppImage")
source_armv7h=("$_pkgname-$pkgver-armv7h.AppImage::https://github.com/gaozhangmin/aliyunpan/releases/download/v$pkgver/XBYDriver-$pkgver-linux-armv7l.AppImage")

sha256sums_x86_64=('f38a9c2ca3ebc23ca1a507f958f95f919e6ada72568df35980dcf9667108620e')
sha256sums_aarch64=('c575ecfd682169fad89ae8b87cdfe44550a06eb1c57a21ce67c929f215f75994')
sha256sums_armv7h=('19631fe93714b7c9fda02cc3687dd76a9f68fa723be35a69cc97da9e04b4eff3')

prepare() {
    chmod +x "$_pkgname-$pkgver-*.AppImage"
}

package() {
    # Install AppImage
    install -Dm755 "$_pkgname-$pkgver-*.AppImage" "$pkgdir/opt/aliyunpan-xby/aliyunpan-xby.AppImage"
    
    # Create wrapper script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/aliyunpan-xby" <<EOF
#!/bin/bash
exec /opt/aliyunpan-xby/aliyunpan-xby.AppImage "\$@"
EOF

    # Create desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/aliyunpan-xby.desktop" <<EOF
[Desktop Entry]
Name=小白羊网盘
Name[en]=AliyunPan XBY
Comment=阿里云盘第三方桌面客户端
Exec=aliyunpan-xby %U
Icon=aliyunpan-xby
Type=Application
Categories=Network;FileTransfer;
StartupNotify=true
MimeType=x-scheme-handler/aliyunpan;
EOF

    # Create a placeholder icon (AppImage will provide its own)
    install -Dm644 /dev/stdin "$pkgdir/usr/share/icons/hicolor/512x512/apps/aliyunpan-xby.png" <<EOF
EOF
}
