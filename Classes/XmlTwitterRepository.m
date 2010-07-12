//
//  XmlTwitterRepository.m
//  TwitterClient
//
//  Created by Laurent Cobos on 21/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "XmlTwitterRepository.h"


@implementation XmlTwitterRepository

@synthesize timelineUrl;

- (id) initWithUrl:(NSString *)url
{
    self = [super init];
    if (self != nil) {
        inTextElement = NO;
        current_status = nil;
        self.timelineUrl = url;
    }
    return self;
}

-(NSArray *)getTweets {
    NSString *xmlFromTwitter = [self getTimelineFromURL:self.timelineUrl];
	return [self parseStatusTimeline:xmlFromTwitter];
}

-(NSArray *)parseStatusTimeline:(NSString *)xml {
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:[xml dataUsingEncoding:NSUTF8StringEncoding]];
    [parser setDelegate:self];
    tweets = [[NSMutableArray alloc] init];
    [parser parse];
    return tweets;
}

-(NSString *) getTimelineFromURL:(NSString *) url {
    NSURL *nsUrl = [NSURL URLWithString:url];
    return [NSString stringWithContentsOfURL:nsUrl encoding:NSUTF8StringEncoding error:nil];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"text"]) {
        inTextElement = YES;
        current_status = [[NSMutableString alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"text"]) {
        inTextElement = NO;
        [tweets addObject:current_status];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (inTextElement) {
        [current_status appendString:string];
    }
}
@end
