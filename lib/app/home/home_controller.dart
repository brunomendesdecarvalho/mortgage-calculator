import 'dart:math';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeController extends Disposable {
  HomeController();

  RxNotifier<double> _purchaseValue = RxNotifier<double>(0.0);
  RxNotifier<double> _downPaymentValue = RxNotifier<double>(0.0);
  RxNotifier<double> _repaymentValue = RxNotifier<double>(0.0);
  RxNotifier<double> _interestRateValue = RxNotifier<double>(0.0);
  RxNotifier<double> _loanAmountValue = RxNotifier<double>(0.0);
  RxNotifier<double> _estimatedMortgageValue = RxNotifier<double>(0.0);

  double get purchaseValue => _purchaseValue.value;
  set purchaseValue(double purchaseValue) =>
      _purchaseValue.value = purchaseValue;

  double get downPaymentValue => _downPaymentValue.value;
  set downPaymentValue(double downPaymentValue) =>
      _downPaymentValue.value = downPaymentValue;

  double get repaymentValue => _repaymentValue.value;
  set repaymentValue(double repaymentValue) =>
      _repaymentValue.value = repaymentValue;

  double get interestRateValue => _interestRateValue.value;
  set interestRateValue(double interestRateValue) =>
      _interestRateValue.value = interestRateValue;

  double get loanAmountValue => _loanAmountValue.value;

  double get estimatedMortgageValue => _estimatedMortgageValue.value;

  void calculateLoanAmount() {
    _loanAmountValue.value = purchaseValue - downPaymentValue;
  }

  void calculateMortgage() {
    double interestValueDecimal = (interestRateValue / 100) / 12;
    double n = repaymentValue * 12;
    _estimatedMortgageValue.value = loanAmountValue *
        ((interestValueDecimal * pow((1 + interestValueDecimal), n)) /
            (pow((1 + interestValueDecimal), n) - 1));
  }

  @override
  void dispose() {}
}
