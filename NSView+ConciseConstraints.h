//
//  NSView+ConciseConstraints.h
//
//  Created by Jakob Egger on 12/12/13.
//

#import <Cocoa/Cocoa.h>

@interface NSView (ConciseConstraints)

-(void)CC_addConstraintFormat:(NSString*)formatString, ...;
-(void)CC_addConstraintOptions:(NSLayoutFormatOptions)options format:(NSString*)formatString, ...;


@end
