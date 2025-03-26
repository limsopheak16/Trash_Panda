
class RewardModel {
  final String title;
  final String description;
  final int exchangePoint;

  RewardModel({
    required this.title,
    required this.description,
    required this.exchangePoint,
   
  });

  factory RewardModel.fromJson(Map<String, dynamic> json) {
    return RewardModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      exchangePoint: json['exchangePoint'] ?? 0,
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'exchangePoint': exchangePoint,
    };
  }
}
