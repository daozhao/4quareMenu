//
//  4quareMenuViewController.h
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Quare4MenuViewController : UIViewController


@property (nonatomic,strong) UIViewController *topLeftController;
@property (nonatomic,strong) UIViewController *topRightController;
@property (nonatomic,strong) UIViewController *bottomLeftController;
@property (nonatomic,strong) UIViewController *bottomRightController;



- (id)initWithTopLeft:(UIViewController *)tl TopRight:(UIViewController *)tr bottomLeft:(UIViewController *)bl bottomRight:(UIViewController *)br;

@end
