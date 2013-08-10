//
//  ELViewController.m
//  ELParallaxScrollviewDemo
//
//  Created by Eric Lui on 2013-08-09.
//  Copyright (c) 2013 Eric Lui. All rights reserved.
//

#import "ELViewController.h"
#import "ELParallaxScrollview.h"

@interface ELViewController ()

@property (nonatomic, strong) ELParallaxScrollview * psv;

@end

@implementation ELViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _psv = [[ELParallaxScrollview alloc] initWithFrame:CGRectOffset([[UIScreen mainScreen] applicationFrame], 0, -20)];
    [_psv setContentSize:CGSizeMake([[UIScreen mainScreen] applicationFrame].size.width, 2000)];
    
    [self setupDemoViews];
    
    [self.view addSubview:_psv];
}

- (void)setupDemoViews {
    UIView *box = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    [box setBackgroundColor:[UIColor greenColor]];
    [_psv addSubview:box withEndPoint:CGPointMake(0, 500) andAnimationStartPoint:CGPointMake(0, 0) andAnimationEndPoint:CGPointMake(0, 200)];
}

@end
