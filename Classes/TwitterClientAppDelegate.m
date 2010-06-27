//
//  TwitterClientAppDelegate.m
//  TwitterClient
//
//  Created by Laurent Cobos on 17/05/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TwitterClientAppDelegate.h"
#import "TwitterClientViewController.h"

@implementation TwitterClientAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
