//
//  TwitterClientViewController.h
//  TwitterClient
//
//  Created by Laurent Cobos on 17/05/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TwitterRepository;

@interface TwitterClientViewController : UIViewController<UITableViewDataSource> {
@private
	UITableView *_tableView;
	NSArray *_tweets;
	id<TwitterRepository> _repository;
}

@property(nonatomic, retain) IBOutlet UITableView *tableView;
@property(nonatomic, retain) NSArray *tweets;
@property(nonatomic, retain) id<TwitterRepository> repository;

@end

