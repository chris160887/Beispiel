//
//  BeispielAppDelegate.h
//  Beispiel
//
//  Created by Schuldes Christian on 21.09.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootTableViewController;

@interface BeispielAppDelegate : NSObject <UIApplicationDelegate>{
    RootTableViewController *_rootController;
    UINavigationController *_navigationController;
    UIWindow *_window;
}

@end
