//
//  ViewController.m
//  testpod
//
//  Created by DerrickMac on 2024/1/26.
//

#import "ViewController.h"
#import "BaseVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BaseVC *vc = [[BaseVC alloc] init];
    [self.view addSubview:vc.view];
    vc.view.frame = self.view.frame;
}


@end
