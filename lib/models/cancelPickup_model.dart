class CancelPickupModel {
  final int pickupId;
  final String status;
  final String message;

  CancelPickupModel({
    required this.pickupId,
    required this.status,
    required this.message,
  });

  factory CancelPickupModel.fromJson(Map<String, dynamic> json) {
    return CancelPickupModel(
      pickupId: json['pickupId'],
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pickupId': pickupId,
      'status': status,
      'message': message,
    };
  }
}
