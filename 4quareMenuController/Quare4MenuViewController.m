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
    
    CGFloat r = self->rotation == 0.0f ? DEGREES_TO_RADIANS(-45) : 0.0f;
    
                             
    [UIView animateWithDuration:2.3f
                     animations:^{
                         self.layerView.transform = CGAffineTransformMakeRotation(r);
                     }
                     completion:^(BOOL finished) {
                         self.layerView.transform = CGAffineTransformMakeRotation(r);
                         self->rotation = r;
    
                         [UIView animateWithDuration:2.3f
                                          animations:^{
//                                              self.topLeftController.view.layer.transform =CATransform3DRotate(self.topLeftController.view.layer.transform,-r, 0, 0, 1);
                                              self.topLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                                              self.topRightController.view.transform = CGAffineTransformMakeRotation(-r);
                                              self.bottomLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                                              self.bottomRightController.view.transform = CGAffineTransformMakeRotation(-r);
                                              
                                          }
                                          completion:^(BOOL finished) {
//                                              self.topLeftController.view.layer.transform =CATransform3DRotate(self.topLeftController.view.layer.transform,-r, 0, 0, 1);
                                              self.topLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                                              self.topRightController.view.transform = CGAffineTransformMakeRotation(-r);
                                              self.bottomLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                                              self.bottomRightController.view.transform = CGAffineTransformMakeRotation(-r);
                                          }];
                         
                     }];
    
}

- (void)btnClickClick2:(id) sender
{
    NSLog(@"btnClick");
    
    CGFloat r = self->rotation == 0.0f ? DEGREES_TO_RADIANS(-45) : 0.0f;
    
    [UIView animateWithDuration:2.3f
                     animations:^{
                         self.topLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.topRightController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.bottomLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.bottomRightController.view.transform = CGAffineTransformMakeRotation(-r);
                         
                     }
                     completion:^(BOOL finished) {
                         self.topLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.topRightController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.bottomLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.bottomRightController.view.transform = CGAffineTransformMakeRotation(-r);
                         
                         [UIView animateWithDuration:2.3f
                                          animations:^{
                                              self.layerView.transform = CGAffineTransformMakeRotation(r);
                                          }
                                          completion:^(BOOL finished) {
                                              self.layerView.transform = CGAffineTransformMakeRotation(r);
                                              self->rotation = r;
                                          }];
                          
                     }];
    
}

- (void)btnClickClick1:(id) sender
{
    NSLog(@"btnClick");
    
    CGFloat r = self->rotation == 0.0f ? DEGREES_TO_RADIANS(-45) : 0.0f;
    
//    self.layerView.frame = CGRectOffset(self.view.frame, -30, -40);
    
//    self.view.layer.anchorPoint = CGPointMake(0.2f,0.3f);
//    self.layerView.center = CGPointMake(160 + CENTERPOINT_OFFSET_X,230 + CENTERPOINT_OFFSET_Y);
    [UIView animateWithDuration:2.3f
                     animations:^{
//                         self.view.center = CGPointMake(160 + CENTERPOINT_OFFSET_X, 230 + CENTERPOINT_OFFSET_Y);
//                         self.view.layer.anchorPoint = CGPointMake( CENTERPOINT_OFFSET_X/160 + 0.5f,CENTERPOINT_OFFSET_Y/230 + 0.5f);
                         //                         self.view.layer.transform = CATransform3DMakeRotation(r, 0.5f, 0.5f,1.0f);
//                         CGAffineTransform3D (r);
                         self.topLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.topRightController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.bottomLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.bottomRightController.view.transform = CGAffineTransformMakeRotation(-r);
                         
                         self.layerView.transform = CGAffineTransformMakeRotation(r);
                     }
                     completion:^(BOOL finished) {
                        
//                         self.view.center = CGPointMake(160 + CENTERPOINT_OFFSET_X, 230 + CENTERPOINT_OFFSET_Y);
//                         self.view.transform = CGAffineTransformMakeRotation(r);
//                         self.view.layer.transform = CATransform3DMakeRotation(r, 0.5f, 0.5f,1.0f);
//                         self.view.layer.anchorPoint = CGPointMake(0.2f,0.3f);
//                         self.view.layer.anchorPoint = CGPointMake( CENTERPOINT_OFFSET_X/160 + 0.5f,CENTERPOINT_OFFSET_Y/230 + 0.5f);
//                         self.view.transform = CGAffineTransformMakeRotation(r);
                         
                         self.topLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.topRightController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.bottomLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.bottomRightController.view.transform = CGAffineTransformMakeRotation(-r);
                         
                         self.layerView.transform = CGAffineTransformMakeRotation(r);
                         self->rotation = r;
                     }];
    
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
    
//    self.topLeftView = [[UIView alloc]initWithFrame:CGRectOffset(CGRectMake(-160, -230, 320, 460),CENTERPOINT_OFFSET_X,CENTERPOINT_OFFSET_Y)];
//    self.topLeftView.clipsToBounds = YES;
//    self.topRightView = [[UIView alloc]initWithFrame:CGRectMake(160, -230, 320, 460)];
//    self.topRightView.clipsToBounds = YES;
//    self.bottomLeftView = [[UIView alloc]initWithFrame:CGRectMake(-160, 230, 320, 460)];
//    self.bottomLeftView.clipsToBounds = YES;
//    self.bottomRightView = [[UIView alloc]initWithFrame:CGRectMake(160, 230, 320, 460)];
//    self.bottomRightView.clipsToBounds = YES;
    
    [self.layerView addSubview:self.topLeftView];
    [self.layerView addSubview:self.topRightView];
    [self.layerView addSubview:self.bottomLeftView];
    [self.layerView addSubview:self.bottomRightView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    btn.frame =CGRectOffset(CGRectMake(140, 210, 40, 40),CENTERPOINT_OFFSET_X,CENTERPOINT_OFFSET_Y);
    btn.frame =CGRectMake(300, 440, 40, 40);
    [btn addTarget:self action:@selector(btnClickClick1:) forControlEvents:UIControlEventTouchUpInside];
//    btn.backgroundColor = [UIColor whiteColor];
//    btn.titleLabel.text = @"click";
    
    [self.layerView addSubview:btn];
    [self.view addSubview:self.layerView];
//    self.view.frame = CGRectOffset(self.view.frame, -30, -40);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.topLeftView addSubview:self.topLeftController.view];
    self.topLeftController.view.userInteractionEnabled = NO;
//    self.topLeftRect = CGRectOffset(CGRectMake(160, 230, 320, 460), 0 - CENTERPOINT_OFFSET_X,0 - CENTERPOINT_OFFSET_Y);
    self.topLeftRect = CGRectMake(160, 230, 320, 460);
    self.topLeftController.view.frame = self.topLeftRect; // CGRectMake(160, 230, 320, 460);
//    self.topLeftController.view.center = CGPointMake(320 - CENTERPOINT_OFFSET_X, 460 - CENTERPOINT_OFFSET_Y);
    self.topLeftController.view.layer.anchorPoint = CGPointMake(0.5f + (CENTERPOINT_OFFSET_X /320.0f) , 0.5f + (CENTERPOINT_OFFSET_Y/460.0f));
    
    [self.topRightView addSubview:self.topRightController.view];
    self.topRightController.view.userInteractionEnabled = NO;
    self.topRightRect = CGRectMake(-160, 230, 320, 460);
    self.topRightController.view.frame = self.topRightRect; // CGRectMake(-160, 230, 320, 460);
//    self.topRightController.view.center = CGPointMake(self.topRightController.view.center.x - CENTERPOINT_OFFSET_X, self.topRightController.view.center.y - CENTERPOINT_OFFSET_Y);
    self.topRightController.view.layer.anchorPoint = CGPointMake(0.5f + (CENTERPOINT_OFFSET_X /320.0f) , 0.5f + (CENTERPOINT_OFFSET_Y/460.0f));
    
    [self.bottomLeftView addSubview:self.bottomLeftController.view];
    self.bottomLeftController.view.userInteractionEnabled = NO;
    self.bottomLeftRect = CGRectMake(160, -230, 320, 460);
    self.bottomLeftController.view.frame = self.bottomLeftRect; // CGRectMake(160, -230, 320, 460);
//    self.bottomLeftController.view.center = CGPointMake(self.bottomLeftController.view.center.x - CENTERPOINT_OFFSET_X, self.bottomLeftController.view.center.y - CENTERPOINT_OFFSET_Y);
    self.bottomLeftController.view.layer.anchorPoint = CGPointMake(0.5f + (CENTERPOINT_OFFSET_X /320.0f) , 0.5f + (CENTERPOINT_OFFSET_Y/460.0f));
    
    [self.bottomRightView addSubview:self.bottomRightController.view];
    self.bottomRightController.view.userInteractionEnabled = NO;
    self.bottomRightRect = CGRectMake(-160, -230, 320, 460);
    self.bottomRightController.view.frame = self.bottomRightRect;  //CGRectMake(-160, -230, 320, 460);
//    self.bottomRightController.view.center = CGPointMake(self.bottomRightController.view.center.x - CENTERPOINT_OFFSET_X, self.bottomRightController.view.center.y - CENTERPOINT_OFFSET_Y);
    self.bottomRightController.view.layer.anchorPoint = CGPointMake(0.5f + (CENTERPOINT_OFFSET_X /320.0f) , 0.5f + (CENTERPOINT_OFFSET_Y/460.0f));
    
    self.layerView.center = CGPointMake(160 + CENTERPOINT_OFFSET_X,230 + CENTERPOINT_OFFSET_Y);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
