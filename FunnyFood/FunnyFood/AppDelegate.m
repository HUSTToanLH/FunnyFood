//
//  AppDelegate.m
//  FunnyFood
//
//  Created by TaiND on 10/29/15.
//  Copyright (c) 2015 ToanLH. All rights reserved.
//

#import "AppDelegate.h"
#import "MainScreenVC.h"
#import "SaleOffVC.h"
#import "AddressVC.h"
#import "AboutVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CGSize size = CGSizeMake(30, 30);
    
    MainScreenVC *mainVC = [[MainScreenVC alloc] initWithNibName:@"MainScreenVC" bundle:nil];
    mainVC.title = @"Drink";
    UINavigationController *naviMain = [[UINavigationController alloc] initWithRootViewController:mainVC];
    naviMain.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Drink"
                                                        image:[self imageWithName:@"drink" scaledToSize:size]
                                                selectedImage:[self imageWithName:@"drink_active" scaledToSize:size]];
    
    SaleOffVC *saleVC = [SaleOffVC new];
    saleVC.title = @"Sale Off";
    UINavigationController *naviSale = [[UINavigationController alloc] initWithRootViewController:saleVC];
    [naviSale.tabBarItem setTitle:@"Sale Off"];
    [naviSale.tabBarItem setImage:[self imageWithName:@"sale" scaledToSize:size]];
    [naviSale.tabBarItem setSelectedImage:[self imageWithName:@"sale_active" scaledToSize:size]];
    
    AddressVC *addressVC = [AddressVC new];
    addressVC.title = @"Address";
    UINavigationController *naviAddress = [[UINavigationController alloc] initWithRootViewController:addressVC];
    [naviAddress.tabBarItem setTitle:@"Address"];
    [naviAddress.tabBarItem setImage:[self imageWithName:@"location" scaledToSize:size]];
    [naviAddress.tabBarItem setSelectedImage:[self imageWithName:@"location_active" scaledToSize:size]];
    
    AboutVC *aboutVC = [AboutVC new];
    aboutVC.title = @"About";
    UINavigationController *naviAbout = [[UINavigationController alloc] initWithRootViewController:aboutVC];
    [naviAbout.tabBarItem setTitle:@"About"];
    [naviAbout.tabBarItem setImage:[self imageWithName:@"information" scaledToSize:size]];
    [naviAbout.tabBarItem setSelectedImage:[self imageWithName:@"information_active" scaledToSize:size]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[naviMain, naviSale, naviAddress, naviAbout];
    
    //tabbar
//    tabBarController.tabBar.tintColor = [UIColor whiteColor];
    tabBarController.tabBar.barStyle = UIBarStyleDefault;
    tabBarController.tabBar.translucent = YES;
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:1 green:1 blue:1 alpha:1]} forState:UIControlStateSelected];
    
    //font
    NSShadow *shadow = [NSShadow new];
    shadow.shadowColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor darkGrayColor],NSForegroundColorAttributeName,shadow,NSShadowAttributeName,[UIFont fontWithName:@"Arial-Bold" size:22],NSFontAttributeName, nil]];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setTranslucent:YES];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];

    return YES;
}

- (UIImage *)imageWithName:(NSString *)name scaledToSize:(CGSize)newSize {
    UIImage *image = [UIImage imageNamed:name];
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
