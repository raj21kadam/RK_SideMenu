//
//  SideMenuManager.m
//  RK_SideMenu
//
//  Created by Raj on 04/06/15.
//  Copyright (c) 2015 Raj Kadam. All rights reserved.
//

#import "SideMenuManager.h"
#import "AppDelegate.h"
#import "Gallery_VC.h"
#import "ViewController.h"
@interface SideMenuManager (){
    UIButton *hideButton;
    BOOL flag;
}
@property(nonatomic,readwrite) BOOL menuShown;
@end


@implementation SideMenuManager

@synthesize view,currentView;

#pragma mark Singleton Methods

+ (instancetype)sharedManager {
    static SideMenuManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype)init {
    if (self = [super init]) {
        UINib *nib = [UINib nibWithNibName:@"SideMenuManager" bundle:nil];
        UIView *viewFromNib = [[nib instantiateWithOwner:self options:nil] objectAtIndex:0];
        self.view=viewFromNib;
        
        CGRect screenBounds = [[UIScreen mainScreen] bounds];

        hideButton = [[UIButton alloc] initWithFrame:screenBounds];
        [hideButton addTarget:self action:@selector(hideMenu) forControlEvents:UIControlEventTouchUpInside];
        [hideButton setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}
-(void)hideMenu{
    UIWindow *window= [(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
    UIView *windowView=window.rootViewController.view;
    
    CGRect windowFrame=windowView.frame;
    windowFrame.origin.x=0.0;
    
    CGRect menuFrame=self.view.frame;
    if (flag) {
        menuFrame.origin.x= -menuFrame.size.width;
    }else
    menuFrame.origin.x= windowFrame.size.width;//-menuFrame.size.width;
    [UIView animateWithDuration:.5
                     animations:^{
                         [currentView setFrame:windowFrame];
                         [windowView setFrame:windowFrame];
                         [self.view setFrame:menuFrame];
                     }
                     completion:^(BOOL finished){
                         [hideButton removeFromSuperview];
                         [self.view removeFromSuperview];
                         _menuShown=NO;
                     }];


}

-(void)showMenu:(BOOL)is_from_left
{
    if (_menuShown)
    {
        return;
    }
    //currentView = current_view;
    
    flag = is_from_left;
    UIWindow *window= [(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
    UIView *windowView=window.rootViewController.view;
    
    CGRect windowFrame=windowView.frame;
    if (is_from_left) {
        
    }else
    windowFrame.origin.x= -self.view.frame.size.width;
    
    //CGRect bounds = self.view.bounds;
    
    CGRect menuFrame=self.view.frame;
    menuFrame.size.height=windowFrame.size.height;
    if (is_from_left) {
        menuFrame.origin.x= -menuFrame.size.width;
    }else
    menuFrame.origin.x= windowFrame.size.width;//-menuFrame.size.width;
    
    [self.view setFrame:menuFrame];
    [window addSubview:self.view];
    
    if (is_from_left) {
        menuFrame.origin.x=0.0;
    }else
    menuFrame.origin.x=windowFrame.size.width - self.view.frame.size.width;//0.0;
    
    [hideButton setFrame:windowFrame];
    [window addSubview:hideButton];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.8f;
    transition.type = kCATransitionFade;
    //    transition.subtype = kCATransitionPush;
    [currentView.window.layer addAnimation:transition forKey:kCATransition];
    
    [UIView animateWithDuration:.5 animations:^{
      
        //[current_view setFrame:windowFrame];
        [windowView setFrame:windowFrame];
        [self.view setFrame:menuFrame];
    } completion:^(BOOL finished) {
        
    }];

}

-(void)showMenu:(UIView*)current_view fromWhere:(BOOL)is_from_left
{
    if (_menuShown)
    {
        return;
    }
    currentView = current_view;
    
    flag = is_from_left;
    UIWindow *window= [(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
    UIView *windowView=window.rootViewController.view;
    
    CGRect windowFrame=windowView.frame;
    if (is_from_left) {
        
    }else
        windowFrame.origin.x= -self.view.frame.size.width;
    
    //CGRect bounds = self.view.bounds;
    
    CGRect menuFrame=self.view.frame;
    menuFrame.size.height=windowFrame.size.height;
    if (is_from_left) {
        menuFrame.origin.x= -menuFrame.size.width;
    }else
        menuFrame.origin.x= windowFrame.size.width;//-menuFrame.size.width;
    
    [self.view setFrame:menuFrame];
    [window addSubview:self.view];
    
    if (is_from_left) {
        menuFrame.origin.x=0.0;
    }else
        menuFrame.origin.x=windowFrame.size.width - self.view.frame.size.width;//0.0;
    
    [hideButton setFrame:windowFrame];
    [window addSubview:hideButton];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.8f;
    transition.type = kCATransitionFade;
    //    transition.subtype = kCATransitionPush;
    [currentView.window.layer addAnimation:transition forKey:kCATransition];
    
    [UIView animateWithDuration:.5 animations:^{
        
        [current_view setFrame:windowFrame];
        [windowView setFrame:windowFrame];
        [self.view setFrame:menuFrame];
    } completion:^(BOOL finished) {
        
    }];
    
}


-(IBAction)btnGalleryClick:(UIButton*)sender {
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.8f;
    transition.type = kCATransitionFade;
    //    transition.subtype = kCATransitionPush;
    [self.view.window.layer addAnimation:transition forKey:kCATransition];

    
    AppDelegate *app = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    Gallery_VC *moveToVC=[[Gallery_VC alloc] initWithNibName:@"Gallery_VC" bundle:nil];
    [app.window setRootViewController: moveToVC];
    [app.window makeKeyAndVisible];
    
    [self.view removeFromSuperview];
    
}


-(IBAction)btnHomeClicked:(id)sender {
 
    
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.8f;
    transition.type = kCATransitionFade;
//    transition.subtype = kCATransitionPush;
     [self.view.window.layer addAnimation:transition forKey:kCATransition];
    
     ViewController*home_view = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    AppDelegate *app = (AppDelegate *) [[UIApplication sharedApplication] delegate];
  
    [app.window setRootViewController: home_view];
    [app.window makeKeyAndVisible];

     [self.view removeFromSuperview];
   
    
    
}


- (void)dealloc {
}


@end
