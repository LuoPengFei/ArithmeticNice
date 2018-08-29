//
//  ViewController.m
//  suanfaDemo
//
//  Created by sjt on 2018/8/23.
//  Copyright © 2018年 sjt. All rights reserved.
//



#import "ViewController.h"
#import "TwoViewController.h"
#define LastUrlCount 6
@interface ViewController ()
@property (nonatomic ,copy)NSString * headStr;
@property (nonatomic ,strong)NSMutableDictionary * dic;
@property (nonatomic ,strong)NSMutableArray * suijiArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headStr=@"http://tinyurl.com/";
    NSString * tostr=@"https://leetcode.com/problems/design-tinyurl";
    NSString * returnStr=[self toEncode:tostr];
    NSString * endStr=[self toDencode:returnStr];
    NSLog(@"%@ - %@",returnStr,endStr);
    
}

- (NSMutableArray *)suijiArray {
    if (!_suijiArray) {
        _suijiArray=[NSMutableArray arrayWithCapacity:0];
        
        for (NSInteger i=0; i<26; i++) {
            char hh='A'+i;
            char zz = 'a'+i;
            NSInteger index= i;
            [_suijiArray addObject:[NSString stringWithFormat:@"%c",hh]];
            [_suijiArray addObject:[NSString stringWithFormat:@"%c",zz]];
            if (i<10) {
                [_suijiArray addObject:[NSString stringWithFormat:@"%ld",index]];
            }
        }
    }
    return _suijiArray;
}

- (NSMutableDictionary *)dic
{
    if (!_dic) {
        _dic=[NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _dic;
}

- (NSString *)toEncode:(NSString *)str{
    //先判断 str 是否存在
    if([[self.dic allKeys] containsObject:str]) {
        return [self.dic objectForKey:str];
    }else{
        NSString * someStr=[self retbitString];
        NSString * end = [NSString stringWithFormat:@"%@%@",self.headStr,someStr];
        [self.dic setObject:someStr forKey:str];
        return end;
    }
}

// 此方法随机字符串， 修改代码红色数字可以改变 随机产生的位数。
- (NSString *)retbitString
{
    NSString *string = [[NSString alloc]init];
    for (int i =0; i<LastUrlCount; i++) {
        int x =arc4random() % self.suijiArray.count;
        NSString *tempString = [NSString stringWithFormat:@"%@", self.suijiArray[x]];
        string = [string stringByAppendingString:tempString];
        
    }
    return string;
}

- (NSString *)toDencode:(NSString *)str{
    
    NSString * end = [str substringWithRange:NSMakeRange(str.length-LastUrlCount, LastUrlCount)];
    //得到数据
    
    for (NSString * key in [self.dic allKeys]) {
        NSString * value=[self.dic objectForKey:key];
        if ([value isEqualToString:end]) {
            return key;
        }
    }
    return @"";
}

@end




