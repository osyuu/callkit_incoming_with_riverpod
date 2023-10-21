
import 'dart:convert';

import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_test/calling_keeper.dart';
import 'package:riverpod_test/calling_keepers_provider.dart';

part 'callkit_incoming_provider.g.dart';

class CallkitIncoming {
  // const CallkitIncoming();

  // final CallkitIncomingRef ref;

  Future<void> showCallkitIncoming(String uuid) async {
    FlutterCallkitIncoming.requestNotificationPermission({
      "rationaleMessagePermission": "Notification permission is required, to show notification.",
      "postNotificationMessageRequired": "Notification permission is required, Please allow notification permission from setting."
    }).then((value) => print('requestNotificationPermission'));
    final params = CallKitParams(
      id: uuid,
      nameCaller: 'Hien Nguyen',
      appName: 'Callkit',
      avatar: 'https://i.pravatar.cc/100',
      handle: '0123456789',
      type: 0,
      duration: 30000,
      textAccept: 'Accept',
      textDecline: 'Decline',
      missedCallNotification: const NotificationParams(
        showNotification: true,
        isShowCallback: true,
        subtitle: 'Missed call',
        callbackText: 'Call back',
      ),
      extra: <String, dynamic>{'userId': '1a2b3c4d'},
      headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
      android: const AndroidParams(
        isCustomNotification: true,
        isShowLogo: false,
        ringtonePath: 'system_ringtone_default',
        backgroundColor: '#0955fa',
        backgroundUrl: 'assets/test.png',
        actionColor: '#4CAF50',
      ),
      ios: const IOSParams(
        iconName: 'CallKitLogo',
        handleType: '',
        supportsVideo: true,
        maximumCallGroups: 2,
        maximumCallsPerCallGroup: 1,
        audioSessionMode: 'default',
        audioSessionActive: true,
        audioSessionPreferredSampleRate: 44100.0,
        audioSessionPreferredIOBufferDuration: 0.005,
        supportsDTMF: true,
        supportsHolding: true,
        supportsGrouping: false,
        supportsUngrouping: false,
        ringtonePath: 'system_ringtone_default',
      ),
    );
    await FlutterCallkitIncoming.showCallkitIncoming(params);
  }

  Future<void> showMissCallNotification(String uuid) async {
    final params = CallKitParams(
      id: uuid,
      nameCaller: 'Hien Nguyen',
      appName: 'Callkit',
      avatar: 'https://i.pravatar.cc/100',
      handle: '0123456789',
      type: 0,
      duration: 30000,
      missedCallNotification: const NotificationParams(
        showNotification: true,
        isShowCallback: true,
        subtitle: 'Missed call',
        callbackText: 'Call back',
      ),
      extra: <String, dynamic>{'userId': '1a2b3c4d'},
      android: const AndroidParams(
        isCustomNotification: true,
        isShowLogo: false,
        ringtonePath: 'system_ringtone_default',
        backgroundColor: '#0955fa',
        backgroundUrl: 'assets/test.png',
        actionColor: '#4CAF50',
      ),
    );
    await FlutterCallkitIncoming.showMissCallNotification(params);
  }

  Future<dynamic> getCurrentCall() async {
    //check current call from pushkit if possible
    var calls = await FlutterCallkitIncoming.activeCalls();
    if (calls is List) {
      print('COUNT: ${calls.length}');
      if (calls.isNotEmpty) {
        for (var call in calls) {
          print('DATA: $call');
        }
        return calls[calls.length - 1];
      } else {
        return null;
      }
    }
  }

  CallKitParams getCallKitParamsFromBody(dynamic body) {
    final params = jsonDecode(jsonEncode(body));
    final calling = CallKitParams.fromJson(params);
    return calling;
  }
}

@riverpod
CallkitIncoming callkitIncoming(CallkitIncomingRef ref) {
  /// listen
  print('callkitIncoming init');
  FlutterCallkitIncoming.onEvent.listen((event) async {
    print('onEvent => ${event!.event}');
    switch (event!.event) {
      case Event.actionCallIncoming:
      // TODO: received an incoming call
        // ref.read(callingKeepersProvider.notifier).saveCalling(CallingKeeper(callingUuid: calling.id!));
        // print('calling => save ${ref.watch(callingKeepersProvider)}');
        break;
      case Event.actionCallStart:
      // TODO: started an outgoing call
      // TODO: show screen calling in Flutter
        break;
      case Event.actionCallAccept:
      // TODO: accepted an incoming call
      // TODO: show screen calling in Flutter
        print('calling => onEvent delete before ${ref.watch(callingKeepersProvider)}');
        final keeper = ref.watch(callingKeepersProvider);
        final calling = ref.read(getCallKitParamsFromBodyProvider(event.body));
        final index = keeper.indexWhere((c) => c.callingUuid == calling.id);
        if (index != -1) {
          final voip = keeper[index].isHave;
          await FlutterCallkitIncoming.setCallConnected(calling.id!);

          Future.delayed(const Duration(seconds: 2), () async {
            await FlutterCallkitIncoming.endCall(calling.id!);
            ref.read(callingKeepersProvider.notifier).deleteCalling(calling.id!);
            print('calling => onEvent delete after ${ref.watch(callingKeepersProvider)}');
          });
        }
        break;
      case Event.actionCallDecline:
      // TODO: declined an incoming call
        final calling = ref.read(getCallKitParamsFromBodyProvider(event.body));
        ref.read(callingKeepersProvider.notifier).deleteCalling(calling.id!);
        print('calling => onEvent delete after ${ref.watch(callingKeepersProvider)}');
        await ref.read(getCurrentCallProvider.future);
        break;
      case Event.actionCallEnded:
      // TODO: ended an incoming/outgoing call
        final calling = ref.read(getCallKitParamsFromBodyProvider(event.body));
        ref.read(callingKeepersProvider.notifier).deleteCalling(calling.id!);
        await ref.read(getCurrentCallProvider.future);
        break;
      case Event.actionCallTimeout:
      // TODO: missed an incoming call
        break;
      case Event.actionCallCallback:
      // TODO: only Android - click action `Call back` from missed call notification
        final keeper = ref.watch(callingKeepersProvider);
        final calling = ref.read(getCallKitParamsFromBodyProvider(event.body));
        final index = keeper.indexWhere((c) => c.callingUuid == calling.id);
        if (index != -1) {
          final voip = keeper[index].isHave;
          print('calling => voip isHave ${keeper[index].callingUuid}');
          // TODO: voip callback
        }
        break;
      case Event.actionCallToggleHold:
      // TODO: only iOS
        break;
      case Event.actionCallToggleMute:
      // TODO: only iOS
        break;
      case Event.actionCallToggleDmtf:
      // TODO: only iOS
        break;
      case Event.actionCallToggleGroup:
      // TODO: only iOS
        break;
      case Event.actionCallToggleAudioSession:
      // TODO: only iOS
        break;
      case Event.actionDidUpdateDevicePushTokenVoip:
      // TODO: only iOS
        break;
      case Event.actionCallCustom:
      // TODO: for custom action
        break;
    }
  });
  ref.onDispose(() {
    print('callkitIncoming dispose');
  });
  return CallkitIncoming();
}

@riverpod
Future<dynamic> getCurrentCall(GetCurrentCallRef ref) {
  print('getCurrentCall');
  return ref
      .watch(callkitIncomingProvider)
      .getCurrentCall();
}

@riverpod
CallKitParams getCallKitParamsFromBody(GetCallKitParamsFromBodyRef ref, dynamic body) {
  return ref
      .watch(callkitIncomingProvider)
      .getCallKitParamsFromBody(body);
}