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
 
 */
