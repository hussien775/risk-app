import '../../../shares/data/model/shares_data.dart';

class WalletData {
  final int? id;
  final int? userId;
  final String? name;
  final String? coin;
  final int? total;
  final int? cash;
  final int? spare;
  final String? ratioSpare;
  final int? withdrawSumAmount;
  final String? riskRatio;
  final List<SharesData>? shares;
  WalletData({
    this.id,
    this.name,
    this.cash,
    this.coin,
    this.userId,
    this.ratioSpare,
    this.total,
    this.spare,
    this.shares,
    this.withdrawSumAmount,
    this.riskRatio
  });

  factory WalletData.fromJson(Map<String, dynamic> json) {
    return WalletData(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      cash: json['cash'],
      coin: json['coin'],
      ratioSpare: json['ratio_spare'],
      spare: json['spare'],
      total: json['total'],
      shares:SharesData.fromJsonSharesList(json['share']),
      withdrawSumAmount: json['withdraw_record_sum_amount'],
      riskRatio: json['risk_ratio']
    );
  }

  Map<String, dynamic> toJson() {
    return {

      'name': name,
      'cash': cash,
      'total': total,
      'coin': coin,
      'ratio_spare': ratioSpare,
      'risk_ratio':riskRatio,
      'spare':spare,
    };
  }

  static List<WalletData> fromJsonList(List<dynamic> json) {
    return json.map((e) => WalletData.fromJson(e)).toList();
  }

  static final fakeWalletData = List.filled(
      3,
      WalletData(
        cash: 0,
        name: "قم بانشاء محفظة",
        coin:"قم بانشاء محفظة",
        ratioSpare: "0",
        spare: 0,
        total: 0,
        shares:SharesData.fakeSharesData,
        withdrawSumAmount: 10
      ));
}
