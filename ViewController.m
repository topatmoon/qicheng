//
//  ViewController.m
//  nn
//
//  Created by moon on 2018/3/16.
//  Copyright © 2018年 moon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@property(nonatomic , strong) UITextField *searchTextField;
@property(nonatomic , strong) NSMutableArray *strArray;
@property(nonatomic , strong) UILabel *strLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.strArray = [NSMutableArray array];
    self.searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, 200, 70)];
    self.searchTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.searchTextField.delegate = self;
    self.searchTextField.placeholder = @"输入";
    self.searchTextField.returnKeyType = UIReturnKeyGo;
    self.searchTextField.backgroundColor = [UIColor lightGrayColor];
    self.searchTextField.textColor = [UIColor redColor];
    self.searchTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.searchTextField.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.searchTextField];
    
    self.strLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, 400, 400)];
    self.strLabel.numberOfLines = 0;
    self.strLabel.textColor = [UIColor redColor];
    self.strLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.strLabel];
//    UIButton *test = [UIButton buttonWithType:UIButtonTypeCustom];
//    test.frame = CGRectMake(20, 200, 200, 40);
//    test.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:test];
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    textField.text = @"";
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_strArray removeAllObjects];
    [textField resignFirstResponder];
    BOOL isN = [self isNWithNum:-1];
    if (isN) {
        NSLog(@"1");
    }else{
        for (int i = 0; i < 10; i ++) {
            BOOL isNN = [self isNWithNum:i];
            if (isNN) {
                NSLog(@"01");
            }else{
                NSLog(@"00");
            }
        }
    }
    
    NSMutableString *ms = [NSMutableString string];
    for (NSString *str in _strArray) {
        [ms appendFormat:str];
    }
    self.strLabel.text = ms;
    return YES;
}

- (BOOL)isNWithNum:(NSInteger)num{
    NSString *numStr = self.searchTextField.text;
    NSMutableArray *numArray = [NSMutableArray array];
    for (int i = 0; i < numStr.length; i++) {
        [numArray addObject:[numStr substringWithRange:NSMakeRange(i, 1)]];
    }
    if (num >= 0) {
        [numArray addObject:[NSString stringWithFormat:@"%zd",num]];
    }
    NSInteger count = numArray.count;
    for (int i = 0; i < count-2; i++) {
        for (int j = (i + 1); j < count-1; j++) {
            for (int k = (j + 1); k < count; k++) {
                NSString *iStr = numArray[i];
                NSString *jStr = numArray[j];
                NSString *kStr = numArray[k];
                int m = (iStr.intValue + jStr.intValue + kStr.intValue);
                if (m%10 == 0) {
                    int ss = 0;
                    for (NSString *s in numArray) {
                        ss = ss + s.intValue;
                    }
                    ss = ss%10;
                    NSString *sss = [NSString stringWithFormat:@"%zd",ss];
                    if (count == 4) {
                        [_strArray addObject:[NSString stringWithFormat:@"百分百有    牛%@     百分之30   ***********************",sss]];
                    }else{
                        [_strArray addObject:[NSString stringWithFormat:@"抓%zd有   牛%@     百分之%@ %@\n",num,sss,(num>0)?@"7.7":@"30",(ss>6||ss==0)?@"***************":@""]];
                    }
                    return YES;
                }
            }
        }
    }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
