// import 'package:flutter_test/flutter_test.dart';
// import 'package:sadad_flutter_sdk/sadad_flutter_sdk.dart';
// import 'package:sadad_flutter_sdk/channel/sadad_flutter_sdk_platform_interface.dart';
// import 'package:sadad_flutter_sdk/channel/sadad_flutter_sdk_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockSadadFlutterSdkPlatform
//     with MockPlatformInterfaceMixin
//     implements SadadFlutterSdkPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final SadadFlutterSdkPlatform initialPlatform = SadadFlutterSdkPlatform.instance;
//
//   test('$MethodChannelSadadFlutterSdk is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelSadadFlutterSdk>());
//   });
//
//   test('getPlatformVersion', () async {
//     SadadFlutterSdk sadadFlutterSdkPlugin = SadadFlutterSdk();
//     MockSadadFlutterSdkPlatform fakePlatform = MockSadadFlutterSdkPlatform();
//     SadadFlutterSdkPlatform.instance = fakePlatform;
//
//     expect(await sadadFlutterSdkPlugin.getPlatformVersion(), '42');
//   });
// }
