PORTNAME=	kwin
DISTVERSION=	${KDE_PLASMA_VERSION}
PORTREVISION=	1
CATEGORIES=	x11-wm kde kde-plasma

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Plasma5 window manager

LICENSE=	GPLv2

LIB_DEPENDS=	libXcursor.so:x11/libXcursor \
		libdrm.so:graphics/libdrm \
		libepoxy.so:graphics/libepoxy \
		libepoll-shim.so:devel/libepoll-shim \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libinput.so:x11/libinput \
		libudev.so:devel/libudev-devd \
		libwayland-cursor.so:graphics/wayland \
		libxcb-cursor.so:x11/xcb-util-cursor \
		libxcb-icccm.so:x11/xcb-util-wm \
		libxcb-image.so:x11/xcb-util-image \
		libxcb-keysyms.so:x11/xcb-util-keysyms \
		libxkbcommon.so:x11/libxkbcommon
BUILD_DEPENDS=	${LOCALBASE}/include/linux/input.h:devel/evdev-proto \
		xwayland-devel>0:x11-servers/xwayland-devel
RUN_DEPENDS=	xwayland-devel>0:x11-servers/xwayland-devel

USES=		cmake compiler:c++11-lib cpe gettext gl gnome kde:5 pkgconfig python:3.5+,run \
		qt:5 shebangfix tar:xz xorg
USE_GL=		egl
USE_GNOME=	glib20
USE_KDE=	activities activities attica auth breeze codecs \
		completion config configwidgets coreaddons crash decoration \
		doctools_build globalaccel i18n iconthemes idletime init \
		jobwidgets kcmutils kdeclarative kio kwayland-server kscreenlocker \
		newstuff notifications package plasma-framework runner service sonnet \
		textwidgets wayland widgetsaddons windowsystem xmlgui
USE_LDCONFIG=	yes
USE_QT=		concurrent core dbus declarative gui multimedia network script \
		sensors testlib uiplugin uitools widgets x11extras xml \
		buildtools_build qmake_build \
		quickcontrols2_run virtualkeyboard_run
USE_XORG=	ice sm x11 xcb xext xi
SHEBANG_FILES=	kconf_update/*.py \
		kconf_update/*.pl

post-patch:
	${REINPLACE_CMD} '/sysmacros.h/d' \
		${PATCH_WRKSRC}/logind.cpp

.include <bsd.port.mk>
