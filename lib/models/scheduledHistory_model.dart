
class ScheduledhistoryModel {
  final int pickupId;
  final String date;
  final String status;
  final String wasteTypes; 
  final int estimateWeight;

  ScheduledhistoryModel({
    required this.pickupId,
    required this.date,
    required this.status,
    required this.wasteTypes,
    required this.estimateWeight,
  });

  factory ScheduledhistoryModel.fromJson(Map<String, dynamic> json) {
    return ScheduledhistoryModel(
      pickupId: json['pickupId'] ?? 0,
      date: json['date'] ?? '',
      status: json['status'] ?? '',
      wasteTypes: json['wasteTypes'] is List
          ? (json['wasteTypes'] as List).join(', ') // Convert List to String
          : json['wasteTypes'] ?? '', // Keep as String if already String
      estimateWeight: json['estimateWeight'] ?? 0,   
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pickupId': pickupId,
      'date': date,
      'status': status,
      'wasteTypes': wasteTypes, // Store as String
      'estimateWeight': estimateWeight,
    };
  }
}
