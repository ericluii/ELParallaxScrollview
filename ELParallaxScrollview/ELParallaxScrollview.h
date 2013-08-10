//
//  ELParallaxScrollview.h
//  ELParallaxScrollviewDemo
//
//  Created by Eric Lui on 2013-08-10.
//  Copyright (c) 2013 Eric Lui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELParallaxScrollview : UIView <UIScrollViewDelegate>

@property (nonatomic, readonly) bool isVertical;

-(id)initWithFrame:(CGRect)frame andIsVertical:(bool)isVertical;

-(void)setContentSize:(CGSize)size;

-(void)addSubview:(UIView *)view withEndPoint:(CGPoint)endPoint;
-(void)addSubview:(UIView *)view withEndPoint:(CGPoint)endPoint
                        andAnimationStart:(CGFloat)animationStartPoint
                          andAnimationEnd:(CGFloat)animationEndPoint;

@end
