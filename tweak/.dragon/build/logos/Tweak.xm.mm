#line 1 "Tweak.xm"

#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class PLPlatterHeaderContentView; @class MRUNowPlayingLabelView; @class SBMediaController; @class _UIStatusBarStringView; @class _UIStatusBarCellularSignalView; @class _UIStatusBar; @class MRUNowPlayingHeaderView; @class _UIStatusBarSignalView; @class CSAdjunctItemView; @class _UIBatteryView; @class NCNotificationShortLookView; @class _UIStatusBarWifiSignalView; @class NCNotificationListCell; @class NCNotificationContentView; @class _UIStatusBarVisualProvider_Split54; @class MRUNowPlayingControlsView; @class MRUNowPlayingTransportControlsView; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBMediaController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBMediaController"); } return _klass; }
#line 1 "Tweak.xm"
#import "headers.h"
static void (*_logos_orig$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$musicplayer$MRUNowPlayingControlsView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingControlsView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$MRUNowPlayingControlsView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingControlsView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$musicplayer$MRUNowPlayingLabelView$setFrame$)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingLabelView* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$musicplayer$MRUNowPlayingLabelView$setFrame$(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingLabelView* _LOGOS_SELF_CONST, SEL, CGRect); static void (*_logos_orig$musicplayer$MRUNowPlayingTransportControlsView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingTransportControlsView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$MRUNowPlayingTransportControlsView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingTransportControlsView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$musicplayer$CSAdjunctItemView$_updateSizeToMimic)(_LOGOS_SELF_TYPE_NORMAL CSAdjunctItemView* _LOGOS_SELF_CONST, SEL); static void _logos_method$musicplayer$CSAdjunctItemView$_updateSizeToMimic(_LOGOS_SELF_TYPE_NORMAL CSAdjunctItemView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$musicplayer$SBMediaController$setNowPlayingInfo$)(_LOGOS_SELF_TYPE_NORMAL SBMediaController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$musicplayer$SBMediaController$setNowPlayingInfo$(_LOGOS_SELF_TYPE_NORMAL SBMediaController* _LOGOS_SELF_CONST, SEL, id); 

 
static void _logos_method$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingHeaderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if(![controller respondsToSelector:@selector(context)]){
		_logos_orig$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$(self, _cmd, arg1);
	}
	else if ( controller.context == 2 && isRoutingButtonHidden) {
		arg1 = NO;
	}
	_logos_orig$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$(self, _cmd, arg1);
}

 
static void _logos_method$musicplayer$MRUNowPlayingControlsView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingControlsView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){

	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor]; 
	if (controller.context == 2 && configurations == 0) {
		[self.transportControlsView setFrame:CGRectMake(CGRectGetMidX(self.headerView.artworkView.frame) + 5,CGRectGetMidY(self.headerView.frame)-15, self.transportControlsView.frame.size.width, self.transportControlsView.frame.size.height)];
		
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
		_logos_orig$musicplayer$MRUNowPlayingControlsView$setNeedsLayout(self, _cmd);
		}
}


  

static void _logos_method$musicplayer$MRUNowPlayingLabelView$setFrame$(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingLabelView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1){
	MRUNowPlayingViewController *controller = (MRUNowPlayingViewController *)[self _viewControllerForAncestor];
	if (![controller respondsToSelector:@selector(context)] ){
		_logos_orig$musicplayer$MRUNowPlayingLabelView$setFrame$(self, _cmd, arg1);
	}
	else if ( controller.context == 2){
		[self setHidden:YES];
	}
	else _logos_orig$musicplayer$MRUNowPlayingLabelView$setFrame$(self, _cmd, arg1);
}




 

static void _logos_method$musicplayer$MRUNowPlayingTransportControlsView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL MRUNowPlayingTransportControlsView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

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



 

static void _logos_method$musicplayer$CSAdjunctItemView$_updateSizeToMimic(_LOGOS_SELF_TYPE_NORMAL CSAdjunctItemView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$musicplayer$CSAdjunctItemView$_updateSizeToMimic(self, _cmd);
PLPlatterView *platterView = (PLPlatterView*)MSHookIvar<UIView*>(self, "_platterView");
[platterView.backgroundView setAlpha: musicPlayerAlpha];
if(configurations == 0){

 if (haveOutline){
  self.layer.borderWidth = outlineSize;
 if (!haveOutlineSecondaryColorMusicPlayer){
 UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"outlineColor"];
  self.layer.borderColor = [customColor CGColor];
  }
  else {
	
  }
  self.layer.cornerRadius = 10;
  }
[self.heightAnchor constraintEqualToConstant:115].active = true; 
if (isArtworkBackground){
songBackground = [UIButton new];
[songBackground setContentMode:UIViewContentModeScaleAspectFill];
[songBackground setClipsToBounds:YES];
[songBackground setAdjustsImageWhenHighlighted:NO];
[songBackground setAlpha:musicPlayerAlpha];
[songBackground.layer setCornerRadius:8];
 [platterView.backgroundView setAlpha: 0];
[self addSubview:songBackground];
[self sendSubviewToBack: songBackground];
[songBackground setTranslatesAutoresizingMaskIntoConstraints:YES];
[songBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];

}

if (isBackgroundColored){
 [platterView.backgroundView setAlpha: 0];
  coloredBackground = [UIView new];
  coloredBackground.hidden = NO;
  [coloredBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
  [coloredBackground.layer setCornerRadius:10];
  [coloredBackground setAlpha:musicPlayerAlpha];
  [coloredBackground setBackgroundColor:[UIColor clearColor]];
  [self addSubview: coloredBackground];
  [self sendSubviewToBack:coloredBackground];
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
	   
  }
  self.layer.cornerRadius = 10;
  }
[self.heightAnchor constraintEqualToConstant:130].active = true;
if (isArtworkBackground){
songBackground = [UIButton new];
 [platterView.backgroundView setAlpha: 0];
[songBackground setContentMode:UIViewContentModeScaleAspectFill];
[songBackground setClipsToBounds:YES];
[songBackground setAdjustsImageWhenHighlighted:NO];
[songBackground setAlpha:musicPlayerAlpha];
[songBackground.layer setCornerRadius:8];
[self addSubview:songBackground];
[self sendSubviewToBack: songBackground];
[songBackground setAlpha:musicPlayerAlpha];
[songBackground setTranslatesAutoresizingMaskIntoConstraints:YES];
[songBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
}

if (isBackgroundColored){
 [platterView.backgroundView setAlpha: 0];
  coloredBackground = [UIView new];
    coloredBackground.hidden = NO;
  [coloredBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
  [coloredBackground.layer setCornerRadius:10];
  [coloredBackground setAlpha:musicPlayerAlpha];
  [coloredBackground setBackgroundColor:[UIColor clearColor]];
  [self addSubview: coloredBackground];
  [self sendSubviewToBack:coloredBackground];
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
	    
  }
  self.layer.cornerRadius = 10;
  }
}

  
if (isArtworkBackground){
   [platterView.backgroundView setAlpha: 0];
songBackground = [UIButton new];
[songBackground setContentMode:UIViewContentModeScaleAspectFill];
[songBackground setClipsToBounds:YES];
[songBackground setAdjustsImageWhenHighlighted:NO];
[songBackground setAlpha:musicPlayerAlpha];
[songBackground.layer setCornerRadius:8];
[self addSubview:songBackground];
[self sendSubviewToBack: songBackground];
[songBackground setTranslatesAutoresizingMaskIntoConstraints:YES];
[songBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
}

if (isBackgroundColored){
 [platterView.backgroundView setAlpha: 0];
  coloredBackground = [[UIView alloc]init];
  coloredBackground.hidden = NO;
  [coloredBackground setFrame: CGRectMake(self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height)];
  [coloredBackground.layer setCornerRadius:10];
  [coloredBackground setAlpha:musicPlayerAlpha];
  [coloredBackground setBackgroundColor:[UIColor clearColor]];
  [self addSubview: coloredBackground];
  [self sendSubviewToBack:coloredBackground];
}

}






static void _logos_method$musicplayer$SBMediaController$setNowPlayingInfo$(_LOGOS_SELF_TYPE_NORMAL SBMediaController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) { 
    _logos_orig$musicplayer$SBMediaController$setNowPlayingInfo$(self, _cmd, arg1);
    MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
        if (information) {
			NSDictionary *dict = (__bridge NSDictionary *)information;
			currentArtwork = [UIImage imageWithData:[dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData]]; 
			if (dict) {
				[songTitleLabel setText:[NSString stringWithFormat:@"%@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoTitle]]]; 
				lastArtworkData = [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData];
				[artistNameLabel setText:[NSString stringWithFormat:@"%@ - %@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtist], [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoAlbum]]]; 
				subtitleLabel = [NSString stringWithFormat:@"%@ - %@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtist], [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoAlbum]];
				songLabel = [NSString stringWithFormat:@"%@ ", [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoTitle]];
				[songBackground setImage:currentArtwork forState:UIControlStateNormal];
				[songImageForSmall setImage:currentArtwork forState:UIControlStateNormal]; 
				if (coloredBackground){
				[coloredBackground setBackgroundColor:[libKitten primaryColor:currentArtwork]];
				coloredBackground.layer.borderColor = [[libKitten primaryColor:currentArtwork] CGColor];
				}
				
				
				
			}
			lastArtworkData = [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData];
        }
  	});

	if (haveNotifs) {
			if (![songLabel isEqualToString:previousTitle]){
			[[objc_getClass("JBBulletinManager") sharedInstance] showBulletinWithTitle:subtitleLabel message:songLabel bundleID:[[[_logos_static_class_lookup$SBMediaController() sharedInstance] nowPlayingApplication] bundleIdentifier]];
			}
			previousTitle = songLabel; 
	}

}          





static void (*_logos_orig$statusbar$_UIBatteryView$setFillColor$)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIBatteryView$setFillColor$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$statusbar$_UIBatteryView$setBodyColor$)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIBatteryView$setBodyColor$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, UIColor *); static CGSize (*_logos_meta_orig$statusbar$_UIStatusBarVisualProvider_Split54$notchSize)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static CGSize _logos_meta_method$statusbar$_UIStatusBarVisualProvider_Split54$notchSize(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_meta_orig$statusbar$_UIStatusBarVisualProvider_Split54$height)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double _logos_meta_method$statusbar$_UIStatusBarVisualProvider_Split54$height(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarWifiSignalView* _LOGOS_SELF_CONST, SEL); static void _logos_method$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarWifiSignalView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarCellularSignalView* _LOGOS_SELF_CONST, SEL); static void _logos_method$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarCellularSignalView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarSignalView$setActiveColor$)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIStatusBarSignalView$setActiveColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$statusbar$_UIStatusBarSignalView$setInactiveColor$)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIStatusBarSignalView$setInactiveColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$statusbar$_UIStatusBar$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST, SEL); static void _logos_method$statusbar$_UIStatusBar$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarStringView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL); static void _logos_method$statusbar$_UIStatusBarStringView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$statusbar$_UIStatusBarStringView$setTextColor$)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$statusbar$_UIStatusBarStringView$setTextColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL, UIColor *); 


static void _logos_method$statusbar$_UIBatteryView$setFillColor$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
  UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"batteryFillColor"];
	_logos_orig$statusbar$_UIBatteryView$setFillColor$(self, _cmd, customColor);
	if(isBatteryHidden) self.hidden = YES;
}

static void _logos_method$statusbar$_UIBatteryView$setBodyColor$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"batteryFillColor"];
	_logos_orig$statusbar$_UIBatteryView$setBodyColor$(self, _cmd, customColor);
}


 

static CGSize _logos_meta_method$statusbar$_UIStatusBarVisualProvider_Split54$notchSize(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    CGSize const orig = _logos_meta_orig$statusbar$_UIStatusBarVisualProvider_Split54$notchSize(self, _cmd);
    return CGSizeMake(orig.width, 18);
}
static double _logos_meta_method$statusbar$_UIStatusBarVisualProvider_Split54$height(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return 20;
}



static void _logos_method$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarWifiSignalView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow(self, _cmd);
	if (isWifiThingyHidden){
	self.hidden = YES;
	}
}


static void _logos_method$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarCellularSignalView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout(self, _cmd);
	if (isCellularThingyHidden){
	self.hidden = YES;
	}

}



static void _logos_method$statusbar$_UIStatusBarSignalView$setActiveColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
	UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"cellularColor"];
	_logos_orig$statusbar$_UIStatusBarSignalView$setActiveColor$(self, _cmd, customColor);
}

static void _logos_method$statusbar$_UIStatusBarSignalView$setInactiveColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarSignalView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
	UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"cellularColor"];
	_logos_orig$statusbar$_UIStatusBarSignalView$setInactiveColor$(self, _cmd, customColor);
}





static void _logos_method$statusbar$_UIStatusBar$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	
	if (modernStatusBar){
	self.visualProviderClass =  @"_UIStatusBarVisualProvider_Split54";
	}
	else _logos_orig$statusbar$_UIStatusBar$setNeedsLayout(self, _cmd);
}






static void _logos_method$statusbar$_UIStatusBarStringView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$statusbar$_UIStatusBarStringView$didMoveToWindow(self, _cmd);
	if (isTimeHidden){
	self.hidden = YES;
	}
}
static void _logos_method$statusbar$_UIStatusBarStringView$setTextColor$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
				UIColor *customColor = [GcColorPickerUtils colorFromDefaults:@"aquariusprefs" withKey:@"timeColor"];
	_logos_orig$statusbar$_UIStatusBarStringView$setTextColor$(self, _cmd, customColor);
}




static void (*_logos_orig$notifications$NCNotificationListCell$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL NCNotificationListCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$notifications$NCNotificationListCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationListCell* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$notifications$NCNotificationContentView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL NCNotificationContentView* _LOGOS_SELF_CONST, SEL); static void _logos_method$notifications$NCNotificationContentView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationContentView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$notifications$PLPlatterHeaderContentView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL PLPlatterHeaderContentView* _LOGOS_SELF_CONST, SEL); static void _logos_method$notifications$PLPlatterHeaderContentView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL PLPlatterHeaderContentView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$notifications$NCNotificationShortLookView$setNeedsLayout)(_LOGOS_SELF_TYPE_NORMAL NCNotificationShortLookView* _LOGOS_SELF_CONST, SEL); static void _logos_method$notifications$NCNotificationShortLookView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationShortLookView* _LOGOS_SELF_CONST, SEL); 

static void _logos_method$notifications$NCNotificationListCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationListCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$notifications$NCNotificationListCell$layoutSubviews(self, _cmd);
	if (isNotificationSectionEnabled){
	self.backgroundColor = [UIColor clearColor];
	}

}




static void _logos_method$notifications$NCNotificationContentView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationContentView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	_logos_orig$notifications$NCNotificationContentView$setNeedsLayout(self, _cmd);
	if (hideSnapImage){
	UIImageView *replacementSnapImage = (UIImageView*)MSHookIvar<UIImageView*>(self, "_thumbnailImageView");
	replacementSnapImage.hidden = YES;
	}
}






static void _logos_method$notifications$PLPlatterHeaderContentView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL PLPlatterHeaderContentView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$notifications$PLPlatterHeaderContentView$setNeedsLayout(self, _cmd);
	iconImage = [self.icons objectAtIndex:0];
}





static void _logos_method$notifications$NCNotificationShortLookView$setNeedsLayout(_LOGOS_SELF_TYPE_NORMAL NCNotificationShortLookView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$notifications$NCNotificationShortLookView$setNeedsLayout(self, _cmd); 
	self.backgroundColor = [libKitten primaryColor:iconImage];
	self.layer.cornerRadius = 15;
	yesmf = [self.subviews objectAtIndex:0];
	yesmf.hidden = YES;
}




void reloadPrefs() { 
	musicPlayerEnabled = [file boolForKey:@"isMusicSectionEnabled"];
	statusBarSectionEnabled = [file boolForKey:@"isStausBarSectionEnabled"];
	hideSnapImage = [file boolForKey:@"hideSnapImage"];
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
	outlineSize = [file doubleForKey:@"sizeOfOutline?"];
	haveOutline = [file boolForKey:@"haveOutline?"];
	haveOutlineSecondaryColorMusicPlayer = [file boolForKey:@"haveOutlineSecondaryColorMusicPlayer"];
}

static __attribute__((constructor)) void _logosLocalCtor_71141b66(int __unused argc, char __unused **argv, char __unused **envp) {
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
	[file registerDouble:&outlineSize default:5 forKey:@"sizeOfOutline?"];
	[file registerBool:&haveOutlineSecondaryColorMusicPlayer default:NO forKey:@"haveOutlineSecondaryColorMusicPlayer"];
			

 	if (isNotificationSectionEnabled) {
	 	{Class _logos_class$notifications$NCNotificationListCell = objc_getClass("NCNotificationListCell"); { MSHookMessageEx(_logos_class$notifications$NCNotificationListCell, @selector(layoutSubviews), (IMP)&_logos_method$notifications$NCNotificationListCell$layoutSubviews, (IMP*)&_logos_orig$notifications$NCNotificationListCell$layoutSubviews);}Class _logos_class$notifications$NCNotificationContentView = objc_getClass("NCNotificationContentView"); { MSHookMessageEx(_logos_class$notifications$NCNotificationContentView, @selector(setNeedsLayout), (IMP)&_logos_method$notifications$NCNotificationContentView$setNeedsLayout, (IMP*)&_logos_orig$notifications$NCNotificationContentView$setNeedsLayout);}Class _logos_class$notifications$PLPlatterHeaderContentView = objc_getClass("PLPlatterHeaderContentView"); { MSHookMessageEx(_logos_class$notifications$PLPlatterHeaderContentView, @selector(setNeedsLayout), (IMP)&_logos_method$notifications$PLPlatterHeaderContentView$setNeedsLayout, (IMP*)&_logos_orig$notifications$PLPlatterHeaderContentView$setNeedsLayout);}Class _logos_class$notifications$NCNotificationShortLookView = objc_getClass("NCNotificationShortLookView"); { MSHookMessageEx(_logos_class$notifications$NCNotificationShortLookView, @selector(setNeedsLayout), (IMP)&_logos_method$notifications$NCNotificationShortLookView$setNeedsLayout, (IMP*)&_logos_orig$notifications$NCNotificationShortLookView$setNeedsLayout);}}
 	}
	if (musicPlayerEnabled) {
        {Class _logos_class$musicplayer$MRUNowPlayingHeaderView = objc_getClass("MRUNowPlayingHeaderView"); { MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingHeaderView, @selector(setShowRoutingButton:), (IMP)&_logos_method$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingHeaderView$setShowRoutingButton$);}Class _logos_class$musicplayer$MRUNowPlayingControlsView = objc_getClass("MRUNowPlayingControlsView"); { MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingControlsView, @selector(setNeedsLayout), (IMP)&_logos_method$musicplayer$MRUNowPlayingControlsView$setNeedsLayout, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingControlsView$setNeedsLayout);}Class _logos_class$musicplayer$MRUNowPlayingLabelView = objc_getClass("MRUNowPlayingLabelView"); { MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingLabelView, @selector(setFrame:), (IMP)&_logos_method$musicplayer$MRUNowPlayingLabelView$setFrame$, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingLabelView$setFrame$);}Class _logos_class$musicplayer$MRUNowPlayingTransportControlsView = objc_getClass("MRUNowPlayingTransportControlsView"); { MSHookMessageEx(_logos_class$musicplayer$MRUNowPlayingTransportControlsView, @selector(setNeedsLayout), (IMP)&_logos_method$musicplayer$MRUNowPlayingTransportControlsView$setNeedsLayout, (IMP*)&_logos_orig$musicplayer$MRUNowPlayingTransportControlsView$setNeedsLayout);}Class _logos_class$musicplayer$CSAdjunctItemView = objc_getClass("CSAdjunctItemView"); { MSHookMessageEx(_logos_class$musicplayer$CSAdjunctItemView, @selector(_updateSizeToMimic), (IMP)&_logos_method$musicplayer$CSAdjunctItemView$_updateSizeToMimic, (IMP*)&_logos_orig$musicplayer$CSAdjunctItemView$_updateSizeToMimic);}Class _logos_class$musicplayer$SBMediaController = objc_getClass("SBMediaController"); { MSHookMessageEx(_logos_class$musicplayer$SBMediaController, @selector(setNowPlayingInfo:), (IMP)&_logos_method$musicplayer$SBMediaController$setNowPlayingInfo$, (IMP*)&_logos_orig$musicplayer$SBMediaController$setNowPlayingInfo$);}}
	}
	if (statusBarSectionEnabled){



		{Class _logos_class$statusbar$_UIBatteryView = objc_getClass("_UIBatteryView"); { MSHookMessageEx(_logos_class$statusbar$_UIBatteryView, @selector(setFillColor:), (IMP)&_logos_method$statusbar$_UIBatteryView$setFillColor$, (IMP*)&_logos_orig$statusbar$_UIBatteryView$setFillColor$);}{ MSHookMessageEx(_logos_class$statusbar$_UIBatteryView, @selector(setBodyColor:), (IMP)&_logos_method$statusbar$_UIBatteryView$setBodyColor$, (IMP*)&_logos_orig$statusbar$_UIBatteryView$setBodyColor$);}Class _logos_class$statusbar$_UIStatusBarVisualProvider_Split54 = objc_getClass("_UIStatusBarVisualProvider_Split54"); Class _logos_metaclass$statusbar$_UIStatusBarVisualProvider_Split54 = object_getClass(_logos_class$statusbar$_UIStatusBarVisualProvider_Split54); { MSHookMessageEx(_logos_metaclass$statusbar$_UIStatusBarVisualProvider_Split54, @selector(notchSize), (IMP)&_logos_meta_method$statusbar$_UIStatusBarVisualProvider_Split54$notchSize, (IMP*)&_logos_meta_orig$statusbar$_UIStatusBarVisualProvider_Split54$notchSize);}{ MSHookMessageEx(_logos_metaclass$statusbar$_UIStatusBarVisualProvider_Split54, @selector(height), (IMP)&_logos_meta_method$statusbar$_UIStatusBarVisualProvider_Split54$height, (IMP*)&_logos_meta_orig$statusbar$_UIStatusBarVisualProvider_Split54$height);}Class _logos_class$statusbar$_UIStatusBarWifiSignalView = objc_getClass("_UIStatusBarWifiSignalView"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBarWifiSignalView, @selector(didMoveToWindow), (IMP)&_logos_method$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow, (IMP*)&_logos_orig$statusbar$_UIStatusBarWifiSignalView$didMoveToWindow);}Class _logos_class$statusbar$_UIStatusBarCellularSignalView = objc_getClass("_UIStatusBarCellularSignalView"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBarCellularSignalView, @selector(setNeedsLayout), (IMP)&_logos_method$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout, (IMP*)&_logos_orig$statusbar$_UIStatusBarCellularSignalView$setNeedsLayout);}Class _logos_class$statusbar$_UIStatusBarSignalView = objc_getClass("_UIStatusBarSignalView"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBarSignalView, @selector(setActiveColor:), (IMP)&_logos_method$statusbar$_UIStatusBarSignalView$setActiveColor$, (IMP*)&_logos_orig$statusbar$_UIStatusBarSignalView$setActiveColor$);}{ MSHookMessageEx(_logos_class$statusbar$_UIStatusBarSignalView, @selector(setInactiveColor:), (IMP)&_logos_method$statusbar$_UIStatusBarSignalView$setInactiveColor$, (IMP*)&_logos_orig$statusbar$_UIStatusBarSignalView$setInactiveColor$);}Class _logos_class$statusbar$_UIStatusBar = objc_getClass("_UIStatusBar"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBar, @selector(setNeedsLayout), (IMP)&_logos_method$statusbar$_UIStatusBar$setNeedsLayout, (IMP*)&_logos_orig$statusbar$_UIStatusBar$setNeedsLayout);}Class _logos_class$statusbar$_UIStatusBarStringView = objc_getClass("_UIStatusBarStringView"); { MSHookMessageEx(_logos_class$statusbar$_UIStatusBarStringView, @selector(didMoveToWindow), (IMP)&_logos_method$statusbar$_UIStatusBarStringView$didMoveToWindow, (IMP*)&_logos_orig$statusbar$_UIStatusBarStringView$didMoveToWindow);}{ MSHookMessageEx(_logos_class$statusbar$_UIStatusBarStringView, @selector(setTextColor:), (IMP)&_logos_method$statusbar$_UIStatusBarStringView$setTextColor$, (IMP*)&_logos_orig$statusbar$_UIStatusBarStringView$setTextColor$);}} }  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.nico671.preferenceschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}
