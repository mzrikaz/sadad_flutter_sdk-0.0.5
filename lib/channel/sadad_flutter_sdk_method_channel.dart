import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sadad_flutter_sdk/entities/sadad_transaction.dart';
import 'sadad_flutter_sdk_platform_interface.dart';

class MethodChannelSadadFlutterSdk extends SadadFlutterSdkPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('sadad_flutter_sdk');

  @override
  Future<String?> createTransaction(SadadTransaction transaction,
      [String method = '']) async {
    final result = await methodChannel.invokeMethod<String>(
      'sadad_create_transaction',
      [
        json.encode(
          transaction.toJson(),
        ),
        method
      ],
    );
    return result;
  }
}
