import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../home_controller.dart';

class TextAndSlider extends StatefulWidget {
  final String fieldName;
  TextAndSlider({Key? key, required this.fieldName}) : super(key: key);

  @override
  State<TextAndSlider> createState() => _TextAndSliderState();
}

class _TextAndSliderState extends State<TextAndSlider> {
  var controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (context) {
      return Column(
        children: [
          RichText(
            text: TextSpan(
                text: '${widget.fieldName}: ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  widget.fieldName.contains('Purchase price')
                      ? TextSpan(
                          text:
                              ' \$ ${_currencyFormat(controller.purchaseValue)}: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      : widget.fieldName.contains('Down payment')
                          ? TextSpan(
                              text:
                                  ' \$ ${_currencyFormat(controller.downPaymentValue)}: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          : widget.fieldName.contains('Repayment time')
                              ? TextSpan(
                                  text:
                                      ' ${controller.repaymentValue.toInt()} years ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              : TextSpan(
                                  text:
                                      ' ${_percentageFormat(controller.interestRateValue)}%',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                ]),
          ),
          Slider(
              activeColor: Colors.deepPurple,
              thumbColor: Colors.deepPurple,
              inactiveColor: Colors.white,
              onChanged: (double newValue) {
                widget.fieldName.contains('Purchase price')
                    ? controller.purchaseValue = newValue
                    : widget.fieldName.contains('Down payment')
                        ? controller.downPaymentValue = newValue
                        : widget.fieldName.contains('Repayment time')
                            ? controller.repaymentValue = newValue
                            : controller.interestRateValue = newValue;
                // controller.calculateLoanAmount();
                // controller.calculateMortgage();
              },
              value: widget.fieldName.contains('Purchase price')
                  ? controller.purchaseValue
                  : widget.fieldName.contains('Down payment')
                      ? controller.downPaymentValue
                      : widget.fieldName.contains('Repayment time')
                          ? controller.repaymentValue
                          : controller.interestRateValue,
              min: 0.0,
              max: widget.fieldName.contains('Purchase price')
                  ? 2000000
                  : widget.fieldName.contains('Down payment')
                      ? 1500000
                      : widget.fieldName.contains('Repayment time')
                          ? 30
                          : 15),
          SizedBox(
            height: 16,
          ),
        ],
      );
    });
  }
}

String _currencyFormat(double value) {
  var usdCurrency = new NumberFormat("#,##0.00", "en_US");
  return usdCurrency.format(value);
}

String _percentageFormat(double value) {
  var percentageFormat = new NumberFormat("#,##0.00", "en_US");
  return percentageFormat.format(value);
}
