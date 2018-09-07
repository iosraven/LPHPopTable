//
//
//   LPHPopTable   Cell   类
//    文字+图标
//


#import <UIKit/UIKit.h>

@interface LPHPOPCell : UITableViewCell


@property (nonatomic,weak) IBOutlet UILabel *lbltitle;


@property (nonatomic,weak) IBOutlet UIImageView *img;



- (void)showData:(NSDictionary *)data;


@end
