


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
    [btn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:btn];
    
}

- (void)show
{
    NSArray *arr = @[
                     @{@"Text":@"车窗检查通过00000000000",@"Pass":@1},
                     @{@"Text":@"地板检查通过",@"Pass":@1},
                     @{@"Text":@"机械检查不通过",@"Pass":@0},
                     @{@"Text":@"室内检查通过",@"Pass":@1},
                     @{@"Text":@"",@"Pass":@0}];
    [LPHPopTable popWithArray:arr title:@"内容项" popBlock:^(NSInteger index) {
        NSLog(@"点击第 %ld 个",index);
    }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
