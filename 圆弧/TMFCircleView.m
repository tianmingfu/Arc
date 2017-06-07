//
//  TMFCircleView.m
//  圆弧
//
//  Created by 大虾咪 on 2017/6/7.
//  Copyright © 2017年 大虾咪. All rights reserved.
//

#import "TMFCircleView.h"

@interface TMFCircleView ()

@property (nonatomic,strong) CAShapeLayer *shapeLayer;


@end

@implementation TMFCircleView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    

    if (self) {
        
     
        
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    __block float startP = 0;
    __block float  circleWidth = 0;
    __block float circleRadius = 0;
    __block float circleViewX = 0;
    __block float circleViewY = 0;
    [self.circleArray enumerateObjectsUsingBlock:^(NSDictionary  *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
        if (idx==0){
         circleWidth = [obj[@"circleWidth"] floatValue];
         circleRadius =  [obj[@"circleRadius"] floatValue];
         circleViewX  = [obj[@"circleViewX"] floatValue];
         circleViewY =  [obj[@"circleViewY"] floatValue];

        }else{

            //创建CAShapeLayer
            self.shapeLayer = [CAShapeLayer layer];
            //设置shapeLayer的尺寸和位置
            self.shapeLayer.frame =CGRectMake(0,0, self.bounds.size.width,self.bounds.size.height);
            //填充颜色为ClearColor
            self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
            
            //设置线条的宽度和颜色
            self.shapeLayer.lineWidth = circleWidth;
            self.shapeLayer.strokeColor = [obj[@"cicleColor"]CGColor];
            //创建出圆形贝塞尔曲线
            //   设置半径
            CGFloat radius = circleRadius;
            //   按照顺时针方向
            BOOL clockWise = true;
            UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(circleViewX, circleViewY) radius:radius startAngle:(3*M_PI/4) endAngle:(M_PI/4) clockwise:clockWise];
            
            //        UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0, self.bounds.size.width,self.bounds.size.height)];
            //让贝塞尔曲线与CAShapeLayer产生联系
            self.shapeLayer.path = circlePath.CGPath;
            self.shapeLayer.strokeStart = startP;
            self.shapeLayer.strokeEnd = [obj[@"circlePre"]floatValue] + startP;
            startP = self.shapeLayer.strokeEnd;
            //添加并显示
            [self.layer addSublayer:self.shapeLayer];
            
            
            //添加圆环动画
            CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            pathAnimation.duration = 1.0;
            pathAnimation.fromValue = @(0);
            pathAnimation.toValue = @(1);
            pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            [self.shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
            
            

        }
        
    }];
}


@end
