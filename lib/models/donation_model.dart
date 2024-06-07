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
  final String receivingCampaignId;
  final Periodicity periodicity;
  final DateTime createdAt;

  Donation({
    this.id,
    required this.donorId,
    required this.amount,
    required this.receivingCampaignId,
    required this.periodicity,
    required this.createdAt,
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      id: json['id'],
      donorId: json['donorId'],
      amount: json['amount'],
      receivingCampaignId: json['receivingCampaignId'],
      periodicity: _parsePeriodicity(json["periodicity"]),
      createdAt: (json["createdAt"] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'donorId': donorId,
      'amount': amount,
      'receivingCampaignId': receivingCampaignId,
      'periodicity': periodicity.toString().split('.').last,
      'createdAt': Timestamp.fromDate(DateTime.now()),
    };
  }

  static Periodicity _parsePeriodicity(String periodicity) {
    switch (periodicity) {
      case 'weekly':
        return Periodicity.weekly;
      case 'monthly':
        return Periodicity.monthly;
      case 'annually':
        return Periodicity.annually;
      default:
        throw ArgumentError('Invalid periodicity: $periodicity');
    }
  }
}
