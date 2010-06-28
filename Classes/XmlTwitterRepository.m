//
//  XmlTwitterRepository.m
//  TwitterClient
//
//  Created by Laurent Cobos on 21/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "XmlTwitterRepository.h"


@implementation XmlTwitterRepository

-(NSArray *)getTweets {
	return [NSArray arrayWithObject:@"a"];
}

-(NSArray *)parseStatusTimeline:(NSString *)xml {
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:[xml dataUsingEncoding:NSUTF8StringEncoding]];
    [parser setDelegate:self];
    tweets = [[NSMutableArray alloc] init];
    [parser parse];
    return tweets;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    [tweets addObject:string];
}

@end
