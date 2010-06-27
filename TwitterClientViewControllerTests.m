
#import "GTMSenTestCase.h"
#import <UIKit/UIKit.h>
#import <OCMock/OCMock.h>
#import "TwitterClientViewController.h"
#import "TwitterRepository.h"

//#import "application_headers" as required


@interface TwitterClientViewControllerTests : GTMTestCase {
	TwitterClientViewController *twitterClientViewController;	
}
@end

@implementation TwitterClientViewControllerTests

- (void) setUp {
	twitterClientViewController = [[TwitterClientViewController alloc] init];	
}

- (void) tearDown {
	[twitterClientViewController release];
}

- (void)test_number_of_rows_is_number_of_tweets {
 	NSMutableArray *tweets = [NSMutableArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",nil];
	twitterClientViewController.tweets = tweets;

	STAssertEquals(5, [twitterClientViewController tableView:nil numberOfRowsInSection:0], @"");
	
	[tweets addObject:@"f"];
	
	STAssertEquals(6, [twitterClientViewController tableView:nil numberOfRowsInSection:0], @"");
}

- (void)test_a_cell_contains_a_tweet {
	twitterClientViewController.tweets = [NSMutableArray arrayWithObjects:@"a",@"b",nil];
	
	UITableView* tableView = [[UITableView alloc] init];
		
	UITableViewCell *firstCell = [twitterClientViewController tableView:(UITableView *)tableView 
												  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	UITableViewCell *secondCell = [twitterClientViewController tableView:(UITableView *)tableView 
												  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];	
    STAssertEqualObjects(firstCell.textLabel.text, @"a", nil);
	STAssertEqualObjects(secondCell.textLabel.text, @"b", nil);	
}

- (void)test_request_tweets_on_load {
	OCMockObject *twitterRepository = [OCMockObject mockForProtocol:@protocol(TwitterRepository)];
	[[[twitterRepository stub] andReturn:[NSArray arrayWithObjects:@"a", nil]] getTweets];
	twitterClientViewController.repository = (id<TwitterRepository>)twitterRepository;
	
	[twitterClientViewController viewDidLoad];
	
	STAssertEqualObjects([twitterClientViewController.tweets objectAtIndex:0], @"a", nil);	
}

@end
