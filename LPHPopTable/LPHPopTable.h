//
//   创建显示View，调用LPHpopOverView [self.popview.backView addSubview:创建的视图];
//   弹出框显示
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^POPBlock)(NSInteger index);

@interface LPHPopTable : NSObject


@property (nonatomic,copy) POPBlock popBlock;




+ (LPHPopTable *)shareInstance;

/** 弹出视图 默认向下，箭头居中*/
+ (void)popWithArray:(NSArray *)array title:(NSString *)title popBlock:(POPBlock)popBlock;

/** 弹出视图
 *  viewCGRect：  显示框坐标
 *  point:       箭头位置坐标
 */
+ (void)popWithArray:(NSArray *)array
               title:(NSString *)title
          viewCGRect:(CGRect)viewCGRect
               point:(CGPoint)point
            popBlock:(POPBlock)popBlock;


/** 弹出视图
 *  title     ：标题
 *  viewCGRect：显示框坐标
 *  point:       箭头位置坐标
 *  showImage:  显示Cell右部图标
 */
+ (void)popWithArray:(NSArray *)array
               title:(NSString *)title
          viewCGRect:(CGRect)viewCGRect
               point:(CGPoint)point
           showImage:(BOOL)showImage
            popBlock:(POPBlock)popBlock;



/** 关闭视图*/
+ (void)dismiss;

@end
