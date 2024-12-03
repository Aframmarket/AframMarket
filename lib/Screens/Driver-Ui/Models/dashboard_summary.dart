class DashboardSummary {
  final String status;
  final int totalCompleted;
  final int totalPending;
  final int totalOngoing;

  DashboardSummary({
    required this.status,
    required this.totalCompleted,
    required this.totalPending,
    required this.totalOngoing,
  });

  factory DashboardSummary.fromJson(Map<String, dynamic> json) {
    return DashboardSummary(
      status: json['status'] as String,
      totalCompleted: json['total_completed'] as int,
      totalPending: json['total_pending'] as int,
      totalOngoing: json['total_ongoing'] as int,
    );
  }
}
