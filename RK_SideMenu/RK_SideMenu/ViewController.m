//
//  ViewController.m
//  RK_SideMenu
//
//  Created by Raj on 04/06/15.
//  Copyright (c) 2015 Raj Kadam. All rights reserved.
//

#import "ViewController.h"
#import "SideMenuManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)leftMenuClicked:(id)sender {
    
    [[SideMenuManager sharedManager] showMenu:YES];
}

- (IBAction)rightMenuClicked:(id)sender {
    
    [[SideMenuManager sharedManager] showMenu:NO];
}
@end
