import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationproject/models/donation_model.dart';

class DonationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createDonation(
      String donorId, String organizationId, double amount) async {
    final DocumentReference docRef =
        await _firestore.collection('donations').add({
      'donorId': donorId,
      'organizationId': organizationId,
      'amount': amount,
      'timestamp': DateTime.now(),
    });

    final String donationId = docRef.id;
    await docRef.update({'donationId': donationId});
  }

  Future<Donation?> getDonationById(String donationId) async {
    final DocumentSnapshot doc =
          await _firestore.collection('donations').doc(donationId).get();
      return Donation.fromJson(doc.data() as Map<String, dynamic>);
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
