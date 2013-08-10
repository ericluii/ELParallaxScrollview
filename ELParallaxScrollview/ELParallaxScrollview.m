//
//  ELParallaxScrollview.m
//  ELParallaxScrollviewDemo
//
//  Created by Eric Lui on 2013-08-10.
//  Copyright (c) 2013 Eric Lui. All rights reserved.
//

#import "ELParallaxScrollview.h"

@interface ParallaxView : NSObject

@property (nonatomic, strong) UIView * view;
@property (nonatomic, assign) CGPoint animationStartPoint;
@property (nonatomic, assign) CGPoint animationEndPoint;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, readonly) CGPoint translationSpeed;

-(id)initWithView:(UIView *)view andEndPoint:(CGPoint)endPoint
                        andAnimationStartPoint:(CGPoint)animationStartPoint
                          andAnimationEndPoint:(CGPoint)animationEndPoint;

@end

@implementation ParallaxView

-(id)initWithView:(UIView *)view andEndPoint:(CGPoint)endPoint
                        andAnimationStartPoint:(CGPoint)animationStartPoint
                          andAnimationEndPoint:(CGPoint)animationEndPoint {
    self = [super init];
    
    if (self) {
        _view = view;
        
        _animationStartPoint = animationStartPoint;
        _animationEndPoint = animationEndPoint;
        
        _startPoint = view.frame.origin;
        _endPoint = endPoint;
        
        [self updateTranslationSpeed];
    }
    
    return self;
}

-(void)updateTranslationSpeed {
    CGPoint distanceToTravel = CGPointMake(_endPoint.x - _startPoint.x, _endPoint.y - _startPoint.y);
    CGPoint timeForTravel = CGPointMake(_animationEndPoint.x - _animationStartPoint.x, _animationEndPoint.y - _animationStartPoint.y);
    
    _translationSpeed = CGPointMake(distanceToTravel.x/timeForTravel.y, distanceToTravel.y/timeForTravel.y);
    
    if (isnan(_translationSpeed.x)) {_translationSpeed.x = 0;}
    if (isnan(_translationSpeed.y)) {_translationSpeed.y = 0;}
}

@end

@interface ELParallaxScrollview ()

@property (nonatomic, strong) UIScrollView * mainScrollview;
@property (nonatomic, strong) NSMutableArray * parallaxViewsArray;

@end

@implementation ELParallaxScrollview

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _parallaxViewsArray = [NSMutableArray array];
        
        _mainScrollview = [[UIScrollView alloc] initWithFrame:frame];
        [_mainScrollview setDelegate:self];
        
        [super addSubview:_mainScrollview];
    }
    return self;
}

-(void)setContentSize:(CGSize)size {
    [_mainScrollview setContentSize:size];
}

-(void)addSubview:(UIView *)view {
    [_mainScrollview addSubview:view];
}

-(void)addSubview:(UIView *)view withEndPoint:(CGPoint)endPoint {
    [self addSubview:view withEndPoint:endPoint
                andAnimationStartPoint:view.frame.origin
                  andAnimationEndPoint:endPoint];
}

-(void)addSubview:(UIView *)view withEndPoint:(CGPoint)endPoint
                       andAnimationStartPoint:(CGPoint)animationStartPoint
                         andAnimationEndPoint:(CGPoint)animationEndPoint {
    ParallaxView *pView = [[ParallaxView alloc] initWithView:view
                                                 andEndPoint:endPoint
                                      andAnimationStartPoint:animationStartPoint
                                        andAnimationEndPoint:animationEndPoint];
    [_parallaxViewsArray addObject:pView];
    [_mainScrollview addSubview:pView.view];
}

#pragma mark - UIScrollviewDelegate Methods

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint contentOffset = scrollView.contentOffset;
    
    for (ParallaxView * pView in _parallaxViewsArray) {
        if (pView.animationStartPoint.y <= contentOffset.y && pView.animationEndPoint.y >= contentOffset.y) {
            CGRect frame = pView.view.frame;
            frame.origin.y = ((contentOffset.y - pView.animationStartPoint.y) * pView.translationSpeed.y) + pView.startPoint.y;
            frame.origin.x = ((contentOffset.y - pView.animationStartPoint.y) * pView.translationSpeed.x) + pView.startPoint.x;
            [pView.view setFrame:frame];
        } else if (pView.animationStartPoint.y >= contentOffset.y) {
            CGRect frame = pView.view.frame;
            frame.origin = pView.startPoint;
            [pView.view setFrame:frame];
        } else {
            CGRect frame = pView.view.frame;
            frame.origin = pView.endPoint;
            [pView.view setFrame:frame];
        }
    }
}

@end
