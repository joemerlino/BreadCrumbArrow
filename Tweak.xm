%hook _UIStatusBarSystemNavigationItemButton
- (struct CGRect )titleRectForContentRect:(struct CGRect )arg1{
	return CGRectMake(0,0,0,0);
}
%end
%hook UIStatusBarSystemNavigationItemView
- (struct CGSize)_buttonSize{
	return CGSizeMake(15,15);
}
%end
%hook UIStatusBarItem
+ (BOOL)isItemWithTypeExclusive:(int)arg1{
	if(arg1 == 32)
		return NO;
	else return %orig;
}
%end