import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationproject/models/campaign_model.dart';

class CampaignService {
  final CollectionReference _colectionReference = FirebaseFirestore.instance.collection('campaigns');

  Future<Campaign> createCampaign(Campaign campaign) async {
    DocumentReference docRef = await _colectionReference.add(campaign.toJson());
    String id = docRef.id;
    await docRef.update({'id': id});
    
    campaign.id = id;
    return campaign;
  }

  Future<Campaign> getCampaignById(String id) async {
    DocumentSnapshot snapshot = await _colectionReference.doc(id).get();
    if (snapshot.exists) {
      return Campaign.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('Campaign not found');
    }
  }

  Future<void> updateCampaign(Campaign campaign) async {
    await _colectionReference.doc(campaign.id).update(campaign.toJson());
  }

  Future<void> deleteCampaign(String id) async {
    await _colectionReference.doc(id).delete();
  }

  Future<List<Campaign>> getCampaignsByOrganization(String organizationId) async {
    QuerySnapshot snapshot = await _colectionReference.where('organizationId', isEqualTo: organizationId).get();
    
    return snapshot
        .docs
        .map((doc) => Campaign.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Campaign>> getLatestCampaigns() async {
    QuerySnapshot snapshot = await _colectionReference.orderBy('createdAt', descending: true).limit(3).get();
    
    return snapshot
        .docs
        .map((doc) => Campaign.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
