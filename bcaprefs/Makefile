include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = BCAPrefs
BCAPrefs_FILES = BCAPrefsRootListController.m
BCAPrefs_INSTALL_PATH = /Library/PreferenceBundles
BCAPrefs_FRAMEWORKS = UIKit
BCAPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BCAPrefs.plist$(ECHO_END)
