import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeController extends Disposable {
  HomeController();

  RxNotifier<double> _purchaseValue = RxNotifier<double>(0.0);
  RxNotifier<double> _downPaymentValue = RxNotifier<double>(0.0);
  RxNotifier<double> _interestRateValue = RxNotifier<double>(0.0);
  RxNotifier<double> _loanAmountValue = RxNotifier<double>(0.0);
  RxNotifier<double> _estimatedPrValue = RxNotifier<double>(0.0);

  double get purchaseValue => _purchaseValue.value;
  set purchaseValue(double purchaseValue) =>
      _purchaseValue.value = purchaseValue;

  double get downPaymentValue => _downPaymentValue.value;
  set downPaymentValue(double downPaymentValue) =>
      _downPaymentValue.value = downPaymentValue;

  double get interestRateValue => _interestRateValue.value;
  set interestRateValue(double interestRateValue) =>
      _interestRateValue.value = interestRateValue;

  double get loanAmountValue => _loanAmountValue.value;
  set loanAmountValue(double loanAmountValue) =>
      _loanAmountValue.value = loanAmountValue;

  double get estimatedPrValue => _estimatedPrValue.value;
  set estimatedPrValue(double estimatedPrValue) =>
      _estimatedPrValue.value = estimatedPrValue;

  @override
  void dispose() {}
}
