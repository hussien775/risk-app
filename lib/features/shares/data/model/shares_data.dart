class SharesData {
  final int? id;
  final int? userId;
  final int? companyId;
  final int? walletId;
  final String? name;
  final String? numSellShares;
  final String? numPayShares;
  final dynamic avgPayAmountShares;
  final dynamic avgSellAmountShares;
  final dynamic numberOfShareToBuy;
  final dynamic theAmountPaidFromTheCoverageRatio;
  final dynamic stopLossValue;
  final dynamic totalExpectedLoss;
  final dynamic stopValueProfit;
  final dynamic totalExpectedProfit;
  final dynamic riskRatio;
  final dynamic returnFromRisk;
  final dynamic priceOfShare;
  final int? totalBuyProcess;
  final int? totalSaleProcess;


  SharesData({
    this.id,
    this.name,
    this.avgPayAmountShares,
    this.avgSellAmountShares,
    this.userId,
    this.companyId,
    this.numPayShares,
    this.numSellShares,
    this.walletId,
    this.numberOfShareToBuy,
    this.returnFromRisk,
    this.riskRatio,
    this.stopLossValue,
    this.theAmountPaidFromTheCoverageRatio,
    this.stopValueProfit,
    this.totalExpectedLoss,
    this.totalExpectedProfit,
    this.priceOfShare,
    this.totalBuyProcess,
    this.totalSaleProcess
  });

  factory SharesData.fromJson(Map<String, dynamic> json) {
    return SharesData(
      id: json['id']??0,
      userId: json['user_id']??0,
      name: json['company_name']??"",
      walletId: json['wallet_id']??0,
      numSellShares: json['sill_record_sum_count']??"0",
      numPayShares: json['pay_record_sum_count']??"0",
      companyId: json['company_id']??0,
      avgSellAmountShares: json['sill_record_avg_total_amount']??0.0,
      avgPayAmountShares: json['pay_record_avg_total_amount']??0.0,
      numberOfShareToBuy: json['number_shares_allowed_purchased']??0,
      returnFromRisk: json['return_from_risk']??0,
      riskRatio: json['risk_ratio']??0,
      stopLossValue: json['stop_loss_value']??0,
      totalExpectedProfit: json['total_expected_profit']??0,
      totalExpectedLoss: json['total_expected_loss']??0,
      stopValueProfit: json['top_profit']??0,
      theAmountPaidFromTheCoverageRatio: json['amount_paid_coverage_percentage']??0,
      priceOfShare: json['price_of_share'],
      totalBuyProcess: json['pay_record_sum_total_amount']??0,
      totalSaleProcess: json['sill_record_sum_total_amount']??0,



    );
  }

  Map<String, dynamic> toJson() {
    return {

      'company_name': name,
      'wallet_id': walletId,
     'number_shares_allowed_purchased':numberOfShareToBuy,
      'return_from_risk':returnFromRisk,
      'risk_ratio':riskRatio,
      'stop_loss_value':stopLossValue,
      'total_expected_profit':totalExpectedProfit,
      'total_expected_loss':totalExpectedLoss,
     'top_profit':stopValueProfit,
      'amount_paid_coverage_percentage':theAmountPaidFromTheCoverageRatio,


    };
  }

  static List<SharesData> fromJsonSharesList(List<dynamic> json) {
    return json.map((e) => SharesData.fromJson(e)).toList();
  }

  static final fakeSharesData = List.filled(
      3,
      SharesData(
        walletId: 0,
        name: "hh",
        avgSellAmountShares:0.0,
        avgPayAmountShares: 0.0,
        companyId: 0,
        id: 0,
        numPayShares: "0",
        numSellShares: "0",
        userId: 0,
        totalSaleProcess: 10,
        totalBuyProcess: 10

      ));
}
