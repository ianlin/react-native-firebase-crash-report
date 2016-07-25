//
//  RNFirebaseCrashReport.m
//  RNFirebaseCrashReport
//
//  Created by Ian Yu-Hsun Lin (@ianlin) on 7/6/16.
//  Copyright © 2016 Ian Yu-Hsun Lin. All rights reserved.
//

#import "RNFirebaseCrashReport.h"

#import "RCTBridge.h"
#import "RCTConvert.h"
#import "RCTEventDispatcher.h"
#import "RCTUtils.h"

#import "Firebase.h";

@implementation RNFirebaseCrashReport

RCT_EXPORT_MODULE()

@synthesize bridge = _bridge;

RCT_EXPORT_METHOD(log:(NSString *)message)
{
    FIRCrashLog(message);
}

RCT_EXPORT_METHOD(logcat:(NSString *)message)
{
    FIRCrashNSLog(message);
}

@end
