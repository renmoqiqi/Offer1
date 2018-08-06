//
//  ViewController.m
//  二维数组中的查找
//
//  Created by penghe on 2018/8/6.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 初始化作为列的数组，它有4个元素，我们可以把它看做4列
    NSMutableArray *myColumnArray = [[NSMutableArray alloc]initWithCapacity:4];
    
    // 初始化4个一维数组，每个一维数组有4个元素，我们可以把它看做1行4列，4行加起来就是4行4列
    NSMutableArray *myRowArray1 = [[NSMutableArray alloc]initWithCapacity:4];
    NSMutableArray *myRowArray2 = [[NSMutableArray alloc]initWithCapacity:4];
    NSMutableArray *myRowArray3 = [[NSMutableArray alloc]initWithCapacity:4];
    NSMutableArray *myRowArray4 = [[NSMutableArray alloc]initWithCapacity:4];
    
    // 每个行依次增加数组元素
    // 第一行
    [myRowArray1 addObject:@"11"];
    [myRowArray1 addObject:@"12"];
    [myRowArray1 addObject:@"13"];
    [myRowArray1 addObject:@"14"];
    
    // 第二行
    [myRowArray2 addObject:@"21"];
    [myRowArray2 addObject:@"22"];
    [myRowArray2 addObject:@"23"];
    [myRowArray2 addObject:@"24"];
    
    // 第三行
    [myRowArray3 addObject:@"31"];
    [myRowArray3 addObject:@"32"];
    [myRowArray3 addObject:@"33"];
    [myRowArray3 addObject:@"34"];
    
    // 第四行
    [myRowArray4 addObject:@"41"];
    [myRowArray4 addObject:@"42"];
    [myRowArray4 addObject:@"43"];
    [myRowArray4 addObject:@"44"];
    
    // 以这4个一维数组作为列数组的元素，依次加入
    [myColumnArray addObject:myRowArray1];
    [myColumnArray addObject:myRowArray2];
    [myColumnArray addObject:myRowArray3];
    [myColumnArray addObject:myRowArray4];
    
    // 分别打印数组 myRowArray1~2 和 myColumnArray 的内容
    NSLog(@"myRowArray1: %@", myRowArray1);
    NSLog(@"myRowArray2: %@", myRowArray2);
    
    NSLog(@"myColumnArray: %@", myColumnArray);
    
    [self findSomeObjInArray:myColumnArray target:33];
    
}
//从右上角开始
- (BOOL)findSomeObjInArray:(NSMutableArray *)array target:(int)target
{
    BOOL find = NO;
    NSInteger row = array.count;
    NSMutableArray *tempArray = array[0];
    NSInteger col = tempArray.count;
    
    //  我们从右上角的元素找起来
    //  如果查找的元素比当前位置元素小, 就向左走
    //  如果查找的元素比当前位置元素大, 就向下走
    for (NSInteger i = 0, j = col - 1; (i>=0 && i<row) && (j>=0 && j<col);)
    {
        NSMutableArray *targetRowArray = array[i];
        int targetColObj = [targetRowArray[j] intValue];
        if(target == targetColObj)
        {
            
            find = YES;
            break;
        }
        else if(target < targetColObj) // 小的元素在当前位置左侧 turn left
        {

            
            j--;
        }
        else                           //turn down
        {

            i++;
        }

    }
    return find;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
