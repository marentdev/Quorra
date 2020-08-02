#import "TheGrid.h"

#define kWidth [UIScreen mainScreen].bounds.size.width 
#define kHeight [UIScreen mainScreen].bounds.size.height
#define noNotch (kHeight < 812)

@implementation TheGrid

- (TheGrid *)init {
	self = [super init];
	
	if (self) {
		if([NSThread isMainThread]){
			self.backgroundColor = nil;
			self.windowLevel = 2020;
			[self setHidden:NO];
			self.userInteractionEnabled = NO;

			UIView *greenDot = [[UIView alloc] initWithFrame:CGRectMake(kWidth - 10 - 85,8,5,5)];
			if(noNotch) {	greenDot.frame = CGRectMake(greenDot.frame.origin.x,17,greenDot.frame.size.width,greenDot.frame.size.height); }
			greenDot.backgroundColor = [UIColor greenColor];
			greenDot.userInteractionEnabled = NO;
			greenDot.layer.cornerRadius = greenDot.frame.size.height/2;
			[greenDot setHidden:YES];

			[self addSubview:greenDot];
			self.greenDot = greenDot;


			UIView *yellowDot = [[UIView alloc] initWithFrame:CGRectMake(kWidth - 85,8,5,5)];
			if(noNotch) {	yellowDot.frame = CGRectMake(yellowDot.frame.origin.x,17,yellowDot.frame.size.width,yellowDot.frame.size.height); }
			yellowDot.backgroundColor = [UIColor yellowColor];
			yellowDot.userInteractionEnabled = NO;
			yellowDot.layer.cornerRadius = yellowDot.frame.size.height/2;
			[yellowDot setHidden:YES];

			[self addSubview:yellowDot];
			self.yellowDot = yellowDot;


			UIView *redDot = [[UIView alloc] initWithFrame:CGRectMake(kWidth - 85 + 10,8,5,5)];
			if(noNotch) {	redDot.frame = CGRectMake(redDot.frame.origin.x,17,redDot.frame.size.width,redDot.frame.size.height); }
			redDot.backgroundColor = [UIColor redColor];
			redDot.userInteractionEnabled = NO;
			redDot.layer.cornerRadius = redDot.frame.size.height/2;
			[redDot setHidden:YES];

			[self addSubview:redDot];
			self.redDot = redDot;


			//Prevents camera from flickering when device is locked (http://iphonedevwiki.net/index.php/Updating_extensions_for_iOS_8)
			if ([self respondsToSelector:@selector(_setSecure:)]){ [self _setSecure:YES]; }
		}
		else{
			dispatch_sync(dispatch_get_main_queue(), ^{
				self.backgroundColor = nil;
				self.windowLevel = 2020;
				[self setHidden:NO];
				self.userInteractionEnabled = NO;

				UIView *greenDot = [[UIView alloc] initWithFrame:CGRectMake((kWidth/2)-10,34,5,5)];
				if(noNotch) {	greenDot.frame = CGRectMake(greenDot.frame.origin.x,17,greenDot.frame.size.width,greenDot.frame.size.height); }
				greenDot.backgroundColor = [UIColor greenColor];
				greenDot.userInteractionEnabled = NO;
				greenDot.layer.cornerRadius = greenDot.frame.size.height/2;
				[greenDot setHidden:YES];

				[self addSubview:greenDot];
				self.greenDot = greenDot;


				UIView *yellowDot = [[UIView alloc] initWithFrame:CGRectMake((kWidth/2),34,5,5)];
				if(noNotch) {	yellowDot.frame = CGRectMake(yellowDot.frame.origin.x,17,yellowDot.frame.size.width,yellowDot.frame.size.height); }
				yellowDot.backgroundColor = [UIColor yellowColor];
				yellowDot.userInteractionEnabled = NO;
				yellowDot.layer.cornerRadius = yellowDot.frame.size.height/2;
				[yellowDot setHidden:YES];

				[self addSubview:yellowDot];
				self.yellowDot = yellowDot;


				UIView *redDot = [[UIView alloc] initWithFrame:CGRectMake((kWidth/2)+10,34,5,5)];
				if(noNotch) {	redDot.frame = CGRectMake(redDot.frame.origin.x,17,redDot.frame.size.width,redDot.frame.size.height); }
				redDot.backgroundColor = [UIColor redColor];
				redDot.userInteractionEnabled = NO;
				redDot.layer.cornerRadius = redDot.frame.size.height/2;
				[redDot setHidden:YES];

				[self addSubview:redDot];
				self.redDot = redDot;


				//Prevents camera from flickering when device is locked (http://iphonedevwiki.net/index.php/Updating_extensions_for_iOS_8)
				if ([self respondsToSelector:@selector(_setSecure:)]){ [self _setSecure:YES]; }
			});
		}
	}
	
	return self;
}

@end