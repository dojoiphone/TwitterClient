//
//  TwitterClientViewController.h
//  TwitterClient
//
//  Created by Laurent Cobos on 17/05/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XmlTwitterRepository.h"

@interface TwitterClientViewController : UIViewController<UITableViewDataSource> {
@private
	UITableView *_tableView;
	NSArray *_tweets;
	XmlTwitterRepository *_repository;
}

@property(nonatomic, retain) IBOutlet UITableView *tableView;
@property(nonatomic, retain) NSArray *tweets;
@property(nonatomic, retain) XmlTwitterRepository *repository;

@end

