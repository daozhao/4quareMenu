//
//  4quareMenuViewController.h
//  4quareMenu
//
//  Created by chen daozhao on 13-3-18.
//  Copyright (c) 2013年 chen daozhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <math.h>

#define RECTPRINTSTR @" Rect(X:%.0f Y:%.0f Width:%.0f height:%.0f) "
#define RECTSTRUCT(rect) rect.origin.x,rect.origin.y,rect.size.width,rect.size.height
#define RECTLOG(rect,info, ...) NSLog(@"%@:%d:" info RECTPRINTSTR,[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__LINE__,##__VA_ARGS__,RECTSTRUCT(rect))

#define RADIANS_TO_DEGREES(radians) ((radians)*(180.0/M_PI))
#define DEGREES_TO_RADIANS(angle) ((angle)/180.0*M_PI)

#define CENTERPOINT_OFFSET_X (-40.0f)
#define CENTERPOINT_OFFSET_Y (-80.0f)

#define DEFAUTROTATION (-50.0f)

@interface Quare4MenuViewController : UIViewController{

    CGFloat rotation;
}

@property (nonatomic,strong) UIViewController *topLeftController;
@property (nonatomic,strong) UIViewController *topRightController;
@property (nonatomic,strong) UIViewController *bottomLeftController;
@property (nonatomic,strong) UIViewController *bottomRightController;
@property (nonatomic,strong) UIViewController *currentController;
@property (nonatomic,strong) UIView *layerView;



- (id)initWithTopLeft:(UIViewController *)tl TopRight:(UIViewController *)tr bottomLeft:(UIViewController *)bl bottomRight:(UIViewController *)br;

@end
