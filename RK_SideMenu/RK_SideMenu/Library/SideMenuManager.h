//
//  SideMenuManager.h
//  RK_SideMenu
//
//  Created by Raj on 04/06/15.
//  Copyright (c) 2015 Raj Kadam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface SideMenuManager : NSObject {
    UIView *view;
    
    UIView*currentView;
    
}

@property (weak, nonatomic) IBOutlet UIButton *btnHome;
@property (weak, nonatomic) IBOutlet UIButton *btnGallery;
@property (weak, nonatomic) IBOutlet UIButton *btnContactUs;
@property (weak, nonatomic) IBOutlet UIButton *btnAboutUs;

@property (weak, nonatomic) IBOutlet UIButton *btnHome_overlay;
@property (weak, nonatomic) IBOutlet UIButton *btnGallery_overlay;
@property (weak, nonatomic) IBOutlet UIButton *btnContactUs_overLay;
@property (weak, nonatomic) IBOutlet UIButton *btnAboutUs_overLay;

@property(nonatomic,strong) UIView *view;
@property(nonatomic,strong) UIView *currentView;

+ (instancetype)sharedManager;
-(void)showMenu:(UIView*)current_view fromWhere:(BOOL)is_from_left;
-(void)showMenu:(BOOL)is_from_left;
-(void)hideMenu;



@end