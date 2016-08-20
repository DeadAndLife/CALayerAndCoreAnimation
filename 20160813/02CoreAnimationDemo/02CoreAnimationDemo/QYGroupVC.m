//
//  QYGroupVC.m
//  02CoreAnimationDemo
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "QYGroupVC.h"

@interface QYGroupVC ()

@end

@implementation QYGroupVC
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
//动画方法
-(void) addAnimationForLayer:(CALayer *) tempLayer{
    //1.scale
    CABasicAnimation *scaleAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration=1.5;
    scaleAnimation.toValue=@1.2;
    scaleAnimation.fillMode=kCAFillModeForwards;
    scaleAnimation.beginTime=.5;
    
    //2.rotation
    CABasicAnimation *rotationAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.duration=1.2;
    rotationAnimation.toValue=@M_PI_2; //旋转90°
    rotationAnimation.fillMode=kCAFillModeForwards;
    rotationAnimation.beginTime=.8;//旋转的开始时间
    //3.color 背景颜色变化
    CABasicAnimation *colorAnimation=[CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnimation.duration=2;
    colorAnimation.toValue=(__bridge id _Nullable)([[UIColor greenColor] CGColor]);
    
    
    CAAnimationGroup *group=[CAAnimationGroup animation];
    group.animations=@[scaleAnimation,rotationAnimation,colorAnimation];
    //设置重复的次数,时间,原路径返回
    group.repeatCount=HUGE_VAL;
    group.duration=2;
    group.autoreverses=YES;
    
    
    //最后将动画添加至图层当中
    [tempLayer addAnimation:group forKey:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initLayer];
    [self addAnimationForLayer:self.layer];
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
