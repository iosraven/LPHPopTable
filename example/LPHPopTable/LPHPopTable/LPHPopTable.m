

#import "LPHPopTable.h"
#import "LPHpopOverView.h"
#import "LPHPOPCell.h"

@interface LPHPopTable ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UITableView *tab;

@property (nonatomic,strong) NSArray *arraySource;


@property (nonatomic,weak) LPHpopOverView *popview;


@end



// 定义子控件 - 标题高度
float label_Height = 50.0f;
// 定义子控件 - Cell 高度
float cell_height = 50.0f;



@implementation LPHPopTable



+ (LPHPopTable *)shareInstance
{
    static LPHPopTable *_shareInstance;
    static dispatch_once_t onePredicate;
    
    dispatch_once(&onePredicate, ^{
        
        _shareInstance = [[LPHPopTable alloc] init];
    });
    
    return _shareInstance;
}


+ (void)dismiss
{
    [[self shareInstance] dismiss];
}

- (void)dismiss
{
    [self.popview dismiss];
}

/** 弹出视图*/
+ (void)popWithArray:(NSArray *)array title:(NSString *)title popBlock:(POPBlock)popBlock
{
    [[self shareInstance] popWithArray:array title:title popBlock:popBlock];
}

/** 弹出视图*/
- (void)popWithArray:(NSArray *)array title:(NSString *)title popBlock:(POPBlock)popBlock
{
    self.popBlock = popBlock;
    
    self.arraySource = array;
    
    float ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    float ScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    // 定义弹出框坐标、大小
    float X = ScreenWidth * 0.1;
    float Y = ScreenHeight * 0.5;
    float Width = ScreenWidth * 0.8;
    float Height = ScreenHeight * 0.4;
    float point_X = X + Width/2;
    

    CGPoint point=CGPointMake(point_X,  Height + Y);//箭头点的位置
     //初始化弹出视图的箭头顶点位置point，展示视图的宽度Width，高度Height
    LPHpopOverView *popview=[[LPHpopOverView alloc]initWithOrigin:point
                                                         Width:Width
                                                        Height:Height];

    self.popview = popview;
    
    // 弹出框显示内容
    UIView *viewContent = [[UIView alloc] initWithFrame:CGRectMake(0,0,Width, Height)];
    viewContent.backgroundColor = [UIColor whiteColor];
    
    // 标题
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, Width, 50)];
    lable.text = title;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:22.0f];
    lable.textColor = [UIColor darkGrayColor];
    [viewContent addSubview:lable];
   
    
    // 列表tableview
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, label_Height, Width, Height - label_Height)];

    self.tab = table;
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.tableFooterView = [UIView new];
    self.tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [viewContent addSubview:self.tab];
    
    [self.popview.backView addSubview:viewContent];


    [self.popview popView];
}





#pragma mark UITableView Delegate&&Datasource methods - - - - - - - - - - -

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cell_height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arraySource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdebtifier = @"LPHPOPCell";
    
    // 以下代码用于解决从cocopods加载的xib文件异常处理
    NSString  *Bundle_Name = @"LPHPopTable.bundle";
    NSString *Bundle_Path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:Bundle_Name];
    NSBundle * Bundle = [NSBundle bundleWithPath:Bundle_Path];
    if(Bundle)
    {
        [tableView registerNib:[UINib nibWithNibName:cellIdebtifier bundle:Bundle] forCellReuseIdentifier:cellIdebtifier];
    }else
    {
        [tableView registerNib:[UINib nibWithNibName:cellIdebtifier bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellIdebtifier];
    }
    
    
    LPHPOPCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdebtifier forIndexPath:indexPath];
    
    if (!cell) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdebtifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *dic = self.arraySource[indexPath.row];
    
    [cell showData:dic];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.popview dismiss];
    
    if(self.popBlock)
    {
        self.popBlock(indexPath.row);
    }
    
}




@end
