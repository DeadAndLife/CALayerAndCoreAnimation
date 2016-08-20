//
//  QYCAAnimationVC.m
//  02CoreAnimationDemo
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "QYCAAnimationVC.h"

@interface QYCAAnimationVC ()

@end

@implementation QYCAAnimationVC
//1.懒加载初始化蒙版(遮罩)图层
-(CALayer *) maskLayer{
    if (_maskLayer) {
        return _maskLayer;
    }
    //1.初始化Layer
    _maskLayer=[CALayer layer];
    _maskLayer.bounds=CGRectMake(0, 0, 200, 200);
    _maskLayer.position=CGPointMake(100, 100);
    _maskLayer.contents=(__bridge id _Nullable)([[UIImage imageNamed:@"1.png"] CGImage]);
    return _maskLayer;
}
//2.初始化图层
-(void) initLayer{
    //1.创建图层的对象
    _layer=[CALayer layer];
    //2.设置layer的属性
    _layer.backgroundColor=[UIColor redColor].CGColor;
    _layer.cornerRadius=25;
    //3.设置位置信息 bounds position =frame,图层当中没法使用frame
    _layer.bounds=CGRectMake(0, 0, 200,200);
    _layer.position=CGPointMake(180, 320);
    _layer.mask=self.maskLayer;
    //4.将图层添加至视图控制器中
    [self.view.layer addSublayer:_layer];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initLayer];
    [self addAnimationForLayer:_layer];
}
//3.给图层添加动画
-(void) addAnimationForLayer:(CALayer *) tempLayer{
    //1.创建动画的对象
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //2.设置动画的属性
    animation.duration=5;//动画持续的时间
    animation.toValue=@2.0;//setFromeValue 开始值 setToValue是结束值
    animation.repeatCount=1;//HUGE_VAL;//动画的重复次数 永远重复,默认0 表示1此
    animation.speed=1.0;//动画的速度
  //  animation.autoreverses=YES;//动画路径返回
    
    //fileMode的作用是觉得当前对象过了非action时间段的行为,比如动画开始之前,动画结束之后.如果用一个动画CAAnimation,则需要    animation.removedOnCompletion=NO;animation.autoreverses=NO,否则fillMode不起作用.
    animation.removedOnCompletion=NO;
    
    //kCAFillModeRemoved 是默认值,动画开始和结束后,动画对图层没有影响,动画结束后,会恢复到之前的状态.
    //kCAFillModeForwards 当动画结束后,layer保持动画的最后状态
    //kCAFillModeBackwards 和kCAFillModeForwards相对的,动画执行的不同状态.就是在动画开始前,将动画加入了layer后,layer会立即进入动画的初始状态并等待动画开始.
    //kCAFillModeBoth kCAFillModeForwards和kCAFillModeBackwards的合成.表示动画加入后 动画开始之前,layer处于动画的初始状态,动画结束后,layer处于动画最后的状态.
    animation.fillMode=kCAFillModeBoth;
    //3.将动画的对象添加至图层
    [tempLayer addAnimation:animation forKey:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
