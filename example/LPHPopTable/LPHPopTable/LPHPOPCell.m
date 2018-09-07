

#import "LPHPOPCell.h"

@implementation LPHPOPCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    // 以下代码用于解决从cocopods加载的xib文件异常处理
    NSString  *Bundle_Name = @"LPHPopTable.bundle";
    NSString *Bundle_Path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:Bundle_Name];
    NSBundle * Bundle = [NSBundle bundleWithPath:Bundle_Path];
    if(Bundle)
    {
        self = [Bundle loadNibNamed:@"LPHPOPCell" owner:self options:nil].lastObject;
    }
    
    self.lbltitle.adjustsFontSizeToFitWidth = YES;
}


- (void)showData:(NSDictionary *)data
{
    self.lbltitle.text = data[@"Text"];
    BOOL isPass = [data[@"Pass"]boolValue];

    if(isPass)
    {
        self.img.image = [UIImage imageNamed:@"Icon_Pass"];
    }else
    {
        self.img.image = [UIImage imageNamed:@"Icon_UnPass"];
    }
    
    if(self.lbltitle.text.length < 1)
    {
        self.img.hidden = YES;
    }else
    {
        self.img.hidden = NO;
    }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
