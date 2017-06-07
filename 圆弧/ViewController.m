//
//  ViewController.m
//  圆弧
//
//  Created by 大虾咪 on 2017/6/7.
//  Copyright © 2017年 大虾咪. All rights reserved.
//

#import "ViewController.h"
#import "TMFCircleView.h"
@interface ViewController ()

@end

@implementation ViewController
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//
//    CAShapeLayer *layer = [CAShapeLayer new];
//    layer.lineWidth = 10;
//    //圆环的颜色
//    layer.strokeColor = [UIColor redColor].CGColor;
//    //背景填充色
//    layer.fillColor = [UIColor clearColor].CGColor;
//    //设置半径为10
//    CGFloat radius = 100;
//    //按照顺时针方向
//    BOOL clockWise = true;
//    //初始化一个路径
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.center.x, 200) radius:radius startAngle:(3*M_PI/4) endAngle:(M_PI) clockwise:clockWise];
//    layer.path = [path CGPath];
//    [view.layer addSublayer:layer];
//    
//    
//    
//    CAShapeLayer *layer1 = [CAShapeLayer new];
//    layer1.lineWidth = 10;
//    //圆环的颜色
//    layer1.strokeColor = [UIColor greenColor].CGColor;
//    //背景填充色
//    layer1.fillColor = [UIColor clearColor].CGColor;
//    
//    
//    //初始化一个路径
//    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.center.x, 200) radius:radius startAngle:(M_PI) endAngle:(M_PI/4) clockwise:clockWise];
//    
//    //    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.center.x, 200) radius:radius startAngle:(M_PI) endAngle:(M_PI/4) clockwise:clockWise];
//    layer1.path = [path1 CGPath];
//    [view.layer addSublayer:layer1];

    
    [self drawCicleWitha:0 withb:0 withc:0 withd:0];
    
    [self performSelector:@selector(drawCic) withObject:nil         afterDelay:2.0];

}
- (void)drawCic {
    [self drawCicleWitha:301.25 withb:235.23 withc:452.65 withd:200.0];

}

- (void)drawCicleWitha:(float)a withb:(float)b withc:(float)c withd:(float)d{
    
    //    float a=301.25,b=235.23,c=452.65,d=200.0;
    
    
    TMFCircleView *circleView= [[TMFCircleView alloc] initWithFrame:CGRectMake(0,10, kScreenWidth, 300)];
    circleView.backgroundColor = [UIColor grayColor];
    
    
    /**
     circleArrary封装了字典
     
     圆环的宽度 ： circleWidth
     圆环的颜色 ： cicleColor
     圆环的半径 ： circleRadius
     比例      ： circlePre
     */
    circleView.circleArray =@[
                              @{
                                  
                                  @"circleViewX":@(kScreenWidth/2),
                                  @"circleViewY":@(160),
                                  @"circleWidth":@(10.0),
                                  @"circleRadius":@(150)
                                  
                                  },
                              @{
                                  
                                  @"cicleColor":[UIColor yellowColor],
                                  @"circlePre"  :@(a/(a+b+c+d)),
                                  
                                  },
                              @{
                                  
                                  @"cicleColor":[UIColor redColor],
                                  @"circlePre"  :@(b/(a+b+c+d)),
                                  
                                  },
                              @{
                                  
                                  @"cicleColor":[UIColor greenColor],
                                  @"circlePre"  :@(c/(a+b+c+d)),
                                  
                                  },
                              @{
                                  
                                  @"cicleColor":[UIColor magentaColor],
                                  @"circlePre"  :@(c/(a+b+c+d)),
                                  
                                  },
                              ];
    [self.view addSubview:circleView];
    
    

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
