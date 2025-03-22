class Point {
  final int totalPoints;
  final double cashEquivalent;

  Point({
    required this.totalPoints,
    required this.cashEquivalent,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      totalPoints: json['totalPoints'] ?? 0,
      cashEquivalent: (json['cashEquivalent'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
