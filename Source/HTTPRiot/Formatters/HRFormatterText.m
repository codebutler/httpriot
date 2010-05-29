//
//  HRFormatterText.m
//  HTTPRiot
//
//  Created by Eric Butler on 5/27/10.
//  Copyright 2010 Eric Butler.

#import "HRFormatterText.h"


@implementation HRFormatterText
+ (NSString *)extension {
    return @"txt";
}

+ (NSString *)mimeType {
    return @"text/plain";
}

+ (id)decode:(NSData *)data error:(NSError **)error {
    NSString *rawString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    // If we failed to decode the data using UTF8 attempt to use ASCII encoding.
    if(rawString == nil && ([data length] > 0)) {
        rawString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    }
	return [rawString autorelease];
}

+ (NSString *)encode:(id)data error:(NSError **)error {
	[NSException raise:@"Not supported" format:@"encode not supported"];
    return nil;
}

@end
