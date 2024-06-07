class VolunteeringActivityModel {
  String? id;
  String campaignId;
  String organizationId;
  int numberOfHours;
  String role;
  String volunteerId; // New property

  VolunteeringActivityModel({
    this.id,
    required this.campaignId,
    required this.organizationId,
    required this.numberOfHours,
    required this.role,
    required this.volunteerId, // Include the new property in the constructor
  });

  factory VolunteeringActivityModel.fromJson(Map<String, dynamic> json) {
    return VolunteeringActivityModel(
      id: json['id'],
      campaignId: json['campaignId'],
      organizationId: json['organizationId'],
      numberOfHours: json['numberOfHours'],
      role: json['role'],
      volunteerId: json['volunteerId'], // Assign the value from the JSON to the new property
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'campaignId': campaignId,
      'organizationId': organizationId,
      'numberOfHours': numberOfHours,
      'role': role,
      'volunteerId': volunteerId, // Include the new property in the map
    };
  }
}
