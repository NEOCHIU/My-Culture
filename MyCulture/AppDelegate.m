//
//  AppDelegate.m
//  MyCulture
//
//  Created by CosenMac on 2015/8/26.
//  Copyright (c) 2015年 CosenMac. All rights reserved.
//

#import "AppDelegate.h"
#import "CultureCategoryViewController.h"
#import "CultureMapViewController.h"
#import "CultureTypeViewController.h"
#import "CultureDetailViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //2.生成ViewController
    CultureCategoryViewController *culGatVC = [[CultureCategoryViewController alloc] initWithNibName:@"CultureCategoryViewController" bundle:nil];
    
    CultureMapViewController *culMapVC = [[CultureMapViewController alloc] initWithNibName:@"CultureMapViewController" bundle:nil];
    
    CultureTypeViewController *culTypeVC = [[CultureTypeViewController alloc] initWithNibName:@"CultureTypeViewController" bundle:nil];
    
    CultureDetailViewController *culDetailVC = [[CultureDetailViewController alloc] initWithNibName:@"CultureDetailViewController" bundle:nil];
  
    
    //3.是各個ViewController是否需要NavigationBar，若要，此時幫需要的ViewController生成NavigationController，這邊我假設cutVC不需要Navigation
    UINavigationController *navCulGat = [[UINavigationController alloc] initWithRootViewController:culGatVC];
    UINavigationController *navCulMap = [[UINavigationController alloc] initWithRootViewController:culMapVC];
    UINavigationController *navCulType= [[UINavigationController alloc] initWithRootViewController:culTypeVC];
    
    //4.生成tabBarController，並將上面生好的View放到tabbarcontroller的viewcontrollers陣列中，這邊要注意的是視圖是一層包一層，由後製前是window-->TabBar-->Navigation-->View這樣的順序，最後再把tabBarController指定為self.window.rootViewController
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[navCulGat,navCulMap]; //同4.所說，這邊放進來的有navigation的就放navigation，不需要navigation的直接放那個ViewController
    
    //5.設定tabBarItem圖片
    [navCulGat.tabBarItem setImage:[[UIImage imageNamed:@"culCat_bar_icon_a.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navCulGat.tabBarItem setSelectedImage:[[UIImage imageNamed:@"culCat_bar_icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navCulMap.tabBarItem setImage:[[UIImage imageNamed:@"culMap_bar_icon_a.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navCulMap.tabBarItem setSelectedImage:[[UIImage imageNamed:@"culMap_bar_icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //設定Title
    [navCulGat.tabBarItem setTitle:@"類別"];
    [navCulMap.tabBarItem setTitle:@"地圖"];
    self.window.rootViewController = tabBarController;
    return YES;
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
