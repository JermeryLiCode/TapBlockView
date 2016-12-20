//
//  ViewController.m
//  TapBlockView
//
//  Created by LiPeng on 16/12/19.
//  Copyright © 2016年 LiPeng. All rights reserved.
//

#import "ViewController.h"
#import "ViewActionGestureRecognizer.h"
#import "UIView+KeyAndData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *btnView  = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 100, 30)];
    btnView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btnView];
    btnView.viewKey = @"btnkey";
    [btnView viewAction:^(UIView *sender){
        NSLog(@"%@", sender.viewKey);
        NSLog(@"btntttttt");
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
