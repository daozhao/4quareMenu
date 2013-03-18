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
    
    return self;
}

- (void) loadView
{
    [super loadView];
    
    self.topLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 160, 230)];
    self.topRightView = [[UIView alloc]initWithFrame:CGRectMake(160, 0, 160, 230)];
    self.bottomLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 230, 160, 230)];
    self.bottomRightView = [[UIView alloc]initWithFrame:CGRectMake(160, 230, 160, 230)];
    
    [self.view addSubview:self.topLeftView];
    [self.view addSubview:self.topRightView];
    [self.view addSubview:self.bottomLeftView];
    [self.view addSubview:self.bottomRightView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.topLeftView addSubview:self.topLeftController.view];
    [self.topRightView addSubview:self.topRightController.view];
    [self.bottomLeftView addSubview:self.bottomLeftController.view];
    [self.bottomRightView addSubview:self.bottomRightController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
