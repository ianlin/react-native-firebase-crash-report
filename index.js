'use strict';

var { Platform, NativeModules } = require('react-native');
const _FirebaseCrashReport = NativeModules.RNFirebaseCrashReport;

export default class FirebaseCrashReport {

    static log(message: string) {
        _FirebaseCrashReport.log(message);
    }

    static logcat(message: string, level: number = null, tag: string = null) {
        if (Platform.OS === 'ios') {
            _FirebaseCrashReport.logcat(message);
        } else if (Platform.OS === 'android') {
            level = (typeof level !== 'number') ? 3 : level; // --- default level: 3 - DEBUG
            tag = (typeof tag !== 'string') ? 'RNFirebaseCrashReport' : tag;
            _FirebaseCrashReport.logcat(level, tag, message);
        }
    }

    static report(message) {
        _FirebaseCrashReport.report(message);
    }
}
