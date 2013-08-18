//
//  ELParallaxScrollview.h
//  ELParallaxScrollviewDemo
//
//  Created by Eric Lui on 2013-08-10.
//  Copyright (c) 2013 Eric Lui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ELParallaxScrollviewDelegate <NSObject>

@optional
-(void)scrollViewDidStopDraggingWithHeaderVisible:(CGFloat)visibleHeight;
-(void)scrollViewDidStopDraggingWithFooterVisible:(CGFloat)visibleHeight;

@end

@interface ELParallaxScrollview : UIView <UIScrollViewDelegate>

@property (nonatomic, readonly) bool isVertical;
@property (nonatomic, strong) id<ELParallaxScrollviewDelegate> delegate;

-(id)initWithFrame:(CGRect)frame andIsVertical:(bool)isVertical;

-(void)setContentSize:(CGSize)size;
-(void)setHeaderView:(UIView *)view;
-(void)setFooterView:(UIView *)view;

-(void)addSubview:(UIView *)view withEndPoint:(CGPoint)endPoint;
-(void)addSubview:(UIView *)view withEndPoint:(CGPoint)endPoint
                        andAnimationStart:(CGFloat)animationStartPoint
                          andAnimationEnd:(CGFloat)animationEndPoint;

@end
