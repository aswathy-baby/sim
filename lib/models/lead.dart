// lib/models/lead.dart


class Lead {
  final String id;
  final String customerId;
  final String source;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Lead({
    required this.id,
    required this.customerId,
    required this.source,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      id: json['id'],
      customerId: json['customerId'],
      source: json['source'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'customerId': customerId,
        'source': source,
        'status': status,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}
