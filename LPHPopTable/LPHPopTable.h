//
//   创建显示View，调用LPHpopOverView [self.popview.backView addSubview:创建的视图];
//   弹出框显示
//

#import <Foundation/Foundation.h>

typedef void(^POPBlock)(NSInteger index);

@interface LPHPopTable : NSObject


@property (nonatomic,copy) POPBlock popBlock;




+ (LPHPopTable *)shareInstance;

/** 弹出视图*/
+ (void)popWithArray:(NSArray *)array title:(NSString *)title popBlock:(POPBlock)popBlock;


/** 关闭视图*/
+ (void)dismiss;

@end
