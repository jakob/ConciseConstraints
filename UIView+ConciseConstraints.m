//
//  UIView+ConciseConstraints.m
//
//  Created by Jakob Egger on 12/12/13.
//

#import "UIView+ConciseConstraints.h"
#import <objc/runtime.h>

@implementation UIView (ConciseConstraints)

-(id)initAutoLayout {
	self = [self initWithFrame:CGRectMake(0, 0, 10, 10)];
	
	self.translatesAutoresizingMaskIntoConstraints = NO;
	
	return self;
}

-(void)CC_addConstraintFormat:(NSString*)formatString, ... {
	const char *fmt = [formatString UTF8String];
	NSMutableString *constraintString = [[NSMutableString alloc] init];
	va_list args;
	va_start(args, formatString);
	NSMutableDictionary *views = [[NSMutableDictionary alloc] init];
	while (*fmt) {
		if  (*fmt=='%') {
			fmt++;
			switch(*fmt) {
				case '%':
					[constraintString appendString:@"%"];
					break;
				case 'f':
					[constraintString appendFormat:@"%f", va_arg(args, double)];
					break;
				case 'v':
				{
					UIView *view = va_arg(args, UIView*);
					NSString *className = [NSString stringWithUTF8String:class_getName([view class])];
					NSString *viewName = className;
					int i=1;
					while (views[viewName]) {
						i++;
						viewName = [NSString stringWithFormat:@"%@%d", className, i];
					}
					views[viewName] = view;
					[constraintString appendString:viewName];
				}
					break;
				default:
					[NSException raise:@"InvalidFormatException" format:@"ConciseConstraints only supports %%v (for views) and %%f (float/double)."];
			}
		} else {
			[constraintString appendFormat:@"%c", *fmt];
		}
		fmt++;
	}
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintString options:0 metrics:nil views:views]];
}

-(void)CC_addConstraintOptions:(NSLayoutFormatOptions)options format:(NSString*)formatString, ... {
	const char *fmt = [formatString UTF8String];
	NSMutableString *constraintString = [[NSMutableString alloc] init];
	va_list args;
	va_start(args, formatString);
	NSMutableDictionary *views = [[NSMutableDictionary alloc] init];
	while (*fmt) {
		if  (*fmt=='%') {
			fmt++;
			switch(*fmt) {
				case '%':
					[constraintString appendString:@"%"];
					break;
				case 'f':
					[constraintString appendFormat:@"%f", va_arg(args, double)];
					break;
				case 'v':
				{
					UIView *view = va_arg(args, UIView*);
					NSString *className = [NSString stringWithUTF8String:class_getName([view class])];
					NSString *viewName = className;
					int i=1;
					while (views[viewName]) {
						i++;
						viewName = [NSString stringWithFormat:@"%@%d", className, i];
					}
					views[viewName] = view;
					[constraintString appendString:viewName];
				}
					break;
				default:
					[NSException raise:@"InvalidFormatException" format:@"ConciseConstraints only supports %%v (for views) and %%f (float/double)."];
			}
		} else {
			[constraintString appendFormat:@"%c", *fmt];
		}
		fmt++;
	}
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintString options:options metrics:nil views:views]];
}

@end
