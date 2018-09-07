//
//  LPHpopOverView.m
//  popview
//
//  Created by lupeihan on 15/8/18.
//  Copyright © 2018 lupeihan. All rights reserved.
//

#import "LPHpopOverView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define keyWindow [[UIApplication sharedApplication] keyWindow]

@interface LPHpopOverView()

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) NSArray *dataArray;

@end


@implementation LPHpopOverView


-(instancetype)initWithOrigin:(CGPoint)origin Width:(CGFloat)width Height:(float)height
{
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)])
    {
        //背景颜色透明
        self.backgroundColor=[UIColor clearColor];
        
        // 添加背景view
        self.bgView = [self createGrayBGView];
        [self addSubview:self.bgView];
        
        //定义显示视图的参数
        self.origin = origin;
        self.height = height;
        self.width = width;
        
        self.backView=[[UIView alloc]initWithFrame:CGRectMake(origin.x, origin.y, width, height)];
        self.backView.backgroundColor=[UIColor whiteColor];
        self.backView.layer.cornerRadius = 4;
        self.backView.layer.masksToBounds = YES;
        [self addSubview:self.backView];
        
        // 箭头位于backView下方中间
        self.imgArrow = [[UIImageView alloc] initWithFrame:CGRectMake(origin.x, origin.y - 5, 20, 20)];
        self.imgArrow.image = [UIImage imageNamed:@"Icon_PopDown.png"];
        self.imgArrow.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:self.imgArrow];
    }
    
    return self;
}

/** 创建灰色背景view*/
- (UIView *)createGrayBGView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    view.backgroundColor = [UIColor grayColor];
    
    view.alpha = 0.5;
    
    return view;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (![touch.view isEqual:self.backView]) {
        [self dismiss];
    }
}

-(void)popView
{
    NSArray *result=[self.backView subviews];
    for (UIView *view in result) {
        
        view.hidden=YES;
        
    }
    
    [keyWindow addSubview:self];
    //动画效果弹出
    self.alpha = 0;

    self.backView.frame = CGRectMake(self.origin.x, self.origin.y-5, 0, 0);
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
        self.backView.frame = CGRectMake(self.origin.x-self.width/2, self.origin.y-5, self.width,-self. height);
    }completion:^(BOOL finished) {
        
        NSArray *result=[self.backView subviews];
        for (UIView *view in result) {
            
            view.hidden=NO;
            
        }
        
    }];
    
}

-(void)dismiss{
    
    NSArray *result=[self.backView subviews];
    for (UIView *view in result) {
        
        [view removeFromSuperview];
        
    }
    
    //动画效果淡出
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y, 0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
            
        }
    }];
    
    
    
}



@end
