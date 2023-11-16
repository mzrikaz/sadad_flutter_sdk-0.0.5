import 'package:sadad_flutter_sdk/entities/sadad_order_item.dart';

class SadadTransaction {
  final String mobileNumber;
  final String customerId;
  final String clientToken;
  final String orderId;
  final String transactionAmount;
  final String email;
  final List<SadadOrderItem> orderItems;

  const SadadTransaction({
    required this.mobileNumber,
    required this.email,
    required this.customerId,
    required this.clientToken,
    required this.transactionAmount,
    required this.orderItems,
    required this.orderId,
  }) : assert(orderItems.length > 0);

  Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber,
        "customerId": customerId,
        "clientToken": clientToken,
        "orderId": orderId,
        "transactionAmount": transactionAmount,
        "orderItems": orderItems.map((e) => e.toJson()).toList(),
        "email": email
      };
}
