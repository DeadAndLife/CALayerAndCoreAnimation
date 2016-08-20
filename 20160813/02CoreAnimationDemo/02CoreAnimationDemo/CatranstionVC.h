//
//  CatranstionVC.h
//  02CoreAnimationDemo
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatranstionVC : UIViewController
{
   IBOutlet UISegmentedControl *typeSegmented;
   IBOutlet UISegmentedControl *subTypeSegmented;
}
@property(nonnull,strong) CALayer *baseLayer;
@property(nonnull,strong) CALayer *redLayer;
@property(nonnull,strong) CALayer *blueLayer;

@end
