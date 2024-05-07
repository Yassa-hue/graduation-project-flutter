import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationproject/models/volunteering_activity_model.dart';

class VolunteeringActivityModelService {
  final CollectionReference _volunteeringActivitiesCollection =
      FirebaseFirestore.instance.collection('volunteering_activities');

  Future<VolunteeringActivityModel> getVolunteeringActivityById(String id) async {
    DocumentSnapshot snapshot =
        await _volunteeringActivitiesCollection.doc(id).get();
    if (snapshot.exists) {
      return VolunteeringActivityModel.fromJson(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('Volunteering activity not found');
    }
  }

  Future<void> addVolunteeringActivity(VolunteeringActivityModel activity) async {
    await _volunteeringActivitiesCollection
        .doc(activity.id)
        .set(activity.toMap());
  }

  Future<void> updateVolunteeringActivity(VolunteeringActivityModel activity) async {
    await _volunteeringActivitiesCollection
        .doc(activity.id)
        .update(activity.toMap());
  }

  Future<void> deleteVolunteeringActivityModel(String id) async {
    await _volunteeringActivitiesCollection.doc(id).delete();
  }

  Future<List<VolunteeringActivityModel>> getVolunteeringActivitiesByOrganization(String organizationId) async {
    QuerySnapshot snapshot = await _volunteeringActivitiesCollection
        .where('organizationId', isEqualTo: organizationId).get();
    
    return snapshot
        .docs
        .map(
          (doc) => VolunteeringActivityModel
              .fromJson(doc.data() as Map<String, dynamic>)
        ).toList();
  }

  Future<List<VolunteeringActivityModel>> getVolunteeringActivitiesByCampaign(String campaignId) async {
    QuerySnapshot snapshot = await _volunteeringActivitiesCollection
        .where('campaignId', isEqualTo: campaignId).get();
    
    return snapshot
        .docs
        .map(
          (doc) => VolunteeringActivityModel
              .fromJson(doc.data() as Map<String, dynamic>)
        ).toList();
  }

  Future<List<VolunteeringActivityModel>> getVolunteeringActivitiesByUser(String userId) async {
    QuerySnapshot snapshot = await _volunteeringActivitiesCollection
        .where('userId', isEqualTo: userId).get();
    
    return snapshot
        .docs
        .map(
          (doc) => VolunteeringActivityModel
              .fromJson(doc.data() as Map<String, dynamic>)
        ).toList();
  }
}