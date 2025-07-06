class WithdrawData {
  final int? id;
  final int? idWallet;
  final String? date;
  final int? amount;
  final String? report;
  final int? cash;

  WithdrawData({this.id, this.idWallet, this.date, this.amount, this.report,this.cash});

  factory WithdrawData.fromJson(Map<String, dynamic> json) {
    return WithdrawData(
        id: json['id'],
        idWallet: json['wallet_id'],
        amount: json['amount'],
        date: json['created_at'],
        cash: json['wallet_cash'],
        report: json['desc']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'desc': report,
      'wallet_id': idWallet,
      'amount': amount,
      'created_at': date,
    };
  }

  static List<WithdrawData> fromJsonWithdrawList(List<dynamic> json) {
    return json.map((e) => WithdrawData.fromJson(e)).toList();
  }

  static final fakeWithdrawData = List.filled(
      5,
      WithdrawData(date: "2024-10-02T22:26:12.000000Z", idWallet: 7, amount: 3000, report: "استخدام شخصي"));
}
