//
//  XmlTwitterRepositoryTests
//  TwitterClient
//
//  Created by Laurent Cobos on 21/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import <OCMock/OCMock.h>
#import "TwitterClientViewController.h"
#import "XmlTwitterRepository.h"

//#import "application_headers" as required


@interface XmlTwitterRepositoryTests : SenTestCase {
    
    XmlTwitterRepository *repository;

}
@end


NSArray* array(NSString *chaine) {
    return [NSArray arrayWithObjects:chaine, nil];
}


@implementation XmlTwitterRepositoryTests

-(void) setUp {
   repository = [[XmlTwitterRepository alloc] init];
}

- (void) test_parse_single_status_timeline {
    NSArray *parsed = [repository parseStatusTimeline:@"<statuses><status><text>hello</text></status></statuses>"];
    STAssertEqualObjects(parsed, array(@"hello"), nil);
}

- (void) test_parse_other_single_status_timeline {
    NSArray *parsed = [repository parseStatusTimeline:@"<statuses><status><text>world</text></status></statuses>"];
    STAssertEqualObjects(parsed, array(@"world"), nil);
}

- (void) test_parse_single_status_timeline_with_id {
    NSArray *parsed = [repository parseStatusTimeline:@"<statuses><status><id>12345</id><text>world</text></status></statuses>"];
    STAssertEqualObjects(parsed, array(@"world"), nil);
}

- (void) test_parse_other_single_status_timeline_multitextnodes {
    NSArray *parsed = [repository parseStatusTimeline:@"<statuses><status><text>wor<!-- cmt -->ld</text></status></statuses>"];
    STAssertEqualObjects(parsed, array(@"world"), nil);
}

- (void) test_get_timeline_from_URL {
    NSString *xml = [repository getTimelineFromURL:@"http://localhost/~jonathanperret/timeline.xml"];
    STAssertEqualObjects([xml substringToIndex:10], @"<?xml vers", nil);
}

- (void) test_returns_tweets {
    repository = [[XmlTwitterRepository alloc] initWithUrl:@"http://localhost/~jonathanperret/timeline.xml"];
    STAssertEqualObjects([[repository getTweets] objectAtIndex:0], @"Coding Dojo", nil);
}

@end
