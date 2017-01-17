//
//  RNFirebaseCrashReport.m
//  RNFirebaseCrashReport
//
//  Created by Ian Yu-Hsun Lin (@ianlin) on 7/6/16.
//  Copyright © 2016 Ian Yu-Hsun Lin. All rights reserved.
//

#import "RNFirebaseCrashReport.h"

#import <React/RCTBridge.h>
#import <React/RCTConvert.h>
#import <React/RCTEventDispatcher.h>
#import <React/RCTUtils.h>

@import FirebaseCrash;

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

RCT_EXPORT_METHOD(report:(NSString *)message)
{
    FIRCrashLog(message);
    assert(NO);
}

@end
