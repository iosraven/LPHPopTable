//
//
//   LPHPopTable   Cell   类
//    文字+图标
//


#import <UIKit/UIKit.h>

@interface LPHPOPCell : UITableViewCell


@property (nonatomic,weak) IBOutlet UILabel *lbltitle;


@property (nonatomic,weak) IBOutlet UIImageView *img;

@property (nonatomic,weak) IBOutlet NSLayoutConstraint *image_Width;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *image_Tralling;

- (void)showData:(NSDictionary *)data;

- (void)showData:(NSDictionary *)data showImage:(BOOL)showImage;


@end
