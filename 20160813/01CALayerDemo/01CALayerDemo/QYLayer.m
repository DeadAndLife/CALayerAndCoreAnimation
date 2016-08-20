//
//  QYLayer.m
//  01CALayerDemo
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "QYLayer.h"

@implementation QYLayer
//图层的绘制 类似 UIview drawRect的方法
-(void) drawInContext:(CGContextRef) ctx{
    //ctx 图层的上下文
    //绘制图形
    //绘制三角形
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 0, 50);
    CGContextAddLineToPoint(ctx, 100, 50);
    
    //填充
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillPath(ctx);
    
}
@end
