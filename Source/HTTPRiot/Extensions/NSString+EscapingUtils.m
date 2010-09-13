#import "NSString+EscapingUtils.h"

@implementation NSString (EscapingUtils)
- (NSString *)stringByPreparingForURL {
	NSString *escapedString = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
																				  (CFStringRef)self,
																				  NULL,
																				  (CFStringRef)@":/?=,!$&'()*+;[]@#",
																				  CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
	
	NSString *copy = [NSString stringWithString:escapedString];
	CFRelease(escapedString);
	
	return copy;
}
@end
