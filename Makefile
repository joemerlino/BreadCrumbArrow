include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BreadCrumbArrow
BreadCrumbArrow_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += bcaprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
