//
//  ViewController.m
//  GridBackgroundView
//
//  Created by 王叶庆 on 15/10/25.
//  Copyright © 2015年 王叶庆. All rights reserved.
//

#import "ViewController.h"
#import "GridBackgroundView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet GridBackgroundView *gbView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.gbView.lineColor = [UIColor redColor];
//    self.gbView.edgeLine = GBEdgeLineMake(YES, YES, YES, YES);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
