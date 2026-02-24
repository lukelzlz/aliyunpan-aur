# Maintainer: Luke <lukelzlz@users.noreply.github.com>

pkgname=aliyunpan-go-bin
_pkgname=aliyunpan
pkgver=0.3.8
pkgrel=1
pkgdesc="阿里云盘命令行客户端，支持webdav文件服务、JavaScript插件、同步备份功能 (预编译版本)"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/tickstep/aliyunpan"
license=('Apache-2.0')
provides=('aliyunpan')
conflicts=('aliyunpan-go' 'aliyunpan-go-git')
options=('!strip' '!emptydirs')

source_x86_64=("$_pkgname-$pkgver-x86_64.zip::https://github.com/tickstep/aliyunpan/releases/download/v$pkgver/aliyunpan-v$pkgver-linux-amd64.zip")
source_aarch64=("$_pkgname-$pkgver-aarch64.zip::https://github.com/tickstep/aliyunpan/releases/download/v$pkgver/aliyunpan-v$pkgver-linux-arm64.zip")
source_i686=("$_pkgname-$pkgver-i686.zip::https://github.com/tickstep/aliyunpan/releases/download/v$pkgver/aliyunpan-v$pkgver-linux-386.zip")
source_armv7h=("$_pkgname-$pkgver-armv7h.zip::https://github.com/tickstep/aliyunpan/releases/download/v$pkgver/aliyunpan-v$pkgver-linux-armv7.zip")

sha256sums_x86_64=('5b3ac988a22ab188d1e347711642e9dc7bc26673d4481d438cf4c59a2e01043c')
sha256sums_aarch64=('531647874036daa663575c05fe3915a5570e6151719d23b1db2f743e7f40f427')
sha256sums_i686=('8b52e4b93fa18b45435423f7d57f07fe517cc0844c69207caa11e88648aa2bd2')
sha256sums_armv7h=('f2003bf28ba6b3e397638f630294772c17e91384d556ed8aa96086ea92d9014f')

package() {
    cd "$srcdir"
    
    # Find the extracted directory
    local _dir=$(find . -maxdepth 1 -type d -name "aliyunpan-v${pkgver}-linux-*" | head -1)
    
    if [ -z "$_dir" ]; then
        # Fallback: look for the binary directly
        install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    else
        install -Dm755 "$_dir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    fi
    
    # Install license
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
Apache License, Version 2.0
See https://github.com/tickstep/aliyunpan for full license text.
EOF
}
