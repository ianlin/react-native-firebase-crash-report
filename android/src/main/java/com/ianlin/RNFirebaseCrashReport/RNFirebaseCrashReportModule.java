package com.ianlin.RNFirebaseCrashReport;

import com.facebook.react.bridge.LifecycleEventListener;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import com.google.firebase.crash.FirebaseCrash;

public class RNFirebaseCrashReportModule extends ReactContextBaseJavaModule implements LifecycleEventListener {
    private final static String TAG = RNFirebaseCrashReportModule.class.getCanonicalName();

    public RNFirebaseCrashReportModule(ReactApplicationContext reactContext) {
        super(reactContext);
        reactContext.addLifecycleEventListener(this);
    }

    @Override
    public String getName() {
        return "RNFirebaseCrashReport";
    }

    @ReactMethod
    public void log(String message) {
        FirebaseCrash.log(message);
    }

    @ReactMethod
    public void logcat(int level, String tag, String message) {
        FirebaseCrash.logcat(level, tag, message);
    }

    @ReactMethod
    public void report(String message) {
        FirebaseCrash.report(new Exception(message));
    }

    @Override
    public void onHostResume() {
    }

    @Override
    public void onHostPause() {
    }

    @Override
    public void onHostDestroy() {
    }
}
