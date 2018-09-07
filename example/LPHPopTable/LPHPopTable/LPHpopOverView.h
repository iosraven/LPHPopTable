//
//   弹出框显示 + 箭头
//
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>


@interface LPHpopOverView : UIView

// 弹出框view
@property (nonatomic, strong) UIView *backView;

// 弹出view框 背景视图
@property (nonatomic, strong) UIView *bgView;

// 弹出view框 箭头
@property (nonatomic, strong) UIImageView *imgArrow;

-(instancetype)initWithOrigin:(CGPoint)origin Width:(CGFloat)width Height:(float)height;//初始化


-(void)popView;//弹出视图
-(void)dismiss;//隐藏视图



@end
