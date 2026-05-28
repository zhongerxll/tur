TERMUX_PKG_HOMEPAGE=https://github.com/c0re100/qBittorrent-Enhanced-Edition
TERMUX_PKG_DESCRIPTION="[Unofficial] qBittorrent Enhanced, based on qBittorrent"
TERMUX_PKG_LICENSE="GPL-2.0, GPL-3.0"
TERMUX_PKG_MAINTAINER="zhongerxll"
TERMUX_PKG_VERSION="5.1.3.10"
TERMUX_PKG_SRCURL="https://github.com/c0re100/qBittorrent-Enhanced-Edition/archive/refs/tags/release-${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256=b153428db354775de59b850751ad9d6bafb418dde115b3208b41eab14308f6d1
TERMUX_PKG_DEPENDS="libc++, libtorrent-rasterbar, openssl, qt6-qtbase, zlib"
TERMUX_PKG_BUILD_DEPENDS="qt6-qtsvg, qt6-qttools, boost"
TERMUX_PKG_RECOMMENDS="python"
TERMUX_PKG_SUGGESTS="jackett"
TERMUX_PKG_REPLACES="qbittorrent, qbittorrent-nox"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_TAG_TYPE=newest-tag
TERMUX_PKG_UPDATE_VERSION_REGEXP='\d+\.\d+\.\d+\.\d+'
TERMUX_PKG_EXTRA_CONFIGURE_ARGS='
-DBUILD_SHARED_LIBS=OFF
-DCMAKE_BUILD_TYPE=Release
-DSTACKTRACE=OFF
'

# based on the secondary `-shared` build in `libncnn`
termux_step_post_make_install() {
	echo -e "termux - building qbittorrent-enhanced-edition-nox for arch ${TERMUX_ARCH}..."
	TERMUX_PKG_EXTRA_CONFIGURE_ARGS+='-DGUI=OFF'
	termux_step_configure
	termux_step_make
	termux_step_make_install
}
