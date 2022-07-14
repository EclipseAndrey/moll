
class Attribution {
  final String? trackerToken;
  final String? trackerName;
  final String? network;
  final String? campaign;
  final String? adgroup;
  final String? creative;
  final String? clickLabel;
  final String? adid;
  final String? costType;
  final num? costAmount;
  final String? costCurrency;

  Attribution({
    required this.trackerToken,
    required this.trackerName,
    required this.network,
    required this.campaign,
    required this.adgroup,
    required this.creative,
    required this.clickLabel,
    required this.adid,
    required this.costType,
    required this.costAmount,
    required this.costCurrency,
  });

  factory Attribution.fromMap(dynamic map) {
    try {
      double parsedCostAmount = -1;
      try {
        if (map['costAmount'] != null) {
          parsedCostAmount = double.parse(map['costAmount']);
        }
      } catch (ex) {}

      return Attribution(
        trackerToken: map['trackerToken'],
        trackerName: map['trackerName'],
        network: map['network'],
        campaign: map['campaign'],
        adgroup: map['adgroup'],
        creative: map['creative'],
        clickLabel: map['clickLabel'],
        adid: map['adid'],
        costType: map['costType'],
        costAmount: parsedCostAmount != -1 ? parsedCostAmount : null,
        costCurrency: map['costCurrency'],
      );
    } catch (e) {
      throw Exception(
          '[Flutter]: Failed to create AdjustAttribution object from given map object. Details: ' +
              e.toString());
    }
  }
  //
  // factory Attribution.fromAdjust(AdjustAttribution map) {
  //   return Attribution(trackerToken: map.trackerToken,
  //       trackerName: map.trackerName,
  //       network: map.network,
  //       campaign: map.campaign,
  //       adgroup: map.adgroup,
  //       creative: map.creative,
  //       clickLabel: map.clickLabel,
  //       adid: map.adid,
  //       costType: map.costType,
  //       costAmount: map.costAmount,
  //       costCurrency: map.costCurrency);
  // }
}