//
//  ViewController.m
//  customLabel
//
//  Created by 灵智创优001 on 17/5/26.
//  Copyright © 2017年 WLin. All rights reserved.
//

#import "ViewController.h"
#import "CustomLabelView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    
    NSArray *titles = @[@"语文书",@"小马是个大逗逼",@"端午节快乐",@"我与僵尸有个约会DVD版",@"说好的。。。呢",@"干什么啊",@"智商堪忧",@"逗逼",@"我们要去旅游去了你去吗",@"我不去你去吧",@"哎真是的",@"你说啊为什么啊",@"不去拉倒",@"真是的"];
    
  CustomLabelView *labelView = [[ CustomLabelView alloc] initWithTitles:titles isSelectMore:YES];
    
    labelView.frame = CGRectMake( 0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    labelView.ReturnSelectLabelTitles = ^(NSArray * labelTitles){
        
        NSLog(@"%@",labelTitles);
    };
   
    [self.view addSubview:labelView];
    
   

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
