import 'package:flutter/material.dart';
import 'package:graduationproject/models/donation_model.dart';
import 'package:graduationproject/utils/color_palette.dart';

class DonorActivityItem extends StatelessWidget {
  final Donation donation;

  const DonorActivityItem({required this.donation, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: PRIMARY_COLOR),
      ),
      child: ExpansionTile(
        title: Text(
          "Donation: \$${donation.amount}",
          style: const TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Organization ID: ${donation.receivingOrganizationId}",
          style: TextStyle(color: PRIMARY_COLOR.withOpacity(0.7)),
        ),
        iconColor: PRIMARY_COLOR,
        children: [
          ListTile(
            title: Text(
              "Periodicity: ${donation.periodicity.toString().split('.').last}",
              style: const TextStyle(color: PRIMARY_COLOR),
            ),
            subtitle: Text(
              "Date: ${donation.createdAt.toLocal()}",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
