//
//  4quareMenuViewController.h
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RECTPRINTSTR @" Rect(X:%.0f Y:%.0f Width:%.0f height:%.0f) "
#define RECTSTRUCT(rect) rect.origin.x,rect.origin.y,rect.size.width,rect.size.height
#define RECTLOG(rect,info, ...) NSLog(@"%@:%d:" info RECTPRINTSTR,[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__LINE__,##__VA_ARGS__,RECTSTRUCT(rect))

@interface Quare4MenuViewController : UIViewController{

    CGFloat rotation;
}

@property (nonatomic,strong) UIViewController *topLeftController;
@property (nonatomic,strong) UIViewController *topRightController;
@property (nonatomic,strong) UIViewController *bottomLeftController;
@property (nonatomic,strong) UIViewController *bottomRightController;



- (id)initWithTopLeft:(UIViewController *)tl TopRight:(UIViewController *)tr bottomLeft:(UIViewController *)bl bottomRight:(UIViewController *)br;

@end
