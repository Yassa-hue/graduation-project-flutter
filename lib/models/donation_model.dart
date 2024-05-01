class Donation {
  final String id;
  final String donorId;
  final double amount;
  final String receivingOrganizationId;

  Donation({
    required this.id,
    required this.donorId,
    required this.amount,
    required this.receivingOrganizationId,
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      id: json['id'],
      donorId: json['donorId'],
      amount: json['amount'],
      receivingOrganizationId: json['receivingOrganizationId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'donorId': donorId,
      'amount': amount,
      'receivingOrganizationId': receivingOrganizationId,
    };
  }
}

