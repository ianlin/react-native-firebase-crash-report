'use strict';

var { Platform, NativeModules } = require('react-native');
const _FirebaseCrashReport = NativeModules.RNFirebaseCrashReport;

export default class FirebaseCrashReport {
    static log(message) {
        _FirebaseCrashReport.log(message);
    }

    static logcat(message, level = null, tag = null) {
        if (Platform.OS === 'ios') {
            _FirebaseCrashReport.logcat(message);
        } else if (Platform.OS === 'android') {
            if (level === null) {
                // set level to DEBUG
                level = 3;
            }

            if (tag === null) {
                tag = 'RNFirebaseCrashReport'
            }

            _FirebaseCrashReport.logcat(level, tag, message);
        }
    }

    static report(message) {
        if (Platform.OS === 'android') {
            _FirebaseCrashReport.report(message);
        } else {
        }
    }
}
