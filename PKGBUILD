# Maintainer: Luke <lukelzlz@users.noreply.github.com>

pkgname=aliyunpan-wine
_pkgname=aliyunpan
pkgver=6.8.7
pkgrel=1
pkgdesc="阿里云盘官方客户端 - 通过 Wine 运行"
arch=('x86_64')
url="https://www.alipan.com"
license=('custom')
depends=('wine' 'wine-gecko' 'wine-mono' 'xdg-utils')
makedepends=('p7zip')
optdepends=(
    'winetricks: 额外 Windows 组件'
    'ttf-ms-fonts: 微软字体'
)
provides=('aliyunpan')
conflicts=('aliyunpan')

# 官方下载链接（需要手动更新版本号）
_download_url="https://cloud.alipan.com/adrive/download/file/adrive-desktop-${pkgver}-windows-x64.exe"

source=(
    "${_pkgname}-${pkgver}.exe::${_download_url}"
    "${_pkgname}.sh"
    "${_pkgname}.desktop"
)

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    # 创建 Wine 前缀目录结构
    mkdir -p "${srcdir}/wineprefix"
}

package() {
    # 安装 exe 文件
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.exe" \
        "${pkgdir}/opt/${_pkgname}/setup/${_pkgname}-${pkgver}.exe"

    # 安装启动脚本
    install -Dm755 "${srcdir}/${_pkgname}.sh" \
        "${pkgdir}/usr/bin/${_pkgname}"

    # 安装桌面快捷方式
    install -Dm644 "${srcdir}/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # 创建图标目录（Wine 会从 exe 提取）
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    
    # 安装许可证
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<EOF
阿里云盘 客户端

本软件版权归阿里巴巴集团所有。
通过 Wine 在 Linux 上运行，仅用于个人学习和研究目的。

官方网址: https://www.alipan.com
EOF
}
