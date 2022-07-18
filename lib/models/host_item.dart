class HostItem{
  final String ip;
  final String? name;
  final String number;

  HostItem({required this.ip, this.name, required this.number});


  @override
  String toString() {
    return 'HostItem{ip: $ip, name: $name}';
  }

  factory HostItem.fromJson(Map<String, dynamic> json) {
    return HostItem(
      ip: json["ip"],
      number: json['number']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ip": ip,
    };
  }
}