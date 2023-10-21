import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/calling_keeper.dart';
import 'package:riverpod_test/calling_keepers_provider.dart';
import 'package:riverpod_test/utils/callkit_incoming_provider.dart';
import 'package:uuid/uuid.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  Future<void> initFirebase() async {
    print('initFirebase');
    await Firebase.initializeApp();
    final firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final uuid = const Uuid().v4();
      print('onMessage => $uuid');
      ref.read(callingKeepersProvider.notifier).saveCalling(CallingKeeper(callingUuid: uuid));
      print('calling => save ${ref.watch(callingKeepersProvider)}');
      ref.read(callkitIncomingProvider).showCallkitIncoming(uuid);
      // ref.read(callkitIncomingProvider).showMissCallNotification(uuid);
    });
    firebaseMessaging.getToken().then((token) {
      print('Device Token FCM: $token');
    });
  }

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  @override
  void dispose() {
    super.dispose();
    FlutterCallkitIncoming.endAllCalls();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
