//
//  ViewController.m
//  01CALayerDemo
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//懒加载的方式初始化三个图层的对象

-(CALayer *) layer{
    if (_layer) {
        return _layer;
    }
    //初始化
    _layer=[CALayer layer];
    //设置图层的背景颜色
    _layer.backgroundColor=[UIColor greenColor].CGColor;
    //设置图层的大小位置
    _layer.bounds=CGRectMake(0, 0, 200, 200);
    _layer.position=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view.layer addSublayer:_layer];
    return _layer;
}
-(CALayer *) maskLayer{
    if (_maskLayer) {
        return _maskLayer;
    }
    //初始化
    _maskLayer=[CALayer layer];
    UIImage *img=[UIImage imageNamed:@"StarMask"];
    //将UIImage对象添加到图层
    _maskLayer.contents=(__bridge id _Nullable)(img.CGImage);
    _maskLayer.bounds=CGRectMake(0, 0, 100, 100);
    _maskLayer.position=CGPointMake(100, 100);
    return _maskLayer;
}
-(QYLayer *) boundsLayer{
    if (_boundsLayer) {
        return _boundsLayer;
    }
    _boundsLayer=[QYLayer layer];
    _boundsLayer.backgroundColor=[UIColor blueColor].CGColor;
    _boundsLayer.bounds=CGRectMake(0,0, 200 ,200);
    _boundsLayer.position=CGPointMake(50, 50);
    //对图层刷新的方法
    [_boundsLayer setNeedsDisplay];
    return _boundsLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//边框
-(IBAction)BorderBtn:(id)sender{
//    if (self.layer.borderWidth>0) {
//        self.layer.borderWidth=0;
//    }else{
//        self.layer.borderWidth=5;
//    }
    self.layer.borderWidth=self.layer.borderWidth?0:5;
}
//边框的颜色
-(IBAction)BorderColorBtn:(id)sender{
    self.layer.borderColor=[UIColor redColor].CGColor;
}
//边框透明度
-(IBAction)opacityBtn:(id)sender{
    //透明度 0~1
    if(self.layer.opacity==1){
        self.layer.opacity=.3;
    }else{
        self.layer.opacity=1;
    }
}
//圆角
-(IBAction)radiusBtn:(id)sender{
    self.layer.cornerRadius=self.layer.cornerRadius?0:100;
}
//阴影
-(IBAction)shadowBtn:(id)sender{
    //阴影的透明度0~1
    if (self.layer.shadowOpacity==1) {
        self.layer.shadowOpacity=0;//默认为0
    }else{
        self.layer.shadowColor=[UIColor blueColor].CGColor;//阴影的颜色
        self.layer.shadowOpacity=1;
        self.layer.shadowOffset=CGSizeMake(-13, -16);
        self.layer.shadowRadius=25;//阴影的半径 默认为3
        
    }
}
//蒙版
-(IBAction)maskBtn:(id)sender{
  //
  //  self.layer.mask=self.maskLayer;
    self.layer.mask=self.layer.mask?nil:self.maskLayer;
}
//蓝色的图层作为子图层时是否超越边界
-(IBAction)maskToboundsBtn:(id)sender{
    self.layer.masksToBounds=YES;//默认不超越边界.NO
    //添加子图层
    [self.layer addSublayer:self.boundsLayer];
}
//添加子图层
-(IBAction)addSubLayerBtn:(id)sender{
    //1.删除图层
    BOOL isDone=YES;
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[QYLayer class]]) {
            isDone=NO;
        }
    }
    
    if (isDone) {
        //将图层添加至self.layer
        QYLayer *layer=[QYLayer layer];
        layer.bounds=CGRectMake(0, 0, 100, 100);
        layer.position=CGPointMake(100,100);
        //图层绘制 draw 必须要手动去调用setNeedsDisplay 进行刷新图层
        [layer setNeedsDisplay];
        //添加子图层
        [self.layer addSublayer:layer];
    }
}

@end
