//
//  QYKeyPathAnimationVC.m
//  02CoreAnimationDemo
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "QYKeyPathAnimationVC.h"
#define halfScreenWidth [UIScreen mainScreen].bounds.size.width/2.0
@interface QYKeyPathAnimationVC ()

@end

@implementation QYKeyPathAnimationVC
//1.初始化图层
-(void) initLayers{
    //1.初始化platFormLayer
    _platformLayer=[CALayer layer];
    _platformLayer.bounds=CGRectMake(0, 0, halfScreenWidth,44);
    _platformLayer.position=CGPointMake(halfScreenWidth, 200);
    _platformLayer.anchorPoint=CGPointZero;//支点在左上角
    _platformLayer.backgroundColor=[UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:_platformLayer];
    
    //2.初始化超级玛丽
    _maroLayer=[CALayer layer];
    _maroLayer.contents=(__bridge id _Nullable)([[UIImage imageNamed:@"Mario.png"] CGImage]);
    //显示图片的位置比例
    _maroLayer.contentsRect=CGRectMake(0.5, 0, 0.5, 1);
    _maroLayer.bounds=CGRectMake(0, 0, 32, 64);
    _maroLayer.position=CGPointMake(0, self.view.frame.size.height);
    _maroLayer.anchorPoint=CGPointMake(0, 1);//左下角
    [self.view.layer addSublayer:_maroLayer];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initLayers];
}
-(IBAction)jumpBtn:(id)sender{
    //1.事务处理 事务:要操作的这些动作要么全做,要么全都不做
    [CATransaction begin];
    CAKeyframeAnimation *keyAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    //2.更改玛丽的状态
    _maroLayer.contentsRect=CGRectMake(0, 0, .5, 1);
    //3.构建路径
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, self.view.frame.size.height);
    CGPathAddQuadCurveToPoint(path, NULL, 30, 140, halfScreenWidth+10, 200);
    keyAnimation.path=path;
    keyAnimation.duration=.7;
    
    //动画结束时做的处理
    [CATransaction setCompletionBlock:^{
        NSLog(@"动画结束");
        //1.把动画结束
        [CATransaction setDisableActions:YES];//停止动画
        //2.改变玛丽的状态
        _maroLayer.contentsRect=CGRectMake(.5, 0, .5,1);
        _maroLayer.position=CGPointMake(halfScreenWidth+10, 200);
        
        
    }];
    //将动画添加至图层
    [self.maroLayer addAnimation:keyAnimation forKey:nil];
    
    [CATransaction commit];
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
