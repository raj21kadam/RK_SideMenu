//
//  Gallery_VC.m
//  RK_SideMenu
//
//  Created by Raj on 04/06/15.
//  Copyright (c) 2015 Raj Kadam. All rights reserved.
//

#import "Gallery_VC.h"
#import "SideMenuManager.h"
@interface Gallery_VC ()

@end

@implementation Gallery_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)rightMenuClicked:(id)sender {
    
    [[SideMenuManager sharedManager] showMenu:NO];
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
