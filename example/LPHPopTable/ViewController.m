/**
 
 调用示例:
 1. 引入 #import "LPHPopTable.h"
 
 
 2. 示例： NSArray *arr = @[
 @{@"Text":@"车窗检查通过",@"Pass":@1},
 @{@"Text":@"地板检查通过",@"Pass":@1},
 @{@"Text":@"机械检查不通过",@"Pass":@0},
 @{@"Text":@"室内检查通过",@"Pass":@1},
 @{@"Text":@"",@"Pass":@0}
 ];
 
 
 [LPHPopTable popWithArray:arr title:@"内容项" popBlock:^(NSInteger index) {
 NSLog(@"点击第 %ld 个",index);
 }];
 
 
 
 3.  示例：定制视图样式大小与箭头坐标
 
 #define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
 #define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width
 
 NSArray *arr = @[
 @{@"Text":@"更改状态",@"Pass":@1},
 @{@"Text":@"作废",@"Pass":@1},
 @{@"Text":@"取消",@"Pass":@0}];
 
 CGRect viewCGRect;
 if((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad))
 {
 viewCGRect = CGRectMake(Main_Screen_Width - 300, Main_Screen_Height - 300, 300, 210);
 }else
 {
 viewCGRect = CGRectMake(Main_Screen_Width - 210, Main_Screen_Height - 300, 200, 210);
 }
 
 CGPoint point = CGPointMake(viewCGRect.size.width * 3/4 + viewCGRect.origin.x, viewCGRect.origin.y +viewCGRect.size.height);
 
 
 [LPHPopTable popWithArray:arr
 title:@"更多功能"
 viewCGRect:viewCGRect
 point:point
 showImage:YES
 popBlock:^(NSInteger index) {
 
 
 }];
 
 */


#import "ViewController.h"
#import "LPHPopTable.h"
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, Main_Screen_Height - 80, Main_Screen_Width, 60)];
    
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(show1) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:btn];
    
}

// 普通调用
- (void)show1
{
    
    NSArray *arr = @[
                     @{@"Text":@"更改状态",@"Pass":@1},
                     @{@"Text":@"作废",@"Pass":@1},
                     @{@"Text":@"取消",@"Pass":@0}];
    
    [LPHPopTable popWithArray:arr title:@"内容项" popBlock:^(NSInteger index) {
        NSLog(@"点击第 %ld 个",index);
    }];
}

// 定义箭头坐标调用
- (void)show2
{
    
    NSArray *arr = @[
                     @{@"Text":@"更改状态",@"Pass":@1},
                     @{@"Text":@"作废",@"Pass":@1},
                     @{@"Text":@"取消",@"Pass":@0}];
    
    
    CGRect viewCGRect = CGRectMake(50, 200, 300, 400);
    CGPoint point = CGPointMake(viewCGRect.size.width * 3/4 + viewCGRect.origin.x, viewCGRect.origin.y +viewCGRect.size.height);
    [LPHPopTable popWithArray:arr
                        title:@"内容项"
                   viewCGRect:viewCGRect
                        point:point
                     popBlock:^(NSInteger index) {
                        
                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
