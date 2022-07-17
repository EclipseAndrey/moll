class HostItem{
  final String ip;

  HostItem({required this.ip});

  @override
  String toString() {
    return 'HostItem{ip: $ip}';
  }

  factory HostItem.fromJson(Map<String, dynamic> json) {
    return HostItem(
      ip: json["ip"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ip": ip,
    };
  }
}