//
//  4quareMenuViewController.m
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import "Quare4MenuViewController.h"

@interface Quare4MenuViewController ()

@property (nonatomic,strong) UIView *topLeftView;
@property (nonatomic,strong) UIView *topRightView;
@property (nonatomic,strong) UIView *bottomLeftView;
@property (nonatomic,strong) UIView *bottomRightView;

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
    
    CGFloat r = self->rotation == 0.0f ? -20.0f : 0.0f;
    CGFloat xPosition = self->rotation == 0.0f ? -40.0f : 40.0f;
    CGFloat yPosition = self->rotation == 0.0f ? -80.0f : 80.0f;
    __block CGRect rect;
    rect = CGRectMake(0, 20, 320, 460);
    rect =  0.0f == self->rotation ? CGRectOffset(rect, -40, -80) : rect;
    
    [UIView animateWithDuration:2.3f
                     animations:^{
                         self.view.transform = CGAffineTransformMakeRotation(r);
                         self.view.frame = rect;
                         
                         self.topLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                         
                         self.topRightController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.bottomLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.bottomRightController.view.transform = CGAffineTransformMakeRotation(-r);
                     }
                     completion:^(BOOL finished) {
                         self.view.transform = CGAffineTransformMakeRotation(r);
                         self.view.frame =  rect; //CGRectOffset(rect,xPosition, yPosition);
                         
                         self.topLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                         
                         self.topRightController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.bottomLeftController.view.transform = CGAffineTransformMakeRotation(-r);
                         self.bottomRightController.view.transform = CGAffineTransformMakeRotation(-r);
                         self->rotation = r;
                     }];
    
}

- (void) loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.topLeftView = [[UIView alloc]initWithFrame:CGRectMake(-160, -230, 320, 460)];
    self.topLeftView.clipsToBounds = YES;
    self.topRightView = [[UIView alloc]initWithFrame:CGRectMake(160, -230, 320, 460)];
    self.topRightView.clipsToBounds = YES;
    self.bottomLeftView = [[UIView alloc]initWithFrame:CGRectMake(-160, 230, 320, 460)];
    self.bottomLeftView.clipsToBounds = YES;
    self.bottomRightView = [[UIView alloc]initWithFrame:CGRectMake(160, 230, 320, 460)];
    self.bottomRightView.clipsToBounds = YES;
    
    [self.view addSubview:self.topLeftView];
    [self.view addSubview:self.topRightView];
    [self.view addSubview:self.bottomLeftView];
    [self.view addSubview:self.bottomRightView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(140, 210, 40, 40);
    [btn addTarget:self action:@selector(btnClickClick:) forControlEvents:UIControlEventTouchUpInside];
//    btn.backgroundColor = [UIColor whiteColor];
//    btn.titleLabel.text = @"click";
    
    [self.view addSubview:btn];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.topLeftView addSubview:self.topLeftController.view];
    self.topLeftController.view.userInteractionEnabled = NO;
    self.topLeftController.view.frame = CGRectMake(160, 230, 320, 460);
    
    [self.topRightView addSubview:self.topRightController.view];
    self.topRightController.view.userInteractionEnabled = NO;
    self.topRightController.view.frame = CGRectMake(-160, 230, 320, 460);
    
    [self.bottomLeftView addSubview:self.bottomLeftController.view];
    self.bottomLeftController.view.userInteractionEnabled = NO;
    self.bottomLeftController.view.frame = CGRectMake(160, -230, 320, 460);
    
    [self.bottomRightView addSubview:self.bottomRightController.view];
    self.bottomRightController.view.userInteractionEnabled = NO;
    self.bottomRightController.view.frame = CGRectMake(-160, -230, 320, 460);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
