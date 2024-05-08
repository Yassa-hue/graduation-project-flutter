import 'package:cloud_firestore/cloud_firestore.dart';

enum Periodicity {
  weekly,
  monthly,
  annually,
}
class Donation {
  final String? id;
  final String donorId;
  final double amount;
  final String receivingOrganizationId;
  final Periodicity periodicity;
  final DateTime createdAt;

  Donation({
    this.id,
    required this.donorId,
    required this.amount,
    required this.receivingOrganizationId,
    required this.periodicity,
    required this.createdAt,
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      id: json['id'],
      donorId: json['donorId'],
      amount: json['amount'],
      receivingOrganizationId: json['receivingOrganizationId'],
      periodicity: Periodicity.values.firstWhere((e) => e.toString() == '${json['periodicity']}'),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'donorId': donorId,
      'amount': amount,
      'receivingOrganizationId': receivingOrganizationId,
      'periodicity': periodicity.toString().split('.').last,
      'createdAt': Timestamp.fromDate(DateTime.now()),
    };
  }
}

