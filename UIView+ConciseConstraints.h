//
//  UIView+ConciseConstraints.h
//
//  Created by Jakob Egger on 12/12/13.
//

#import <UIKit/UIKit.h>

@interface UIView (ConciseConstraints)

-(id)initAutoLayout;

-(void)CC_addConstraintFormat:(NSString*)formatString, ...;
-(void)CC_addConstraintOptions:(NSLayoutFormatOptions)options format:(NSString*)formatString, ...;


@end
