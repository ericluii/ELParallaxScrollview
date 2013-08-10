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
    [_psv setContentSize:CGSizeMake([[UIScreen mainScreen] applicationFrame].size.width, 1600)];
    [_psv setBackgroundColor:[UIColor colorWithRed:220/255.0f green:209/255.0f blue:189/255.0f alpha:1]];
    [self setupDemoViews];
    
    [self.view addSubview:_psv];
}

- (void)setupDemoViews {
    [self setupTitles];
    [self setupTriforce];
    [self setupCreate];
    [self setupGit];
}

- (void)setupTitles {
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320.0f, 100.0f)];
    [title setText:@"Parallax Scrolling"];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setTextColor:[UIColor grayColor]];
    [title setFont:[UIFont fontWithName:@"KGLoveSomebody" size:30.0f]];
    [_psv addSubview:title withEndPoint:CGPointMake(0, 250.0f) andAnimationStartPoint:CGPointMake(0, 0) andAnimationEndPoint:CGPointMake(0, 100.0f)];
    
    UILabel * name = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320.0f, 700.0f)];
    [name setText:@"By: Eric Lui"];
    [name setTextAlignment:NSTextAlignmentCenter];
    [name setBackgroundColor:[UIColor clearColor]];
    [name setTextColor:[UIColor grayColor]];
    [name setFont:[UIFont fontWithName:@"KGLoveSomebody" size:15.0f]];
    [_psv addSubview:name withEndPoint:CGPointMake(0, -10.0f) andAnimationStartPoint:CGPointMake(0, 0) andAnimationEndPoint:CGPointMake(0, 80.0f)];
}

- (void)setupTriforce {
    UILabel * scroll = [[UILabel alloc] initWithFrame:CGRectMake(0, 160.0f, 130.0f, 50.0f)];
    [scroll setText:@"scroll "];
    [scroll setTextAlignment:NSTextAlignmentRight];
    [scroll setBackgroundColor:[UIColor clearColor]];
    [scroll setTextColor:[UIColor grayColor]];
    [scroll setFont:[UIFont fontWithName:@"KGLoveSomebody" size:25.0f]];
    [_psv addSubview:scroll withEndPoint:CGPointMake(-130.0f, 600.0f) andAnimationStartPoint:CGPointMake(0, 0) andAnimationEndPoint:CGPointMake(0, 140.f)];
    
    UILabel * up = [[UILabel alloc] initWithFrame:CGRectMake(190.0f, 160.0f, 130.0f, 50.0f)];
    [up setText:@" up"];
    [up setTextAlignment:NSTextAlignmentLeft];
    [up setBackgroundColor:[UIColor clearColor]];
    [up setTextColor:[UIColor grayColor]];
    [up setFont:[UIFont fontWithName:@"KGLoveSomebody" size:25.0f]];
    [_psv addSubview:up withEndPoint:CGPointMake(450.0f, 100.0f) andAnimationStartPoint:CGPointMake(0, 0) andAnimationEndPoint:CGPointMake(0, 140.f)];
    
    UIImageView * top = [[UIImageView alloc] initWithFrame:CGRectMake(130.0f, 160.0f, 60.0f, 60.0f)];
    [top setImage:[UIImage imageNamed:@"triforce"]];
    [top setContentMode:UIViewContentModeScaleAspectFit];
    [_psv addSubview:top withEndPoint:CGPointMake(130.0f, 400.0f) andAnimationStartPoint:CGPointMake(0, 0) andAnimationEndPoint:CGPointMake(0, 120.0f)];
    
    UIImageView * left = [[UIImageView alloc] initWithFrame:CGRectMake(-60.0f, 800.0f, 60.0f, 60.0f)];
    [left setImage:[UIImage imageNamed:@"triforce"]];
    [left setContentMode:UIViewContentModeScaleAspectFit];
    [_psv addSubview:left withEndPoint:CGPointMake(101.0f, 450.0f) andAnimationStartPoint:CGPointMake(0, 40.0f) andAnimationEndPoint:CGPointMake(0, 120.0f)];
    
    UIImageView * right = [[UIImageView alloc] initWithFrame:CGRectMake(380.0f, 800.0f, 60.0f, 60.0f)];
    [right setImage:[UIImage imageNamed:@"triforce"]];
    [right setContentMode:UIViewContentModeScaleAspectFit];
    [_psv addSubview:right withEndPoint:CGPointMake(159.0f, 450.0f) andAnimationStartPoint:CGPointMake(0, 40.0f) andAnimationEndPoint:CGPointMake(0, 140.0f)];
}

- (void)setupCreate {
    UIImageView * bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 900.0f, 320.0f, 800.0f)];
    [bg setImage:[UIImage imageNamed:@"sky"]];
    [bg setContentMode:UIViewContentModeScaleAspectFit];
    [_psv addSubview:bg withEndPoint:CGPointMake(0, 525.0f) andAnimationStartPoint:CGPointMake(0, 100.0f) andAnimationEndPoint:CGPointMake(0, 250.0f)];
    
    UILabel * easy = [[UILabel alloc] initWithFrame:CGRectMake(0, 700.0f, 320.0f, 500.0f)];
    [easy setText:@"Easily Create Multilayer Parallax with Minimal Effort"];
    [easy setTextAlignment:NSTextAlignmentCenter];
    [easy setBackgroundColor:[UIColor clearColor]];
    [easy setTextColor:[UIColor whiteColor]];
    [easy setNumberOfLines:0];
    [easy setFont:[UIFont fontWithName:@"KGLoveSomebody" size:30.0f]];
    [_psv addSubview:easy withEndPoint:CGPointMake(0, 450.0f) andAnimationStartPoint:CGPointMake(0, 150.0f) andAnimationEndPoint:CGPointMake(0, 600.0f)];
    
    UILabel * more = [[UILabel alloc] initWithFrame:CGRectMake(0, 900.0f, 320.0f, 500.0f)];
    [more setText:@"It is as easy as adding a subview, and will be even easier when more features are added!"];
    [more setTextAlignment:NSTextAlignmentCenter];
    [more setBackgroundColor:[UIColor clearColor]];
    [more setTextColor:[UIColor whiteColor]];
    [more setNumberOfLines:0];
    [more setFont:[UIFont fontWithName:@"KGLoveSomebody" size:25.0f]];
    [_psv addSubview:more withEndPoint:CGPointMake(0, 600.0f) andAnimationStartPoint:CGPointMake(0, 150.0f) andAnimationEndPoint:CGPointMake(0, 700.0f)];
    
    UILabel * wow = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 1200.0f, 320.0f, 500.0f)];
    [wow setText:@"Opacity, multiaxis, and callbacks coming soon :)"];
    [wow setTextAlignment:NSTextAlignmentCenter];
    [wow setBackgroundColor:[UIColor clearColor]];
    [wow setTextColor:[UIColor whiteColor]];
    [wow setNumberOfLines:0];
    [wow setFont:[UIFont fontWithName:@"KGLoveSomebody" size:25.0f]];
    [_psv addSubview:wow withEndPoint:CGPointMake(0, 850.0f) andAnimationStartPoint:CGPointMake(0, 300.0f) andAnimationEndPoint:CGPointMake(0, 1100.0f)];
    
    UIImageView * mountain = [[UIImageView alloc] initWithFrame:CGRectMake(0, 600.0f, 320.0f, 400.0f)];
    [mountain setImage:[UIImage imageNamed:@"mountain"]];
    [mountain setContentMode:UIViewContentModeScaleAspectFit];
    [_psv addSubview:mountain withEndPoint:CGPointMake(0, 1175.0f) andAnimationStartPoint:CGPointMake(0, 400.0f) andAnimationEndPoint:CGPointMake(0, 1050.0f)];
}

-(void)setupGit {
    UILabel * git = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 100.0f)];
    [git setText:@"Follow the project on git and help out!\nhttps://github.com/ericluii/ELParallaxScrollview/"];
    [git setTextAlignment:NSTextAlignmentCenter];
    [git setBackgroundColor:[UIColor clearColor]];
    [git setTextColor:[UIColor whiteColor]];
    [git setNumberOfLines:0];
    [git setFont:[UIFont fontWithName:@"KGLoveSomebody" size:12.0f]];
    
    UIView * bg = [[UIView alloc] initWithFrame:CGRectMake(0, 2000.0f, 320.0f, 100.0f)];
    [bg addSubview:git];
    [bg setBackgroundColor:[UIColor brownColor]];
    [_psv addSubview:bg withEndPoint:CGPointMake(0, 1500.0f) andAnimationStartPoint:CGPointMake(0.0f, 700.0f) andAnimationEndPoint:CGPointMake(0, 1000.0f)];
}

@end
