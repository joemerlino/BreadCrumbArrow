static BOOL name;

%group NOIMAGE
%hook _UIStatusBarSystemNavigationItemButton 
- (struct CGRect )imageRectForContentRect:(struct CGRect)arg1{
	return CGRectMake(0,0,0,0);
}
%end
%end

%group CARRIER
%hook UIStatusBarItem
+ (BOOL)isItemWithTypeExclusive:(int)arg1{
	if(arg1 == 32)
		return NO;
	else return %orig;
}
+ (BOOL)isItemWithTypeExclusive:(int)arg1 outBlacklistItems:(id)arg2 outWhitelistItems:(id)arg3{
	if(arg1 == 32)
		return NO;
	else return %orig;
}
%end
%end

%group MOD
id a;
static BOOL draw = NO;
static float bread = 0;

%hook UIStatusBarBreadcrumbItemView
- (id)destinationText{
	a = %orig;
	return %orig;
}
- (id)shortenedTitleWithCompressionLevel:(int)arg1{
	if(!name)
		arg1 = 1;
	id title = %orig;
	if(title)
		return a;
	return %orig;
}
%end
%end
// float correctly the breadcrumb before the airplane icon
%group FLOATING
%hook UIStatusBarSystemNavigationItemView
- (struct CGSize)_buttonSize{
	CGSize btn = %orig;
	bread = btn.width; 
	draw = YES;
	return %orig;
}
%end
%hook UIStatusBarItemView
- (void)setVisible:(BOOL)arg1 frame:(struct CGRect )arg2 duration:(double)arg3{
	if([NSStringFromClass([self class]) containsString:@"UIStatusBarBreadcrumbItemView"])
		arg2.origin.x = 6;
	%orig;
}
%end
%hook UIStatusBarAirplaneModeItemView
- (void)setVisible:(BOOL)arg1 frame:(struct CGRect )arg2 duration:(double)arg3{
	if(draw){
		draw = NO;
		arg3 = 0.5;
		arg2.origin.x += bread + 6;
	}
	%orig;
}
%end
%end

%group HIDE
%hook UIStatusBarItem
+ (BOOL)isItemWithTypeExclusive:(int)arg1{
	if(arg1 == 32)
		return NO;
	else return %orig;
}
+ (BOOL)isItemWithTypeExclusive:(int)arg1 outBlacklistItems:(id)arg2 outWhitelistItems:(id)arg3{
	if(arg1 == 32)
		return NO;
	else return %orig;
}
%end
%hook UIStatusBarSystemNavigationItemView
- (struct CGSize)_buttonSize{
	return CGSizeMake(0,0);
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
	name = ([prefs objectForKey:@"name"] ? [[prefs objectForKey:@"name"] boolValue] : NO);
	static BOOL hide = ([prefs objectForKey:@"hide"] ? [[prefs objectForKey:@"hide"] boolValue] : NO);
	static BOOL carrier = ([prefs objectForKey:@"carrier"] ? [[prefs objectForKey:@"carrier"] boolValue] : YES);
	static BOOL floating = ([prefs objectForKey:@"floating"] ? [[prefs objectForKey:@"floating"] boolValue] : NO);
	if (!name && hide){
		%init(HIDE);
	}
	else{
		%init(MOD);
		if(carrier)
			%init(CARRIER);
		if(floating)
			%init(FLOATING);
		if(hide)
			%init(NOIMAGE);
	}
}
