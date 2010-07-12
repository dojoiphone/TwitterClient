//
//  XmlTwitterRepository.h
//  TwitterClient
//
//  Created by Laurent Cobos on 21/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XmlTwitterRepository : NSObject<NSXMLParserDelegate> {
    NSMutableArray *tweets;
    NSMutableString *current_status;
    BOOL inTextElement;
}

@property(retain) NSString *timelineUrl;

-(NSArray *)getTweets;
-(NSArray *)parseStatusTimeline:(NSString *)xml;
-(NSString *)getTimelineFromURL:(NSString *)url;
-(id)initWithUrl:(NSString *)url;

@end
