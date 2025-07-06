class PaySellData {
  final int? id;
  final int? idShare;
  final int? count;
  final int? unitAmount;
  final String? dateSale;
  final int? totalAmount;
  final String? dateBuy;
  final int? profitOrLossAmount;
  final String? profitOrLossRate;
  final int? period;
  final int? avaliableCount;

  PaySellData(
      {this.idShare,
      this.id,
      this.unitAmount,
      this.dateSale,
      this.totalAmount,
      this.count,
      this.dateBuy,
      this.profitOrLossAmount,
      this.profitOrLossRate,
        this.avaliableCount,
      this.period});

  factory PaySellData.fromJson(Map<String, dynamic> json) {
    return PaySellData(
        id: json['id'],
        unitAmount: json['unit_amount'],
        totalAmount: json['total_amount'],
        dateSale: json['sold_at'],
        dateBuy: json['bought_at'],
        count: json['count'],
        profitOrLossAmount: json['profit_loss_amount'],
        profitOrLossRate: json['profit_loss_rate'],
        avaliableCount: json['available_count'],
        period: json['period']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'share_id': idShare,
      'unit_amount': unitAmount,
      'total_amount': totalAmount,
      'sold_at': dateSale,
      'bought_at': dateBuy,
      'count': count
    };
  }

  static List<PaySellData> fromJsonPaySellList(List<dynamic> json) {
    return json.map((e) => PaySellData.fromJson(e)).toList();
  }

  static final fakeBuyData = List.filled(
      5,
      PaySellData(
        totalAmount: 6543,
        dateSale: "2024-10-05T22:26:12.000000Z",
        dateBuy: "2024-10-02T22:26:12.000000Z",
        unitAmount: 7,
        count: 1000,
        period: 9,
        profitOrLossRate: "87",
        profitOrLossAmount: 10,
        avaliableCount: 10
      ));

  static final fakeSellData = List.filled(
      5,
      PaySellData(
          totalAmount: 6543,
          dateSale: "2024-10-05T22:26:12.000000Z",
          dateBuy: "2024-10-02T22:26:12.000000Z",
          unitAmount: 7,
          count: 1000,
          period: 9,
          profitOrLossRate: "87",
          profitOrLossAmount: 10,
          avaliableCount: 10
      ));
}
