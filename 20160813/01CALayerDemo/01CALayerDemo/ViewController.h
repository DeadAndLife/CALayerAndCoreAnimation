//
//  ViewController.h
//  01CALayerDemo
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYLayer.h"
@interface ViewController : UIViewController
//三个不同的图层对象
@property(nonatomic,strong) CALayer *layer;
@property(nonatomic,strong) CALayer *maskLayer;//蒙版的对象
@property(nonatomic,strong) QYLayer *boundsLayer;//CALayer自定义对象
@end

