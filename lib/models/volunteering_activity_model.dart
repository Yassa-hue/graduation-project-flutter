class VolunteeringActivityModel {
  String id;
  String campaignId;
  String organizationId;
  int numberOfHours;
  String role;

  VolunteeringActivityModel({
    required this.id,
    required this.campaignId,
    required this.organizationId,
    required this.numberOfHours,
    required this.role,
  });

  factory VolunteeringActivityModel.fromJson(Map<String, dynamic> json) {
    return VolunteeringActivityModel(
      id: json['id'],
      campaignId: json['campaignId'],
      organizationId: json['organizationId'],
      numberOfHours: json['numberOfHours'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'campaignId': campaignId,
      'organizationId': organizationId,
      'numberOfHours': numberOfHours,
      'role': role,
    };
  }
}
