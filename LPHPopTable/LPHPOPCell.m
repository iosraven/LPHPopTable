

#import "LPHPOPCell.h"

@implementation LPHPOPCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    self.lbltitle.adjustsFontSizeToFitWidth = YES;
    
    if((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad))
    {
        self.lbltitle.font = [UIFont systemFontOfSize:20.0f];
    }else
    {
        self.lbltitle.font = [UIFont systemFontOfSize:17.0f];
    }
    
}



- (void)showData:(NSDictionary *)data showImage:(BOOL)showImage
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
    
    if(showImage)
    {
        self.image_Width.constant = 30.0f;
        self.image_Tralling.constant = 8.0f;
    }else
    {
        self.image_Width.constant = 0;
        self.image_Tralling.constant = 0;
    }
    
}




- (void)showData:(NSDictionary *)data
{
    
    [self showData:data showImage:YES];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
