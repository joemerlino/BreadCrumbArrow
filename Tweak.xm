%group SHOW
%hook UIStatusBarItem
+ (BOOL)isItemWithTypeExclusive:(int)arg1{
	if(arg1 == 32)
		return NO;
	else return %orig;
}
%end
%end

%group NAME
%hook UIStatusBarBreadcrumbItemView
static id a;
- (id)destinationText{
	a = %orig;
	return %orig;
}
- (id)shortenedTitleWithCompressionLevel:(int)arg1{
	return a;
}
%end
%end

%group COMPACT
%hook UIStatusBarBreadcrumbItemView
- (id)shortenedTitleWithCompressionLevel:(int)arg1{
	arg1 = 1;
	return %orig;
}
%end
%end

static void PreferencesCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	CFPreferencesAppSynchronize(CFSTR("com.joemerlino.breadcrumbarrow"));
}

%ctor
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, PreferencesCallback, CFSTR("com.joemerlino.breadcrumbarrow.preferencechanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/private/var/mobile/Library/Preferences/com.joemerlino.breadcrumbarrow.plist"];
	BOOL name = ([prefs objectForKey:@"name"] ? [[prefs objectForKey:@"name"] boolValue] : NO);
	%init(SHOW);
	if (name)
        %init(NAME);
    else
    	%init(COMPACT);
}
