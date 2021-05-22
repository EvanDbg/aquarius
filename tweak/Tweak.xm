#import "headers.h"
%group musicplayer
%hook MRUNowPlayingHeaderView // hides the little routing button
- (void)setShowRoutingButton:(BOOL)arg1 {
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if(![controller respondsToSelector:@selector(context)]){
		%orig;
	}
	else if ( controller.context == 2 && isRoutingButtonHidden) {
		arg1 = NO;
	}
	%orig(arg1);
}
%end
%hook MRUNowPlayingControlsView 
-(void)setNeedsLayout{

	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor]; //s/o lightmann for this it allows me to only change the lockscreen player and not the cc player // for the artwork background option, looks shit with the standard artwork there, unfortunately not working right noew along with the rest of the artwork background stuff
	if (controller.context == 2 && configurations == 0) {
		[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame) + 5,CGRectGetMidY(self.headerView.frame)-15, self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
		//resizing controls, almost same for everytime i do this
		[self.headerView.artworkView setHidden:YES];
		if (!songImageForSmall) {
			songImageForSmall = [UIButton new];
			[songImageForSmall setContentMode:UIViewContentModeScaleAspectFill];
			[songImageForSmall setClipsToBounds:YES];
			[songImageForSmall setAdjustsImageWhenHighlighted:NO];
			[songImageForSmall setAlpha:1];
			[songImageForSmall.layer setCornerRadius:8];
			[self addSubview:songImageForSmall];
			[songImageForSmall setTranslatesAutoresizingMaskIntoConstraints:YES];
			[songImageForSmall setFrame:CGRectMake(self.headerView.artworkView.frame.origin.x,self.headerView.artworkView.frame.origin.y-10, 100, 100)];
			if (!artistNameLabel) {
			artistNameLabel = [MarqueeLabel new];
			[artistNameLabel setFont:[UIFont systemFontOfSize:15]];
			[artistNameLabel setTextAlignment:NSTextAlignmentLeft];
			[artistNameLabel setAlpha:1];
			[self addSubview:artistNameLabel];
			UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customTitleLabelColor" fallback:@"000000"];
			[artistNameLabel setTextColor:customColor];
			[artistNameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
			[artistNameLabel.widthAnchor constraintEqualToConstant:230].active = YES;
			[artistNameLabel.heightAnchor constraintEqualToConstant:21.0].active = YES;
			[artistNameLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[artistNameLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.topAnchor constant:3].active = YES;
		}
		if (!songTitleLabel) {
			songTitleLabel = [MarqueeLabel new];
			[songTitleLabel setFont:[UIFont systemFontOfSize:15]];
			[songTitleLabel setTextAlignment:NSTextAlignmentLeft];
			[songTitleLabel setAlpha:1];
			[self addSubview:songTitleLabel];
			{
			UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customSubtitleLabelColor" fallback:@"000000"];
			[songTitleLabel setTextColor:customColor];
			}
			[songTitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
			[songTitleLabel.widthAnchor constraintEqualToConstant:230].active = YES;
			[songTitleLabel.heightAnchor constraintEqualToConstant:21.0].active = YES;
			[songTitleLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[songTitleLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.centerYAnchor constant:-20].active = YES;
		}
			//couldnt adjust the size of the player so i just made a thing myself (its a button because i have the plan of adding gestures in the future)
		}
	} else if (configurations == 1 && controller.context == 2) {	
		[self.headerView.artworkView setHidden:YES];
		[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame) + 5,CGRectGetMinY(self.headerView.frame) + 40, self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
		[self.timeControlsView setFrame: CGRectMake(CGRectGetMinX(self.headerView.artworkView.frame),CGRectGetMinY(self.frame) + 53, self.timeControlsView.frame.size.width, self.timeControlsView.frame.size.height)];
		[self.headerView.artworkView setHidden:YES];
		if (!songImageForSmall) {
			songImageForSmall = [UIButton new];
			[songImageForSmall setContentMode:UIViewContentModeScaleAspectFill];
			[songImageForSmall setClipsToBounds:YES];
			[songImageForSmall setAdjustsImageWhenHighlighted:NO];
			[songImageForSmall setAlpha:1];
			[songImageForSmall.layer setCornerRadius:8];
			[self addSubview:songImageForSmall];
			[songImageForSmall setTranslatesAutoresizingMaskIntoConstraints:YES];
			[songImageForSmall setFrame:CGRectMake(self.headerView.artworkView.frame.origin.x,self.headerView.artworkView.frame.origin.y-10, 90, 90)];
		}
			if (!artistNameLabel) {
			artistNameLabel = [MarqueeLabel new];
			[artistNameLabel setFont:[UIFont systemFontOfSize:15]];
			[artistNameLabel setTextAlignment:NSTextAlignmentLeft];
			[artistNameLabel setAlpha:1];
			[self addSubview:artistNameLabel];
			UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customTitleLabelColor" fallback:@"000000"];
			[artistNameLabel setTextColor:customColor];
			[artistNameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
			[artistNameLabel.widthAnchor constraintEqualToConstant:230].active = YES;
			[artistNameLabel.heightAnchor constraintEqualToConstant:21.0].active = YES;
			[artistNameLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[artistNameLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.topAnchor constant:3].active = YES;
		}
		if (!songTitleLabel) {
			songTitleLabel = [MarqueeLabel new];
			[songTitleLabel setFont:[UIFont systemFontOfSize:15]];
			[songTitleLabel setTextAlignment:NSTextAlignmentLeft];
			[songTitleLabel setAlpha:1];
			[self addSubview:songTitleLabel];
			{
			UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customSubtitleLabelColor" fallback:@"000000"];
			[songTitleLabel setTextColor:customColor];
			}
			[songTitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
			[songTitleLabel.widthAnchor constraintEqualToConstant:230].active = YES;
			[songTitleLabel.heightAnchor constraintEqualToConstant:21.0].active = YES;
			[songTitleLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[songTitleLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.centerYAnchor constant:-20].active = YES;
		}
	} else if (configurations == 2 && controller.context == 2) {
		[self.volumeControlsView setFrame:CGRectMake(CGRectGetMinX(self.headerView.artworkView.frame),CGRectGetMinY(self.frame) + 55, self.timeControlsView.frame.size.width, self.timeControlsView.frame.size.height)];
		[self.timeControlsView setHidden:YES];
		[self.headerView.artworkView setHidden:YES];
		[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame) + 5,CGRectGetMinY(self.headerView.frame) + 40, self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
		if (!songImageForSmall) {
			songImageForSmall = [UIButton new];
			[songImageForSmall setContentMode:UIViewContentModeScaleAspectFill];
			[songImageForSmall setClipsToBounds:YES];
			[songImageForSmall setAdjustsImageWhenHighlighted:NO];
			[songImageForSmall setAlpha:1];
			[songImageForSmall.layer setCornerRadius:8];
			[self addSubview:songImageForSmall];
			[songImageForSmall setTranslatesAutoresizingMaskIntoConstraints:YES];
			[songImageForSmall setFrame:CGRectMake(self.headerView.artworkView.frame.origin.x,self.headerView.artworkView.frame.origin.y-10, 85, 85)];
			//couldnt adjust the size of the artwork so i just made a thing myself (its a button because i have the plan of adding gestures in the future)
		}
		if (!artistNameLabel) {
			artistNameLabel = [MarqueeLabel new];
			[artistNameLabel setFont:[UIFont systemFontOfSize:15]];
			[artistNameLabel setTextAlignment:NSTextAlignmentLeft];
			[artistNameLabel setAlpha:1];
			[self addSubview:artistNameLabel];
			UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customTitleLabelColor" fallback:@"000000"];
			[artistNameLabel setTextColor:customColor];
			[artistNameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
			[artistNameLabel.widthAnchor constraintEqualToConstant:230].active = YES;
			[artistNameLabel.heightAnchor constraintEqualToConstant:21.0].active = YES;
		    [artistNameLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[artistNameLabel.bottomAnchor constraintEqualToAnchor:songImageForSmall.centerYAnchor constant:3].active = YES;
		}
		if (!songTitleLabel) {
		songTitleLabel = [MarqueeLabel new];
				[songTitleLabel setFont:[UIFont systemFontOfSize:15]];
				[songTitleLabel setTextAlignment:NSTextAlignmentLeft];
				[songTitleLabel setAlpha:1];
				[self addSubview:songTitleLabel];
				{
				UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customSubtitleLabelColor" fallback:@"000000"];
				[songTitleLabel setTextColor:customColor];
				}
				[songTitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
				[songTitleLabel.widthAnchor constraintEqualToConstant:230].active = YES;
				[songTitleLabel.heightAnchor constraintEqualToConstant:21.0].active = YES;
				[songTitleLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
				[songTitleLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.centerYAnchor constant:-20].active = YES;
		}
	} else if (configurations == 3  && controller.context == 2) {
		//small option
		[self.headerView.artworkView setHidden:YES];
		[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame) + 5,CGRectGetMinY(self.headerView.frame) + 30, self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
		if (!songImageForSmall) {
			songImageForSmall = [UIButton new];
			[songImageForSmall setContentMode:UIViewContentModeScaleAspectFill];
			[songImageForSmall setClipsToBounds:YES];
			[songImageForSmall setAdjustsImageWhenHighlighted:NO];
			[songImageForSmall setAlpha:1];
			[songImageForSmall.layer setCornerRadius:8];
			[self addSubview:songImageForSmall];
			[songImageForSmall setTranslatesAutoresizingMaskIntoConstraints:YES];
			[songImageForSmall setFrame:CGRectMake(self.headerView.artworkView.frame.origin.x,self.headerView.artworkView.frame.origin.y-10, 85, 85)];
			//couldnt adjust the size of the player so i just made a thing myself (its a button because i have the plan of adding gestures in the future)
		}
		if (!artistNameLabel) {
			artistNameLabel = [MarqueeLabel new];
			[artistNameLabel setFont:[UIFont systemFontOfSize:15]];
			[artistNameLabel setTextAlignment:NSTextAlignmentLeft];
			[artistNameLabel setAlpha:1];
			[self addSubview:artistNameLabel];
			UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customTitleLabelColor"];
			[artistNameLabel setTextColor:customColor];
			[artistNameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
			[artistNameLabel.widthAnchor constraintEqualToConstant:230].active = YES;
			[artistNameLabel.heightAnchor constraintEqualToConstant:21.0].active = YES;
			[artistNameLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[artistNameLabel.bottomAnchor constraintEqualToAnchor:songImageForSmall.centerYAnchor constant:3].active = YES;
		}
		if (!songTitleLabel) {
			songTitleLabel = [MarqueeLabel new];
			[songTitleLabel setFont:[UIFont systemFontOfSize:15]];
			[songTitleLabel setTextAlignment:NSTextAlignmentLeft];
			[songTitleLabel setAlpha:1];
			[self addSubview:songTitleLabel];
			{
				UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customSubtitleLabelColor"];
				[songTitleLabel setTextColor:customColor];
			}
			[songTitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
			[songTitleLabel.widthAnchor constraintEqualToConstant:230].active = YES;
			[songTitleLabel.heightAnchor constraintEqualToConstant:21.0].active = YES;
			[songTitleLabel.leftAnchor constraintEqualToAnchor:songImageForSmall.rightAnchor constant:rightOffsetForText].active = YES;
			[songTitleLabel.bottomAnchor constraintEqualToAnchor:self.transportControlsView.centerYAnchor constant:-20].active = YES;
		}
	} else{ 
		%orig;
		}
}
%end

%hook MRUNowPlayingLabelView  // hide the original label

- (void)setFrame:(CGRect)arg1{
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if (![controller respondsToSelector:@selector(context)] ){
		%orig;
	}
	else if ( controller.context == 2){
		[self setHidden:YES];
	}
	else %orig;
}



%end
%hook MRUNowPlayingTransportControlsView // coloring for the buttons

- (void)setNeedsLayout { //ik this is bad but i need it to updaye a lot and there are no other methods that update upon the song changing

	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if (musicPlayerColorsEnabled && controller.context == 2) {
		UIColor *leftColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customLeftButtonColor"];
		[self.leftButton setStylingProvider:nil];
		self.leftButton.imageView.layer.filters = nil;
		[self.leftButton.imageView setTintColor:leftColor];
		
		UIColor *middleColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customMiddleButtonColor"];
		[self.middleButton setStylingProvider:nil];
		self.middleButton.imageView.layer.filters = nil;
		[self.middleButton.imageView setTintColor:middleColor];
		
		UIColor *rightColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"customRightButtonColor"];
		[self.rightButton setStylingProvider:nil];
		self.rightButton.imageView.layer.filters = nil;
		[self.rightButton.imageView setTintColor:rightColor];
	}
}

%end

%hook CSAdjunctItemView // sets the height and opacity of the player

-(void)_updateSizeToMimic{
	%orig;
	[self setTheFuckUp];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTheFuckUp) name:@"com.nico671.updateColors" object:nil];
}

%new 
-(void) setTheFuckUp{
	PLPlatterView *platterView = (PLPlatterView*)MSHookIvar<UIView*>(self, "_platterView");
	[platterView.backgroundView setAlpha: musicPlayerAlpha];
	self.layer.cornerRadius = musicPlayerCornerRadius;
if (musicPlayerLeafLook){
	self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMaxYCorner;
}
if(configurations == 0){

 if (haveOutline){
  self.layer.borderWidth = outlineSize;
 if (!haveOutlineSecondaryColorMusicPlayer){
 UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"outlineColor"];
  self.layer.borderColor = [customColor CGColor];
  }
  else {
	self.layer.borderColor = [fuckingArtworkColor2 CGColor];
  }
  self.layer.cornerRadius = musicPlayerCornerRadius;
  }
[self.heightAnchor constraintEqualToConstant:115].active = true; //height
if (isArtworkBackground){
songBackground = [UIButton new];
[songBackground setContentMode:UIViewContentModeScaleAspectFill];
[songBackground setClipsToBounds:YES];
[songBackground setAdjustsImageWhenHighlighted:NO];
[songBackground setAlpha:musicPlayerAlpha];
[songBackground.layer setCornerRadius:musicPlayerCornerRadius];
 [platterView.backgroundView setAlpha: 0];
[self addSubview:songBackground];
[self sendSubviewToBack: songBackground];
[songBackground setTranslatesAutoresizingMaskIntoConstraints:YES];
[songBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];

}

if (isBackgroundColored){
 [platterView.backgroundView setAlpha: 0];
  self.backgroundColor = fuckingArtworkColor;
}



}
else if(configurations == 1 || configurations == 2){

   if (haveOutline){
  self.layer.borderWidth = outlineSize;
if (!haveOutlineSecondaryColorMusicPlayer){
 UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"outlineColor"];
  self.layer.borderColor = [customColor CGColor];
  }
  else {
	    self.layer.borderColor = [fuckingArtworkColor2 CGColor];
  }
  self.layer.cornerRadius = musicPlayerCornerRadius;
  }
[self.heightAnchor constraintEqualToConstant:130].active = true;
if (isArtworkBackground){
songBackground = [UIButton new];
 [platterView.backgroundView setAlpha: 0];
[songBackground setContentMode:UIViewContentModeScaleAspectFill];
[songBackground setClipsToBounds:YES];
[songBackground setAdjustsImageWhenHighlighted:NO];
[songBackground setAlpha:musicPlayerAlpha];
[songBackground.layer setCornerRadius:musicPlayerCornerRadius];
[self addSubview:songBackground];
[self sendSubviewToBack: songBackground];
[songBackground setAlpha:musicPlayerAlpha];
[songBackground setTranslatesAutoresizingMaskIntoConstraints:YES];
[songBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
}

if (isBackgroundColored){
 [platterView.backgroundView setAlpha: 0];
    self.backgroundColor = fuckingArtworkColor;
}


}
else if(configurations == 3){
	[self.heightAnchor constraintEqualToConstant:100].active = true;
  if (haveOutline){
  self.layer.borderWidth = outlineSize;
  if (!haveOutlineSecondaryColorMusicPlayer){
 UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"outlineColor"];
  self.layer.borderColor = [customColor CGColor];
  }
  else {
	    self.layer.borderColor = [fuckingArtworkColor2 CGColor];
  }
  self.layer.cornerRadius = musicPlayerCornerRadius;
  }
}

  
if (isArtworkBackground){
   [platterView.backgroundView setAlpha: 0];
songBackground = [UIButton new];
[songBackground setContentMode:UIViewContentModeScaleAspectFill];
[songBackground setClipsToBounds:YES];
[songBackground setAdjustsImageWhenHighlighted:NO];
[songBackground setAlpha:musicPlayerAlpha];
[songBackground.layer setCornerRadius:musicPlayerCornerRadius];
[self addSubview:songBackground];
[self sendSubviewToBack: songBackground];
[songBackground setTranslatesAutoresizingMaskIntoConstraints:YES];
[songBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
}

if (isBackgroundColored){
 [platterView.backgroundView setAlpha: 0];
    self.backgroundColor = fuckingArtworkColor;
}

}

%end

%hook SBMediaController
- (void)setNowPlayingInfo:(id)arg1 { 
    %orig;
    MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
        if (information) {
			NSDictionary *dict = (__bridge NSDictionary *)information;
			currentArtwork = [UIImage imageWithData:[dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData]]; 
			if (dict) {
				[songTitleLabel setText:[NSString stringWithFormat:@"%@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoTitle]]]; // set song title
				lastArtworkData = [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData];
				[artistNameLabel setText:[NSString stringWithFormat:@"%@ - %@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtist], [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoAlbum]]]; // set artist and album name          
				subtitleLabel = [NSString stringWithFormat:@"%@ - %@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtist], [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoAlbum]];
				songLabel = [NSString stringWithFormat:@"%@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoTitle]];
				[songBackground setImage:currentArtwork forState:UIControlStateNormal];
				[songImageForSmall setImage:currentArtwork forState:UIControlStateNormal]; 
				fuckingArtworkColor = [libKitten primaryColor:currentArtwork];
				fuckingArtworkColor2 = [libKitten secondaryColor:currentArtwork];
	
				[[NSNotificationCenter defaultCenter] postNotificationName:@"com.nico671.updateColors" object:nil];
			}
        }
  	});
	if (haveNotifs) {
			if (![songLabel isEqualToString:previousTitle]){
			[[objc_getClass("JBBulletinManager") sharedInstance] showBulletinWithTitle:subtitleLabel message:songLabel bundleID:[[[%c(SBMediaController) sharedInstance] nowPlayingApplication] bundleIdentifier]];
			}
			previousTitle = songLabel; //notifications
	}

}          
%end


%end

%group statusbar
%hook _UIBatteryView

-(void)setFillColor:(UIColor *)color {
  UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"batteryFillColor"];
	%orig(customColor);
	if(isBatteryHidden) self.hidden = YES;
}

-(void)setBodyColor:(UIColor *)color {
UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"batteryFillColor"];
	%orig(customColor);
}

%end
 
%hook _UIStatusBarVisualProvider_Split54
+(CGSize)notchSize {
    CGSize const orig = %orig;
    return CGSizeMake(orig.width, 18);
}
+(double)height {
    return 20;
}
%end

%hook _UIStatusBarWifiSignalView
-(void)didMoveToWindow{
	%orig;
	if (isWifiThingyHidden){
	self.hidden = YES;
	}
}
%end
%hook _UIStatusBarCellularSignalView
-(void)setNeedsLayout{
	%orig;
	if (isCellularThingyHidden){
	self.hidden = YES;
	}

}
%end
%hook _UIStatusBarSignalView

-(void)setActiveColor:(UIColor *)color {
	UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"cellularColor"];
	%orig(customColor);
}

-(void)setInactiveColor:(UIColor *)color {
	UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"cellularColor"];
	%orig(customColor);
}

%end


%hook _UIStatusBar
-(void)setNeedsLayout{
	
	if (modernStatusBar){
	self.visualProviderClass =  @"_UIStatusBarVisualProvider_Split54";
	}
	else %orig;
}
%end



%hook _UIStatusBarStringView

-(void)didMoveToWindow{
	%orig;
	if (isTimeHidden){
	self.hidden = YES;
	}
}
-(void)setTextColor:(UIColor *)color {
				UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"timeColor"];
	%orig(customColor);
}

%end
%end

%group notifications
%hook NCNotificationListCell
-(void)layoutSubviews{
	%orig;
	if (isNotificationSectionEnabled){
	self.backgroundColor = [UIColor clearColor];
	}

}
%end

%hook NCNotificationContentView
-(void)setNeedsLayout{
	%orig;
	if (hideSnapImage){
	UIImageView *replacementSnapImage = (UIImageView*)MSHookIvar<UIImageView*>(self, "_thumbnailImageView");
	replacementSnapImage.hidden = YES;
	}
}
%end

%hook PLPlatterHeaderContentView
-(void)setNeedsLayout {
	%orig;
	if (colorNotifs){
	iconImage = [self.icons objectAtIndex:0];
	}
}
%end

%hook NCNotificationShortLookView

-(void)setNeedsLayout {
	%orig; 
	if (colorNotifs){
	self.backgroundColor = [libKitten primaryColor:iconImage];
	self.layer.cornerRadius = notifCornerRadius;
	yesmf = [self.subviews objectAtIndex:0];
	yesmf.hidden = YES;
	}
	if (leafCornerNotifs)
	self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMaxYCorner;
}
%end
%end
/*
%group callbannertest
%hook SBInCallBannerPresentableViewController
+(double)cornerRadius{
	return 1;
	//NSLog(@"[aquarius] %@",[self.subviews objectAtIndex:0]);
}
-(BOOL)_canShowWhileLocked{
	return YES;
}
%end


%end
*/
%group springy
%hook SBIconProgressView //progressbar
-(void)_drawPieWithCenter:(CGPoint)arg1{
    UIProgressView *progressView;
	progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
	progressView.progressTintColor = [UIColor cyanColor];
	[progressView.layer setFrame:CGRectMake(self.center.x-25, self.center.y+15, 50, 7.5)];
	progressView.trackTintColor = [UIColor systemGrayColor];
	[progressView setProgress:self.displayedFraction animated:NO];
	[[progressView layer]setCornerRadius:5];	
	[[progressView layer]setMasksToBounds:TRUE];
	progressView.clipsToBounds = YES;
	[self addSubview:progressView];
	[self bringSubviewToFront: progressView];
}
-(void)_drawPauseUIWithCenter:(CGPoint)arg1{
	
}
%end
%end
void reloadPrefs() { //prefs
	musicPlayerEnabled = [file boolForKey:@"isMusicSectionEnabled"];
	statusBarSectionEnabled = [file boolForKey:@"isStausBarSectionEnabled"];
	hideSnapImage = [file boolForKey:@"hideSnapImage"];
	leafCornerNotifs = [file boolForKey:@"leafCornerNotifs"];
	isBatteryHidden = [file boolForKey:@"isBatteryHidden"];
	isWifiThingyHidden = [file boolForKey:@"isWifiHidden"];
	isCellularThingyHidden = [file boolForKey:@"isCellularHidden"];
	isTimeHidden = [file boolForKey:@"isTimeHidden"];
	modernStatusBar = [file boolForKey:@"modernStatusBar"];
	isRoutingButtonHidden = [file boolForKey:@"isRoutingButtonHidden"];
	configurations = [file integerForKey:@"configuration"];
	musicPlayerAlpha = [file doubleForKey:@"musicPlayerAlpha"];
	rightOffsetForText = [file doubleForKey:@"textOffset"];
	musicPlayerColorsEnabled = [file boolForKey:@"isRoutingButtonHidden"];
	haveNotifs = [file boolForKey:@"notifications?"]; 
	showPercentage = [file boolForKey:@"showPercentage"]; 
	isBackgroundColored = [file boolForKey:@"isBackgroundColorEnabled"];
	isArtworkBackground = [file boolForKey:@"isArtworkBackground"];
	isNotificationSectionEnabled = [file boolForKey:@"isNotificationSectionEnabled"];
	haveOutline = [file boolForKey:@"haveOutline?"];
	outlineSize = [file doubleForKey:@"sizeOfOutline"];
	musicPlayerCornerRadius = [file doubleForKey:@"musicPlayerCornerRadius"];
	notifCornerRadius = [file doubleForKey:@"notifCornerRadius"];
	haveOutlineSecondaryColorMusicPlayer = [file boolForKey:@"haveOutlineSecondaryColorMusicPlayer"];
	isSpringySectionEnabled = [file boolForKey:@"isSpringySectionEnabled"];
	downloadBarEnabled = [file boolForKey:@"downloadBarEnabled"];
	colorNotifs = [file boolForKey:@"colorNotifs"];
	musicPlayerLeafLook = [file boolForKey:@"musicPlayerLeafLook"];
	
}

%ctor {
	HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"aquariusprefs"];
	[file registerBool:&musicPlayerEnabled default:YES forKey:@"isMusicSectionEnabled"];
	[file registerBool:&isTimeHidden default:NO forKey:@"isTimeHidden"];
	[file registerBool:&hideSnapImage default:YES forKey:@"hideSnapImage"];
	[file registerBool:&isBatteryHidden default:NO forKey:@"isBatteryHidden"];
	[file registerBool:&isCellularThingyHidden default:NO forKey:@"isCellularHidden"];
	[file registerBool:&isWifiThingyHidden default:NO forKey:@"isWifiHidden"];
	[file registerBool:&modernStatusBar default:YES forKey:@"modernStatusBar"];
	[file registerBool:&statusBarSectionEnabled default:YES forKey:@"isStausBarSectionEnabled"];
	[file registerBool:&isRoutingButtonHidden default:YES forKey:@"isRoutingButtonHidden"];
	[file registerDouble:&musicPlayerAlpha default:1 forKey:@"musicPlayerAlpha"];
	[file registerDouble:&rightOffsetForText default:1 forKey:@"textOffset"];
	[file registerInteger:&configurations default:0 forKey:@"configuration"];
	[file registerBool:&musicPlayerColorsEnabled default:NO forKey:@"isColorsEnabled"];
	[file registerBool:&haveNotifs default:YES forKey:@"notifications?"];
	[file registerBool:&isBackgroundColored default:NO forKey:@"isBackgroundColorEnabled"];
	[file registerBool:&isArtworkBackground default:NO forKey:@"isArtworkBackground"];
	[file registerBool:&haveOutline default:NO forKey:@"haveOutline?"];
	[file registerBool:&showPercentage default:NO forKey:@"showPercentage"];
	[file registerBool:&isNotificationSectionEnabled default:NO forKey:@"isNotificationSectionEnabled"];
	[file registerDouble:&outlineSize default:5 forKey:@"sizeOfOutline"];
	[file registerDouble:&musicPlayerCornerRadius default:5 forKey:@"musicPlayerCornerRadius"];
	[file registerDouble:&notifCornerRadius default:5 forKey:@"notifsCornerRadius"];
	[file registerBool:&haveOutlineSecondaryColorMusicPlayer default:NO forKey:@"haveOutlineSecondaryColorMusicPlayer"];
	[file registerBool:&isSpringySectionEnabled default:YES forKey:@"isSpringySectionEnabled"];
	[file registerBool:&downloadBarEnabled default:NO forKey:@"downloadBarEnabled"];
	[file registerBool:&colorNotifs default:NO forKey:@"colorNotifs"];
	[file registerBool:&leafCornerNotifs default:NO forKey:@"leafCornerNotifs"];
	 [file registerBool:&musicPlayerLeafLook default:NO forKey:@"musicPlayerLeafLook"];
 	if (isNotificationSectionEnabled) {
	 	%init(notifications);
 	}
	if (musicPlayerEnabled) {
        %init(musicplayer);
	}
	if (statusBarSectionEnabled){
		%init(statusbar);
	}
	if (isSpringySectionEnabled){
		%init(springy);
	}
	//%init (callbannertest);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.nico671.preferenceschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}