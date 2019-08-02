package plugins;

import android.util.Log;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;

public class LogPlugin {
    private static final String LOG_CHANNEL_NAME = "android_log";

    public static void registerLogger(BinaryMessenger messenger) {

        new MethodChannel(messenger, LOG_CHANNEL_NAME).setMethodCallHandler(new MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                String tag = methodCall.argument("tag");
                String msg = methodCall.argument("msg");
                switch (methodCall.method) {
                    case "logV":
                        Log.v(tag, msg);
                        break;
                    case "logD":
                        Log.d(tag, msg);
                        break;
                    case "logI":
                        Log.i(tag, msg);
                        break;
                    case "logW":
                        Log.w(tag, msg);
                        break;
                    case "logE":
                        Log.e(tag, msg);
                        break;
                    default:
                        Log.d(tag, msg);
                        break;
                }
            }
        });


    }

}
