//
//  ViewController.m
//  suanfaDemo
//
//  Created by sjt on 2018/8/23.
//  Copyright © 2018年 sjt. All rights reserved.
//



#import "ViewController.h"
#import "ThreeModel.h"
@interface ViewController ()
@property (nonatomic, strong)ThreeModel * rootModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self sendArray1:@[@"1",@"3",@"2",@"5"] withArray2:@[@"2",@"1",@"3",@"",@"4",@"",@"7"]];
    
}

- (void)sendArray1:(NSArray *)array1 withArray2:(NSArray *)array2{
    ThreeModel * model1=[[ThreeModel alloc]initwithJiedian:array1[0]];
    ThreeModel * model2=[[ThreeModel alloc]initwithJiedian:array2[0]];
    for (NSInteger i=1; i<array1.count; i++) {
        [self addJiedian:array1[i] withModel:model1];
    }
    
    for (NSInteger i=1; i<array2.count; i++) {
        [self addJiedian:array2[i] withModel:model2];
    }
    
    self.rootModel=[[ThreeModel alloc]initwithJiedian:[NSString stringWithFormat:@"%ld",([model1.jiedian integerValue]+[model2.jiedian integerValue])]];
    
    [self changeLeftModel:model1.leftJiedian withRightModel:model1.rightJiedian withleftModel2:model2.leftJiedian withRightModel2:model2.rightJiedian withRootModel:_rootModel];
    
}

- (void)addJiedian:(NSString *)str withModel:(ThreeModel *)rootmodel{
    ThreeModel * model=[[ThreeModel alloc]initwithJiedian:str];
    if (str.length==0) {
        model.isStop=YES;
    }
    
    NSMutableArray * array=[NSMutableArray arrayWithCapacity:0];
    [array addObject:rootmodel];
    while (array.count) {
        ThreeModel * tempModel=[array firstObject];
        [array removeObjectAtIndex:0];
        
        if (tempModel.isStop==YES) {
            continue;
        }
        
        if (!tempModel.leftJiedian) {
            tempModel.leftJiedian=model;
            break;
        }else if (!tempModel.rightJiedian){
            tempModel.rightJiedian=model;
            break;
        }else{
            [array addObject:tempModel.leftJiedian];
            [array addObject:tempModel.rightJiedian];
        }
    }
}

- (void)changeLeftModel:(ThreeModel *)leftModel1 withRightModel:(ThreeModel *)rightModel1 withleftModel2:(ThreeModel *)leftModel2 withRightModel2:(ThreeModel *)rightModel2 withRootModel:(ThreeModel *)rootModel{
    NSInteger leftNum = 0;
    NSInteger rightNum = 0;
    if (leftModel1&&leftModel1.jiedian&&leftModel1.jiedian.length>0) {
        leftNum += [leftModel1.jiedian integerValue];
    }
    
    if (leftModel2&&leftModel2.jiedian&&leftModel2.jiedian.length>0) {
        leftNum +=[leftModel2.jiedian integerValue];
    }
    
    if (rightModel1&&rightModel1.jiedian&&rightModel1.jiedian.length>0) {
        rightNum +=[rightModel1.jiedian integerValue];
    }
    
    if (rightModel2&&rightModel2.jiedian&&rightModel2.jiedian.length>0) {
        rightNum +=[rightModel2.jiedian integerValue];
    }
    
    if (leftNum>0) {
        ThreeModel * model=[[ThreeModel alloc]initwithJiedian:[NSString stringWithFormat:@"%ld",leftNum]];
        rootModel.leftJiedian=model;
        [self changeLeftModel:leftModel1.leftJiedian withRightModel:leftModel1.rightJiedian withleftModel2:leftModel2.leftJiedian withRightModel2:leftModel2.rightJiedian withRootModel:rootModel.leftJiedian];
    }
    
    if (rightNum>0) {
        ThreeModel * model=[[ThreeModel alloc]initwithJiedian:[NSString stringWithFormat:@"%ld",rightNum]];
        rootModel.rightJiedian=model;
        
        [self changeLeftModel:rightModel1.leftJiedian withRightModel:rightModel1.rightJiedian withleftModel2:rightModel2.leftJiedian withRightModel2:rightModel2.rightJiedian withRootModel:rootModel.rightJiedian];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
