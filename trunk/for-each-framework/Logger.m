//
//  Logger.m
//  for-each-framework
//
//  Created by Tom Winter on 01/05/12.
//  Copyright (c) 2012 for-each. All rights reserved.
//

#import "Logger.h"

static NSDateFormatter* dateFormat;

@implementation Logger

void CustomLog(const char *functionName, int lineNumber, NSString *format,...)
{
    // C code to collect the ... arguements
    va_list ap;
    va_start (ap, format);
    
    // Add newline to the end of the log record if it doesn't include one inside
    if (![format hasSuffix: @"\n"]) {
        format = [format stringByAppendingString: @"\n"];
    }
    
    // This will hold the information given by the args
    NSString *body =  [[NSString alloc] initWithFormat: format arguments: ap];
    
    // No need of the arguments anymore
    va_end (ap);
    
    if (dateFormat == nil)
    {
        dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"hh:mm:ss.SSS"];
    }
    
    // Format to have only the information we need - Date with the time + milliseconds we want
    NSDate *today = [NSDate date];
    NSString *dateString = [dateFormat stringFromDate:today];
    
    
    // Print by the custom format
    fprintf(stderr,"%s : %s [line %d] -> %s",[dateString UTF8String],functionName,lineNumber,[body UTF8String]);
}

@end
