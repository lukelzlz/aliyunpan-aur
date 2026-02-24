#!/bin/bash

# 阿里云盘 Wine 启动脚本

APPNAME="aliyunpan"
PREFIX="$HOME/.local/share/wineprefixes/${APPNAME}"
EXE_DIR="/opt/${APPNAME}"
SETUP_EXE=$(ls "${EXE_DIR}/setup/"*.exe 2>/dev/null | head -1)
INSTALL_EXE="${PREFIX}/drive_c/Program Files/阿里云盘/aDrive.exe"

# 创建 Wine 前缀
init_prefix() {
    if [ ! -d "${PREFIX}" ]; then
        echo "首次运行，正在初始化 Wine 环境..."
        mkdir -p "${PREFIX}"
        WINEPREFIX="${PREFIX}" wineboot -i
        
        # 安装程序
        if [ -f "${SETUP_EXE}" ]; then
            echo "正在安装阿里云盘..."
            WINEPREFIX="${PREFIX}" wine "${SETUP_EXE}" /S
        fi
    fi
}

# 检查是否需要安装
check_install() {
    if [ ! -f "${INSTALL_EXE}" ]; then
        init_prefix
    fi
}

# 运行程序
run() {
    check_install
    WINEPREFIX="${PREFIX}" wine "${INSTALL_EXE}" "$@"
}

# 安装模式
install() {
    init_prefix
    if [ -f "${SETUP_EXE}" ]; then
        WINEPREFIX="${PREFIX}" wine "${SETUP_EXE}"
    else
        echo "找不到安装程序"
        exit 1
    fi
}

# 卸载模式
uninstall_app() {
    if [ -f "${PREFIX}/drive_c/Program Files/阿里云盘/uninstall.exe" ]; then
        WINEPREFIX="${PREFIX}" wine "${PREFIX}/drive_c/Program Files/阿里云盘/uninstall.exe"
    else
        echo "未找到卸载程序，手动删除: ${PREFIX}"
    fi
}

# Wine 配置
winecfg() {
    WINEPREFIX="${PREFIX}" winecfg
}

# 帮助
help() {
    echo "用法: ${APPNAME} [命令]"
    echo ""
    echo "命令:"
    echo "  (无参数)    运行阿里云盘"
    echo "  install     重新安装"
    echo "  uninstall   卸载"
    echo "  winecfg     Wine 配置"
    echo "  help        显示帮助"
}

# 主逻辑
case "$1" in
    install)
        install
        ;;
    uninstall)
        uninstall_app
        ;;
    winecfg)
        winecfg
        ;;
    help|--help|-h)
        help
        ;;
    *)
        run "$@"
        ;;
esac
