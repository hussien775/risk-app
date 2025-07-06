//عدد الاسهم المسموح بالشراء= نسبة المخاطرة الي تم اختيارها العميل / (سعر السهم - وقف الخسارة )
import 'package:flutter_riverpod/flutter_riverpod.dart';

String numCanBuyEquation(
    {required double ratioDanger,
    required String priceShare,
    required String stopLoss}) {
  if (priceShare == "" || stopLoss == "") {
    return "0";
  } else {
    return (1000 / (double.parse((priceShare)) - double.parse((stopLoss))))
        .toString();
  }
}

//المبلغ المدفوع = عدد الاسهم * قيمة شراء السهم
String pricePaid({required String numShares, required String priceShare}) {
  if (priceShare == "") return "0";
  return (double.parse(numShares) * double.parse(priceShare)).toString();
}

//بخصوص النسبة = المبلغ المدفوع / (اجمالي المبلغ المستثمر -المسحوبات)
String ratioPricePaid(
    {required String paidPrice, required String cash, required String pick}) {
  //if(priceShare=="") return "0";
  return (double.parse(paidPrice) / (double.parse(cash) - double.parse(pick)))
      .toString();
}

//مبلغ الخسارة المتوقعة = عدد الاسهم * خسارة السهم الواحد  الي هي (قيمة شراء السهم - قيمة وقف الخسارة )
String totalLossExpected(
    {required String numShares,
    required String priceShare,
    required String valueStopLoss}) {
  //if(priceShare=="") return "0";
  if (priceShare == "" || numShares == "" || valueStopLoss == "") {
    return "0";
  } else {
    return (double.parse(numShares) *
            (double.parse(priceShare) - double.parse(valueStopLoss)))
        .toString();
  }
}

//مبلغ الربح = عدد الاسهم * ربح السهم الواحد  الي هي (قيمة شراء السهم - قيمة وقف الربح)

String totalProfitExpected(
    {required String numShares,
    required String priceShare,
    required String valueStopProfit}) {
  if (priceShare == "" || numShares == "" || valueStopProfit == "") {
    return "0";
  } else {
    return (double.parse(numShares) *
            (double.parse(priceShare) - double.parse(valueStopProfit)))
        .toString();
  }
}

//ربح السهم الواحد  الي هي (قيمة شراء السهم - قيمة وقف الربح)
String profitOneShare(
    {required String priceShare, required String valueStopProfit}) {
  if (priceShare == "" || valueStopProfit == "") {
    return "0";
  } else {
    return (double.parse(priceShare) - double.parse(valueStopProfit))
        .toString();
  }
}

//خسارة السهم الواحد  الي هي (قيمة شراء السهم - قيمة وقف الخسارة)
String lossOneShare(
    {required String priceShare, required String valueStopLoss}) {
  if (priceShare == "" || valueStopLoss == "") {
    return "0";
  } else {
    return (double.parse(priceShare) - double.parse(valueStopLoss)).toString();
  }
}

//العائد من المخاطرة = ربح السهم الواحد / خسارة السهم الواحد
String returnFromRisk(
    {required String profitFromOneShare, required String lossFromOneShare}) {
  if (profitFromOneShare == "" || lossFromOneShare == "") {
    return "0";
  } else {
    return (double.parse(profitFromOneShare) / double.parse(lossFromOneShare))
        .toString();
  }
}

// الربح او الخسارة = الشراء - البيع
int profitOrLoss(int buy, int sale) {
  return sale - buy;
}

// //تجاوز المبلغ الاحتياطي = (سعر السهم الواحد )
// String returnFromRisk({required String profitFromOneShare,required String lossFromOneShare}){
//   if(profitFromOneShare==""||lossFromOneShare==""){
//     return "0";
//   }
//   else {
//     return
//       (double.parse(profitFromOneShare) / double.parse(lossFromOneShare)).toString();
//   }
// }

// lib/notifiers/equation_notifier.dart

// lib/notifiers/equation_notifier.dart

/// Model لحفظ البيانات والمعادلات
class EquationState {
  final double ratioDanger;
  final double priceShare;
  final double stopLoss;
  final double stopProfit;
  final double numShares;
  final double paidPrice;
  final double ratioPaidPrice;
  final double ratioDangerInAllWallet;
  final double investmentAmount;
  final double cash;
  final double pick;

  const EquationState(
      {this.ratioDanger = 0,
      this.priceShare = 0,
      this.stopLoss = 0,
      this.stopProfit = 0,
      this.numShares = 0,
      this.paidPrice = 0,
      this.cash = 0,
      this.pick = 0,
      this.ratioPaidPrice = 0,
      this.ratioDangerInAllWallet = 0,
      this.investmentAmount = 0});

  EquationState copyWith(
      {double? ratioDanger,
      double? priceShare,
      double? stopLoss,
      double? stopProfit,
      double? numShares,
      double? paidPrice,
      double? cash,
      double? pick,
      double? ratioPaidPrice,
      double? ratio,
      double? ratioDangerInAllWallet,
      double? investmentAmount}) {
    return EquationState(
        ratioDanger: ratioDanger ?? this.ratioDanger,
        priceShare: priceShare ?? this.priceShare,
        stopLoss: stopLoss ?? this.stopLoss,
        stopProfit: stopProfit ?? this.stopProfit,
        numShares: numShares ?? this.numShares,
        paidPrice: paidPrice ?? this.paidPrice,
        cash: cash ?? this.cash,
        pick: pick ?? this.pick,
        ratioPaidPrice: ratioPaidPrice ?? this.ratioPaidPrice,
        ratioDangerInAllWallet:
            ratioDangerInAllWallet ?? this.ratioDangerInAllWallet,
        investmentAmount: investmentAmount ?? this.investmentAmount);
  }
}

/// Notifier للتحكم بالمعادلات
class EquationNotifier extends StateNotifier<EquationState> {
  EquationNotifier() : super(const EquationState());

  void updatePriceShare(double value) =>
      state = state.copyWith(priceShare: value);

  void updateStopLoss(double value) => state = state.copyWith(stopLoss: value);

  void updateStopProfit(double value) =>
      state = state.copyWith(stopProfit: value);

  void updateRatioDanger(double value) =>
      state = state.copyWith(ratioDanger: value);

  void updateNumShares(double value) =>
      state = state.copyWith(numShares: value);

  void updatePaidPrice(double value) =>
      state = state.copyWith(paidPrice: value);

  void updateCash(double value) => state = state.copyWith(cash: value);

  void updatePick(double value) => state = state.copyWith(pick: value);
  void updateInvestmentAmount(double value) => state = state.copyWith(investmentAmount: value);

  void updateRatioDangerInAllWallet(double value) =>
      state = state.copyWith(ratioDangerInAllWallet: value);

  /// حساب عدد الأسهم المسموح بها
  double get numCanBuy {
    if (state.priceShare <= 0 || state.stopLoss <= 0) return 0;
    final result = (state.ratioDanger*state.investmentAmount) / (state.priceShare - state.stopLoss);
    return result.isFinite ? result : 0;
  }

  //نسبة المخاطرة من المحفظة كامل
  double get ratioDangerFromAllWallet {
    return state.ratioDanger * state.cash;
  }

  /// المبلغ المدفوع
  double get pricePaid {
    return state.numShares * state.priceShare;
  }

  /// النسبة المدفوعة
  double get ratioPricePaid {
    final netInvestment = state.cash - state.pick;
    // if (netInvestment <= 0) return 0;
    return (state.paidPrice / state.cash)*100;
  }

  /// الخسارة المتوقعة
  double get totalLossExpected {
    if (state.priceShare <= 0 || state.stopLoss <= 0) return 0;
    final lossPerOneShare = state.priceShare - state.stopLoss;
    return state.numShares * lossPerOneShare;
  }

  /// الربح المتوقع
  double get totalProfitExpected {
    if (state.priceShare <= 0 || state.stopProfit <= 0) return 0;

    final profitPerShare = (state.priceShare - state.stopProfit) * -1;
    return profitPerShare * state.numShares;
  }

  /// ربح السهم الواحد
  double get profitOneShare {
    return state.priceShare - state.stopProfit;
  }

  /// خسارة السهم الواحد
  double get lossOneShare {
    return state.priceShare - state.stopLoss;
  }

  /// العائد من المخاطرة
  double get returnFromRisk {
    final loss = lossOneShare;
    if (loss == 0) return 0;
    return profitOneShare / loss;
  }

  /// الربح أو الخسارة
  int profitOrLoss(int buy, int sale) {
    return sale - buy;
  }
}

/// Provider للـ Notifier
final equationProvider =
    StateNotifierProvider.autoDispose<EquationNotifier, EquationState>(
  (ref) => EquationNotifier(),
);

// ملاحظة: فضلت استخدام double مباشرة لتسهيل الاستخدام بدلاً من التعامل مع Strings وتحويلاتهم.
