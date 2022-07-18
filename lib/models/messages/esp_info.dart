class ESPInfo{
  String? name;
  String number;
  ESPInfo({required this.name, required this.number});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "number": number,
    };
  }

  factory ESPInfo.fromJson(Map<String, dynamic> json) {
    return ESPInfo(
      name: json["name"],
      number: json["number"],
    );
  }


}