//
//  XmlTwitterRepositoryTests
//  TwitterClient
//
//  Created by Laurent Cobos on 21/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GTMSenTestCase.h"
#import <UIKit/UIKit.h>
#import <OCMock/OCMock.h>
#import "TwitterClientViewController.h"
#import "XmlTwitterRepository.h"

//#import "application_headers" as required


@interface XmlTwitterRepositoryTests : GTMTestCase {

}
@end

@implementation XmlTwitterRepositoryTests

- (void) test_returns_tweets {
    XmlTwitterRepository *repository = [[XmlTwitterRepository alloc] init];
    NSArray *expected = [NSArray arrayWithObjects:@"a", nil];
    STAssertEqualObjects([repository getTweets], expected, nil);
}

- (void) test_parse_single_status_timeline {
    XmlTwitterRepository *repository = [[XmlTwitterRepository alloc] init];
    NSArray *expected = [NSArray arrayWithObjects:@"hello", nil];
    NSArray *parsed = [repository parseStatusTimeline:@"<statuses><status><text>hello</text></status></statuses>"];
    STAssertEqualObjects(parsed, expected, nil);
}

- (void) test_parse_other_single_status_timeline {
    XmlTwitterRepository *repository = [[XmlTwitterRepository alloc] init];
    NSArray *expected = [NSArray arrayWithObjects:@"world", nil];
    NSArray *parsed = [repository parseStatusTimeline:@"<statuses><status><text>world</text></status></statuses>"];
    STAssertEqualObjects(parsed, expected, nil);
}

@end
