import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sadad_flutter_sdk/entities/sadad_transaction.dart';

import 'sadad_flutter_sdk_method_channel.dart';

abstract class SadadFlutterSdkPlatform extends PlatformInterface {
  SadadFlutterSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static SadadFlutterSdkPlatform _instance = MethodChannelSadadFlutterSdk();

  static SadadFlutterSdkPlatform get instance => _instance;

  static set instance(SadadFlutterSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> createTransaction(SadadTransaction transaction,
      [String method = '']) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
