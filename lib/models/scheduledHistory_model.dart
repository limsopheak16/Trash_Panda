
class ScheduledhistoryModel {
  final int pickupId;
  final DateTime date;
  final String status;
  final String wasteTypes;
 

  ScheduledhistoryModel({
    required this.pickupId,
    required this.date,
    required this.status,
    required this.wasteTypes,
   
  });

  factory ScheduledhistoryModel.fromJson(Map<String, dynamic> json) {
    return ScheduledhistoryModel(
      pickupId: json['pickupId'] ?? '',
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
      status: json['status'] ?? '',
      wasteTypes: json['wasteTypes'] ?? '',
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pickupid': pickupId,
      'date': date.toIso8601String(),
      'status': status,
      'wasteTypes': wasteTypes,
     
    };
  }
}