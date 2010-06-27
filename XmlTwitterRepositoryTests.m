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
    NSArray *expected =[NSArray arrayWithObjects:@"a", nil];
    STAssertEqualObjects([repository getTweets], expected, nil);
	STFail(@"TODO");
}

@end
