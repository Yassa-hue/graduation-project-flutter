import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationproject/models/donation_model.dart';
import 'package:graduationproject/models/notification_model.dart';
import 'package:graduationproject/services/notification_service.dart';

class DonationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createDonation(Donation donation) async {
    final DocumentReference docRef =
        await _firestore.collection('donations').add(donation.toJson());

    final String donationId = docRef.id;
    await docRef.update({'id': donationId});

    NotificationModel notification = NotificationModel(
      title: 'New Donation',
      body:
          'A new donation has been made to your campaign: ${donation.amount}\$',
      userId: donation.receivingOrganizationId,
    );
    await NotificationService().createNotification(notification);

    notification = NotificationModel(
      title: 'New Donation',
      body: 'Thank you for your donation: ${donation.amount}\$',
      userId: donation.donorId,
    );
    await NotificationService().createNotification(notification);
  }

  Future<Donation?> getDonationById(String donationId) async {
    final DocumentSnapshot doc =
        await _firestore.collection('donations').doc(donationId).get();
    return Donation.fromJson(doc.data() as Map<String, dynamic>);
  }

  Future<void> updateDonation(Donation donation) async {
    await _firestore
        .collection('donations')
        .doc(donation.id)
        .update(donation.toJson());
  }

  Future<void> deleteDonation(String donationId) async {
    await _firestore.collection('donations').doc(donationId).delete();
  }

  Future<List<Donation>> getDonationsByDonor(String donorId) async {
    final QuerySnapshot snapshot = await _firestore
        .collection('donations')
        .where('donorId', isEqualTo: donorId)
        .get();

    return snapshot.docs
        .map((doc) => Donation.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Donation>> getDonationsByOrganization(
      String organizationId) async {
    final QuerySnapshot snapshot = await _firestore
        .collection('donations')
        .where('organizationId', isEqualTo: organizationId)
        .get();

    return snapshot.docs
        .map((doc) => Donation.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
