//
//  TwitterClientAppDelegate.h
//  TwitterClient
//
//  Created by Laurent Cobos on 17/05/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TwitterClientViewController;

@interface TwitterClientAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TwitterClientViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TwitterClientViewController *viewController;

@end

