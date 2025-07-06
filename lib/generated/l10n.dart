// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `My Shares`
  String get myShares {
    return Intl.message(
      'My Shares',
      name: 'myShares',
      desc: '',
      args: [],
    );
  }

  /// `Shares`
  String get shares {
    return Intl.message(
      'Shares',
      name: 'shares',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get buttonAdd {
    return Intl.message(
      'Add',
      name: 'buttonAdd',
      desc: '',
      args: [],
    );
  }

  /// `Symbol`
  String get symbolInTableShare {
    return Intl.message(
      'Symbol',
      name: 'symbolInTableShare',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameInTableShare {
    return Intl.message(
      'Name',
      name: 'nameInTableShare',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amountInTableShare {
    return Intl.message(
      'Amount',
      name: 'amountInTableShare',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get priceInTableShare {
    return Intl.message(
      'Price',
      name: 'priceInTableShare',
      desc: '',
      args: [],
    );
  }

  /// `Ri`
  String get rial {
    return Intl.message(
      'Ri',
      name: 'rial',
      desc: '',
      args: [],
    );
  }

  /// `Value`
  String get valueInTableShare {
    return Intl.message(
      'Value',
      name: 'valueInTableShare',
      desc: '',
      args: [],
    );
  }

  /// `Profit`
  String get profitInTableShare {
    return Intl.message(
      'Profit',
      name: 'profitInTableShare',
      desc: '',
      args: [],
    );
  }

  /// `Loss`
  String get lossInTableShare {
    return Intl.message(
      'Loss',
      name: 'lossInTableShare',
      desc: '',
      args: [],
    );
  }

  /// `General details`
  String get generalDetails {
    return Intl.message(
      'General details',
      name: 'generalDetails',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get statistics {
    return Intl.message(
      'Statistics',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `Total share`
  String get totalShare {
    return Intl.message(
      'Total share',
      name: 'totalShare',
      desc: '',
      args: [],
    );
  }

  /// `Financial account`
  String get financialAccount {
    return Intl.message(
      'Financial account',
      name: 'financialAccount',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Sale`
  String get sale {
    return Intl.message(
      'Sale',
      name: 'sale',
      desc: '',
      args: [],
    );
  }

  /// `Buy and sell indicators`
  String get buyAndSellIndicators {
    return Intl.message(
      'Buy and sell indicators',
      name: 'buyAndSellIndicators',
      desc: '',
      args: [],
    );
  }

  /// `Current price of the share`
  String get currentPriceOfTheShare {
    return Intl.message(
      'Current price of the share',
      name: 'currentPriceOfTheShare',
      desc: '',
      args: [],
    );
  }

  /// `Average buying price`
  String get averageBuyingPrice {
    return Intl.message(
      'Average buying price',
      name: 'averageBuyingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Purchase value of the stock`
  String get purchaseValueOfTheStock {
    return Intl.message(
      'Purchase value of the stock',
      name: 'purchaseValueOfTheStock',
      desc: '',
      args: [],
    );
  }

  /// `Stop loss value`
  String get stopLossValue {
    return Intl.message(
      'Stop loss value',
      name: 'stopLossValue',
      desc: '',
      args: [],
    );
  }

  /// `Profit value`
  String get profitValue {
    return Intl.message(
      'Profit value',
      name: 'profitValue',
      desc: '',
      args: [],
    );
  }

  /// `Risk ratio`
  String get riskRatio {
    return Intl.message(
      'Risk ratio',
      name: 'riskRatio',
      desc: '',
      args: [],
    );
  }

  /// `Return on risk`
  String get returnOnRisk {
    return Intl.message(
      'Return on risk',
      name: 'returnOnRisk',
      desc: '',
      args: [],
    );
  }

  /// `Add a sale`
  String get addSale {
    return Intl.message(
      'Add a sale',
      name: 'addSale',
      desc: '',
      args: [],
    );
  }

  /// `Add a buy`
  String get addBuy {
    return Intl.message(
      'Add a buy',
      name: 'addBuy',
      desc: '',
      args: [],
    );
  }

  /// `Sale date`
  String get saleDate {
    return Intl.message(
      'Sale date',
      name: 'saleDate',
      desc: '',
      args: [],
    );
  }

  /// `Buy date`
  String get buyDate {
    return Intl.message(
      'Buy date',
      name: 'buyDate',
      desc: '',
      args: [],
    );
  }

  /// `Period`
  String get period {
    return Intl.message(
      'Period',
      name: 'period',
      desc: '',
      args: [],
    );
  }

  /// `Market value (Selling price)`
  String get marketValueSellingPrice {
    return Intl.message(
      'Market value (Selling price)',
      name: 'marketValueSellingPrice',
      desc: '',
      args: [],
    );
  }

  /// `profit / Loss Amount`
  String get profitDividedLossAmount {
    return Intl.message(
      'profit / Loss Amount',
      name: 'profitDividedLossAmount',
      desc: '',
      args: [],
    );
  }

  /// `Profit / Loss Ratio`
  String get profitDividedLossRatio {
    return Intl.message(
      'Profit / Loss Ratio',
      name: 'profitDividedLossRatio',
      desc: '',
      args: [],
    );
  }

  /// `Profit ratio from portfolio`
  String get profitRatioFromPortfolio {
    return Intl.message(
      'Profit ratio from portfolio',
      name: 'profitRatioFromPortfolio',
      desc: '',
      args: [],
    );
  }

  /// `Buy price`
  String get buyPrice {
    return Intl.message(
      'Buy price',
      name: 'buyPrice',
      desc: '',
      args: [],
    );
  }

  /// `Remaining quantity`
  String get remainingQuantity {
    return Intl.message(
      'Remaining quantity',
      name: 'remainingQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Total balance`
  String get totalBalance {
    return Intl.message(
      'Total balance',
      name: 'totalBalance',
      desc: '',
      args: [],
    );
  }

  /// `Total buy amount`
  String get totalBuyAmount {
    return Intl.message(
      'Total buy amount',
      name: 'totalBuyAmount',
      desc: '',
      args: [],
    );
  }

  /// `Mange wallet`
  String get mangeWallet {
    return Intl.message(
      'Mange wallet',
      name: 'mangeWallet',
      desc: '',
      args: [],
    );
  }

  /// `Investment`
  String get investment {
    return Intl.message(
      'Investment',
      name: 'investment',
      desc: '',
      args: [],
    );
  }

  /// `The total amount withdrawn`
  String get theTotalAmountWithdrawn {
    return Intl.message(
      'The total amount withdrawn',
      name: 'theTotalAmountWithdrawn',
      desc: '',
      args: [],
    );
  }

  /// `Reserve amount ratio`
  String get reserveAmountRatio {
    return Intl.message(
      'Reserve amount ratio',
      name: 'reserveAmountRatio',
      desc: '',
      args: [],
    );
  }

  /// `Ratio of the total portfolio`
  String get ratioOfTheTotalPortfolio {
    return Intl.message(
      'Ratio of the total portfolio',
      name: 'ratioOfTheTotalPortfolio',
      desc: '',
      args: [],
    );
  }

  /// `My Loss`
  String get loss {
    return Intl.message(
      'My Loss',
      name: 'loss',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
