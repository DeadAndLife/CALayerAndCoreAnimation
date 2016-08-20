//
//  CatranstionVC.m
//  02CoreAnimationDemo
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "CatranstionVC.h"

@interface CatranstionVC ()

@end

@implementation CatranstionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initLayer];
}
-(void) initLayer{
  //1.初始化baseLayer
    _baseLayer=[CALayer layer];
    _baseLayer.bounds=CGRectMake(0, 0, 180, 180);
    _baseLayer.position=CGPointMake(180, 340);
    
    [self.view.layer addSublayer:_baseLayer];
    //2.初始化redLayer
    _redLayer=[CALayer layer];
    _redLayer.backgroundColor=[UIColor redColor].CGColor;
    _redLayer.bounds=CGRectMake(0, 0, 180, 180);
    _redLayer.position=CGPointMake(90, 90);
    _redLayer.hidden=YES;
    [_baseLayer addSublayer:_redLayer];
    //3.初始化blueLayer
    _blueLayer=[CALayer layer];
    _blueLayer.backgroundColor=[UIColor blueColor].CGColor;
    _blueLayer.bounds=CGRectMake(0, 0, 180, 180);
    _blueLayer.position=CGPointMake(90, 90);
    _blueLayer.hidden=NO;
    
    [_baseLayer addSublayer:_blueLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//转场的功能
-(IBAction)trasactionBtn:(id)sender{
    //1.初始化动画
    CATransition *transition=[CATransition animation];
    //2.动画样式
    NSArray *typeArr=@[kCATransitionFade,kCATransitionMoveIn,kCATransitionPush,kCATransitionReveal];
    NSArray *subTypeArr=@[kCATransitionFromRight,kCATransitionFromLeft,kCATransitionFromTop,kCATransitionFromBottom];
    //4.设置type,subtype
    transition.type=typeArr[typeSegmented.selectedSegmentIndex];
    transition.subtype=subTypeArr[subTypeSegmented.selectedSegmentIndex];
    //5.添加动画
    [_baseLayer addAnimation:transition forKey:nil];
    
    _redLayer.hidden=!_redLayer.hidden;
    _blueLayer.hidden=!_blueLayer.hidden;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
