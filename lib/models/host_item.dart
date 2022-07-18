class HostItem{
  final String ip;
  final String? name;

  HostItem({required this.ip, this.name});


  @override
  String toString() {
    return 'HostItem{ip: $ip, name: $name}';
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