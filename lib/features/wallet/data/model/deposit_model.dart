  class DepositData {
  final int? id;
  final int? cash;
  final int? idWallet;
  final String? date;
  final int? amount;

  DepositData({
    this.id,
    this.idWallet,
    this.date,
    this.amount,
    this.cash
  });

  factory DepositData.fromJson(Map<String, dynamic> json) {
    return DepositData(
      id: json['id'],
      idWallet: json['wallet_id'],
      amount:  json['amount'],
      date:  json['created_at'],
      cash: json['wallet_cash']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'wallet_id': idWallet,
      'amount': amount,
      'created_at': date,

    };
  }

  static List<DepositData> fromJsonDepositList(List<dynamic> json) {
    return json.map((e) => DepositData.fromJson(e)).toList();
  }

  static final fakeDepositData = List.filled(
      5,
      DepositData(
        cash: 6543,
        date: "2024-10-02T22:26:12.000000Z",
        idWallet:  7,
        amount: 1000,
      ));
}
