import 'package:sadad_flutter_sdk/entities/sadad_transaction.dart';

import 'channel/sadad_flutter_sdk_platform_interface.dart';
export 'package:sadad_flutter_sdk/entities/sadad_transaction.dart';
export 'package:sadad_flutter_sdk/entities/sadad_order_item.dart';

class SadadFlutterSdk {
  Future<String?> createTransaction(SadadTransaction transaction,
      [String method = '']) {
    return SadadFlutterSdkPlatform.instance.createTransaction(transaction);
  }
}
