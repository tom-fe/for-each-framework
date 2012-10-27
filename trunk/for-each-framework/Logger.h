//
//  Logger.h
//  for-each-framework
//
//  Created by Tom Winter on 01/05/12.
//  Copyright (c) 2012 for-each. All rights reserved.
//

// ALL Log - it will be shown in all build modes
#define ALog(format, ...) CustomLog(__PRETTY_FUNCTION__, __LINE__,format,##__VA_ARGS__);

// Debug Log - will be shown only in debug builds
#ifdef DEBUG
    #define DLog(format,...) CustomLog(__PRETTY_FUNCTION__, __LINE__,format,##__VA_ARGS__);
#else
    #define DLog(...)
#endif

#import <Foundation/Foundation.h>

@interface Logger : NSObject

void CustomLog(const char *functionName, int lineNumber, NSString *format,...);

@end
