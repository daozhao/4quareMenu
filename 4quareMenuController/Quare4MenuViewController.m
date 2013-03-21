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



- (void)rotationToTopLeft
{
//    self.currentController = self.topLeftController;
    [self rotation:180 withAnimation:YES completion:^(BOOL finished) {
        [self displayTopLeft];
    }];
}

- (void)rotationToTopRight
{
//    self.currentController = self.topRightController;
    [self rotation:90 withAnimation:YES completion:^(BOOL finished){
        [self displayTopRight];
    }];
}

- (void)rotationToBottomLeft
{
//    self.currentController = self.bottomLeftController;
//    RECTLOG(self.bottomLeftController.view.frame,@"bottomLeft Controller");
//    RECTLOG(self.bottomLeftRect,@"bottomLeftRect ");
//    RECTLOG(self.bottomLeftView.frame,@"bottomLeftVeiw ");
    [self rotation:-90 withAnimation:YES completion:^(BOOL finished){
        [self displayBottomLeft];
    }];
}

- (void)rotationToBottomRight
{
//    self.currentController = self.bottomRightController;
    [self rotation:0 withAnimation:YES completion:^(BOOL finished) {
        [self displayBottomRight];
    }];
}

- (void)rotationToDefault
{
    [self rotation:DEFAUTROTATION withAnimation:YES completion:nil];
}

- (void)rotation:(CGFloat) degrees withAnimation:(BOOL) animation completion:(void (^)(BOOL finished))completion
{
    
    CGFloat r = DEGREES_TO_RADIANS(degrees);
    if ( animation ){
        [UIView animateWithDuration:0.3f
                         animations:^{
                             [self rotation:r];
                         }
                         completion:completion
                         ];
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
    
//    RECTLOG(self.view.frame, @" view frame:");
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    NSInteger size = 4;
    
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(-width, -height, size * width, size*height)];
    self.layerView.backgroundColor = [UIColor blackColor];
//    self.layerView.clipsToBounds = NO;
    
    self.topLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width * size/2 , height * size/2)];
    self.topLeftView.clipsToBounds = YES;
    self.topRightView = [[UIView alloc]initWithFrame:CGRectMake(width * size/2, 0, width * size/2, height * size/2)];
    self.topRightView.clipsToBounds = YES;
    self.bottomLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, height * size/2 , width * size/2, height * size/2 )];
    self.bottomLeftView.clipsToBounds = YES;
    self.bottomRightView = [[UIView alloc]initWithFrame:CGRectMake(width * size/2, height * size/2, width * size/2, height * size/2)];
    self.bottomRightView.clipsToBounds = YES;
    
    [self.layerView addSubview:self.topLeftView];
    [self.layerView addSubview:self.topRightView];
    [self.layerView addSubview:self.bottomLeftView];
    [self.layerView addSubview:self.bottomRightView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame =CGRectMake((size*width - 40 )/2 , (height * size - 40)/2 , 40, 40);
    [btn addTarget:self action:@selector(btnClickClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.layerView addSubview:btn];
    [self.view addSubview:self.layerView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    [self.topLeftView addSubview:self.topLeftController.view];
    self.topLeftController.view.userInteractionEnabled = NO;
    self.topLeftRect = CGRectMake(self.topLeftView.frame.size.width - width/2, self.topLeftView.frame.size.height-height/2, width, height);
    self.topLeftController.view.frame = self.topLeftRect;
    self.topLeftController.view.layer.anchorPoint = CGPointMake(0.5f + (CENTERPOINT_OFFSET_X /width) , 0.5f + (CENTERPOINT_OFFSET_Y/height));
    
    [self.topRightView addSubview:self.topRightController.view];
    self.topRightController.view.userInteractionEnabled = NO;
    self.topRightRect = CGRectMake(- width/2, self.topRightView.frame.size.height - height/2, width, height);
    self.topRightController.view.frame = self.topRightRect;
    self.topRightController.view.layer.anchorPoint = CGPointMake(0.5f + (CENTERPOINT_OFFSET_X /width) , 0.5f + (CENTERPOINT_OFFSET_Y/height));
    
    [self.bottomLeftView addSubview:self.bottomLeftController.view];
    self.bottomLeftController.view.userInteractionEnabled = NO;
    self.bottomLeftRect = CGRectMake(self.topRightView.frame.size.width - width/2, -height/2, width, height);
    self.bottomLeftController.view.frame = self.bottomLeftRect;
    self.bottomLeftController.view.layer.anchorPoint = CGPointMake(0.5f + (CENTERPOINT_OFFSET_X /width) , 0.5f + (CENTERPOINT_OFFSET_Y/height));
    
    [self.bottomRightView addSubview:self.bottomRightController.view];
    self.bottomRightController.view.userInteractionEnabled = NO;
    self.bottomRightRect = CGRectMake(-width/2, -height/2, width, height);
    self.bottomRightController.view.frame = self.bottomRightRect;
    self.bottomRightController.view.layer.anchorPoint = CGPointMake(0.5f + (CENTERPOINT_OFFSET_X /width) , 0.5f + (CENTERPOINT_OFFSET_Y/height));
    
    UITapGestureRecognizer *tapRecognizer;
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapTopLeft:)] ;
    [self.topLeftView addGestureRecognizer:tapRecognizer];
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapTopRight:)] ;
    [self.topRightView addGestureRecognizer:tapRecognizer];
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapBottomLeft:)] ;
    [self.bottomLeftView addGestureRecognizer:tapRecognizer];
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapBottomRight:)] ;
    [self.bottomRightView addGestureRecognizer:tapRecognizer];
    
    self.layerView.center = CGPointMake(width/2+ CENTERPOINT_OFFSET_X,height/2+ CENTERPOINT_OFFSET_Y);
    
    [self rotation:DEFAUTROTATION withAnimation:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTapTopLeft:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)     {
        NSLog(@"Tap handleTapTopLeft");
        [self rotationToTopLeft];
    }
}

- (void)handleTapTopRight:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)     {
        NSLog(@"Tap handleTapTopRight");
        [self rotationToTopRight];
    }
}

- (void)handleTapBottomLeft:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)     {
        NSLog(@"Tap handleTapBottomLeft");
        [self rotationToBottomLeft];
    }
}

- (void)handleTapBottomRight:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)     {
        NSLog(@"Tap handleTapBottomRight");
        [self rotationToBottomRight];
        
    }
}
- (void)btnClickClick:(id) sender
{
//    [self displayBottomRight];
    if ( self.currentController == self.bottomRightController){
        [self closeBottomRight];
        return;
    }

    if ( self.currentController == self.topRightController){
        [self closeTopRight];
        return;
    }
    
    if ( self.currentController == self.topLeftController){
        [self closeTopLeft];
        return;
    }
    
    if ( self.currentController == self.bottomLeftController){
        [self closeBottomLeft];
        return;
    } else {
//        [self displayBottomLeft];
    }

//    [self displayBottomLeft];
    
}

-(void)displayTopLeft
{
    NSLog(@"display top left");
    [UIView animateWithDuration:0.3f
                     animations:^{
                         CGFloat moveX = self.layerView.center.x;
                         CGFloat moveY = self.layerView.center.y;
                         
                         self.layerView.center = CGPointMake(0, 0);
                         
                         
                         self.topLeftController.view.center = CGPointMake(self.topLeftController.view.center.x - moveX,self.topLeftController.view.center.y - moveY);
                         
                     }
                     completion:^(BOOL finished) {
                         self.currentController = self.topLeftController;
                         NSLog(@"bottomRightController finished view center x:%.2f y:%.2f",self.topLeftController.view.center.x,self.topLeftController.view.center.y);
                     }];
}

-(void)closeTopLeft
{
    NSLog(@"close bottom right");
    [UIView animateWithDuration:0.3f
                     animations:^{
                         CGFloat width = self.view.frame.size.width;
                         CGFloat height = self.view.frame.size.height;
                         
                         CGFloat moveX = width/2+ CENTERPOINT_OFFSET_X;
                         CGFloat moveY = height/2+ CENTERPOINT_OFFSET_Y;
                         
                         self.layerView.center = CGPointMake(moveX,moveY);
                         
                         self.topLeftController.view.center = CGPointMake(self.topLeftController.view.center.x + moveX,self.topLeftController.view.center.y + moveY);
                     }
                     completion:^(BOOL finished) {
                         self.currentController = nil;
                         [self rotationToDefault];
                         }];
}

-(void)displayTopRight
{
    NSLog(@"display top Right");
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         CGFloat moveX = self.layerView.center.x;
                         CGFloat moveY = self.layerView.center.y;
                         
                         self.topRightController.view.center = CGPointMake(self.topRightController.view.center.x + moveY,self.topRightController.view.center.y - moveX);
                         
                         
                         RECTLOG(self.topRightController.view.frame,@"bottomRight Controller after");
                         
                         self.layerView.center = CGPointMake(0, 0);
                     }
                     completion:^(BOOL finished) {
                         self.currentController = self.topRightController;
                     }];
}

-(void)closeTopRight
{
    NSLog(@"close bottom right");
    [UIView animateWithDuration:0.3f
                     animations:^{
                         CGFloat width = self.view.frame.size.width;
                         CGFloat height = self.view.frame.size.height;
                         
                         CGFloat moveX = width/2+ CENTERPOINT_OFFSET_X;
                         CGFloat moveY = height/2+ CENTERPOINT_OFFSET_Y;
                         
                         self.layerView.center = CGPointMake(moveX,moveY);
                         
                         self.topRightController.view.center = CGPointMake(self.topRightController.view.center.x - moveY,self.topRightController.view.center.y + moveX);
                     }
                     completion:^(BOOL finished) {
                         self.currentController = nil;
                         [self rotationToDefault];
                         }];
}

-(void)displayBottomRight
{
    NSLog(@"display bottom Right");
    [UIView animateWithDuration:0.3f
                     animations:^{
                         CGFloat moveX = self.layerView.center.x;
                         CGFloat moveY = self.layerView.center.y;
                         
                         self.layerView.center = CGPointMake(0, 0);
                         
                         self.bottomRightController.view.center = CGPointMake(moveX,moveY);
                         
                     }
                     completion:^(BOOL finished) {
                         self.currentController = self.bottomRightController;
                     }];
}

-(void)closeBottomRight
{
    NSLog(@"close bottom right");
    [UIView animateWithDuration:0.3f
                     animations:^{
                         CGFloat width = self.view.frame.size.width;
                         CGFloat height = self.view.frame.size.height;
                         
                         CGFloat moveX = width/2+ CENTERPOINT_OFFSET_X;
                         CGFloat moveY = height/2+ CENTERPOINT_OFFSET_Y;
                         
                         self.layerView.center = CGPointMake(moveX,moveY);
                         RECTLOG(self.bottomRightController.view.frame,@"bottomRight Controller");
                         
                         self.bottomRightController.view.center = CGPointMake(self.bottomRightController.view.center.x - moveX,self.bottomRightController.view.center.y - moveY);
                         
                     }
                     completion:^(BOOL finished) {
                         self.currentController = nil;
                         [self rotationToDefault];
                         }];
}

-(void)displayBottomLeft
{
    NSLog(@"display bottom Right");
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         CGFloat moveX = self.layerView.center.x;
                         CGFloat moveY = self.layerView.center.y;
                         
                         self.bottomLeftController.view.center = CGPointMake(self.bottomLeftController.view.center.x - moveY,self.bottomLeftController.view.center.y + moveX);
                         
                         self.layerView.center = CGPointMake(0, 0);
                     }
                     completion:^(BOOL finished) {
                         self.currentController = self.bottomLeftController;
                         }];
}

-(void)closeBottomLeft
{
    NSLog(@"close bottom right");
    [UIView animateWithDuration:0.3f
                     animations:^{
                         CGFloat width = self.view.frame.size.width;
                         CGFloat height = self.view.frame.size.height;
                         
                         CGFloat moveX = width/2+ CENTERPOINT_OFFSET_X;
                         CGFloat moveY = height/2+ CENTERPOINT_OFFSET_Y;
                         
                         self.layerView.center = CGPointMake(moveX,moveY);
                         
                         self.bottomLeftController.view.center = CGPointMake(self.bottomLeftController.view.center.x + moveY,self.bottomLeftController.view.center.y - moveX);
                         
                     }
                     completion:^(BOOL finished) {
                         self.currentController = nil;
                         [self rotationToDefault];
                     }];
}

@end
