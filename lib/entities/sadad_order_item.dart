class SadadOrderItem {
  final String name;
  final int quantity;
  final double amount;

  const SadadOrderItem({
    required this.name,
    required this.quantity,
    required this.amount,
  });

  Map<String, dynamic> toJson() => {"name": name, "quantity": quantity, "amount": amount};
}
