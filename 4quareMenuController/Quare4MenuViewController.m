//
//  4quareMenuViewController.m
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import "Quare4MenuViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface Quare4MenuViewController ()

@property (nonatomic,strong) UIView *topLeftView;
@property (nonatomic,strong) UIView *topRightView;
@property (nonatomic,strong) UIView *bottomLeftView;
@property (nonatomic,strong) UIView *bottomRightView;

@property (nonatomic) CGRect topLeftRect;
@property (nonatomic) CGRect topRightRect;
@property (nonatomic) CGRect bottomLeftRect;
@property (nonatomic) CGRect bottomRightRect;

//- (void)btnClick:(id) sender;

@end

@implementation Quare4MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithTopLeft:(UIViewController *)tl TopRight:(UIViewController *)tr bottomLeft:(UIViewController *)bl bottomRight:(UIViewController *)br
{
    self.topLeftController = tl;
    self.topRightController =tr;
    self.bottomLeftController = bl;
    self.bottomRightController = br;
    
    self->rotation = 0;
    
    return self;
}

- (void)btnClickClick:(id) sender
{
    
    NSLog(@"btnClick");
    [self rotation:(self->rotation == 0.0f ? -45:0) withAnimation:YES];
    
}

- (void)rotation:(CGFloat) degrees withAnimation:(BOOL) animation
{
    
    CGFloat r = DEGREES_TO_RADIANS(degrees);
    if ( animation ){
        [UIView animateWithDuration:0.3f
                         animations:^{
                             [self rotation:r];
                         }
                         completion:^(BOOL finished) {
                             self->rotation = r;
                         }];
    } else {
        [self rotation:r];
        self->rotation = r;
    }
    
}

-(void)rotation:(CGFloat) r
{
    self.topLeftController.view.transform = CGAffineTransformMakeRotation(-r);
    self.topRightController.view.transform = CGAffineTransformMakeRotation(-r);
    self.bottomLeftController.view.transform = CGAffineTransformMakeRotation(-r);
    self.bottomRightController.view.transform = CGAffineTransformMakeRotation(-r);
    
    self.layerView.transform = CGAffineTransformMakeRotation(r);
    
}

- (void) loadView
{
    [super loadView];
    
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(-160, -230, 640, 920)];
    self.layerView.backgroundColor = [UIColor blackColor];
    
    self.topLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    self.topLeftView.clipsToBounds = YES;
    self.topRightView = [[UIView alloc]initWithFrame:CGRectMake(320, 0, 320, 460)];
    self.topRightView.clipsToBounds = YES;
    self.bottomLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 460, 320, 460)];
    self.bottomLeftView.clipsToBounds = YES;
    self.bottomRightView = [[UIView alloc]initWithFrame:CGRectMake(320, 460, 320, 460)];
    self.bottomRightView.clipsToBounds = YES;
    
    [self.layerView addSubview:self.topLeftView];
    [self.layerView addSubview:self.topRightView];
    [self.layerView addSubview:self.bottomLeftView];
    [self.layerView addSubview:self.bottomRightView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame =CGRectMake(300, 440, 40, 40);
    [btn addTarget:self action:@selector(btnClickClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.layerView addSubview:btn];
    [self.view addSubview:self.layerView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.topLeftView addSubview:self.topLeftController.view];
    self.topLeftController.view.userInteractionEnabled = NO;
    self.topLeftRect = CGRectMake(160, 230, 320, 460);
    self.topLeftController.view.frame = self.topLeftRect; // CGRectMake(160, 230, 320, 460);
    self.topLeftController.view.layer.anchorPoint = CGPointMake(0.5f + (CENTERPOINT_OFFSET_X /320.0f) , 0.5f + (CENTERPOINT_OFFSET_Y/460.0f));
    
    [self.topRightView addSubview:self.topRightController.view];
    self.topRightController.view.userInteractionEnabled = NO;
    self.topRightRect = CGRectMake(-160, 230, 320, 460);
    self.topRightController.view.frame = self.topRightRect; // CGRectMake(-160, 230, 320, 460);
    self.topRightController.view.layer.anchorPoint = CGPointMake(0.5f + (CENTERPOINT_OFFSET_X /320.0f) , 0.5f + (CENTERPOINT_OFFSET_Y/460.0f));
    
    [self.bottomLeftView addSubview:self.bottomLeftController.view];
    self.bottomLeftController.view.userInteractionEnabled = NO;
    self.bottomLeftRect = CGRectMake(160, -230, 320, 460);
    self.bottomLeftController.view.frame = self.bottomLeftRect; // CGRectMake(160, -230, 320, 460);
    self.bottomLeftController.view.layer.anchorPoint = CGPointMake(0.5f + (CENTERPOINT_OFFSET_X /320.0f) , 0.5f + (CENTERPOINT_OFFSET_Y/460.0f));
    
    [self.bottomRightView addSubview:self.bottomRightController.view];
    self.bottomRightController.view.userInteractionEnabled = NO;
    self.bottomRightRect = CGRectMake(-160, -230, 320, 460);
    self.bottomRightController.view.frame = self.bottomRightRect;  //CGRectMake(-160, -230, 320, 460);
    self.bottomRightController.view.layer.anchorPoint = CGPointMake(0.5f + (CENTERPOINT_OFFSET_X /320.0f) , 0.5f + (CENTERPOINT_OFFSET_Y/460.0f));
    
    self.layerView.center = CGPointMake(160 + CENTERPOINT_OFFSET_X,230 + CENTERPOINT_OFFSET_Y);
    
    [self rotation:-45.0f withAnimation:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
