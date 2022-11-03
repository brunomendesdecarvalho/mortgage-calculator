import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home_controller.dart';
import '../widgets/text_and_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xFFDBCBDC),
        body: SafeArea(
          child: SingleChildScrollView(
            child: _body(height, width),
          ),
        ));
  }

  _body(double height, double width) => RxBuilder(builder: (_) {
        return Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mortgage calculator',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: height * .01,
              ),
              TextAndSlider(
                fieldName: 'Purchase price',
              ),
              TextAndSlider(
                fieldName: 'Down payment',
              ),
              TextAndSlider(
                fieldName: 'Repayment time',
              ),
              TextAndSlider(
                fieldName: 'Interest rate',
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                'Loan amount',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$ ${_currencyFormat(controller.loanAmountValue)}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                'Estimated per month',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$ ${_currencyFormat(controller.estimatedMortgageValue)}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: height * .01,
              ),
              MaterialButton(
                child: Text('Get a mortgage quote'),
                textColor: Colors.white,
                color: Colors.purple,
                onPressed: () {
                  controller.calculateLoanAmount();
                  controller.calculateMortgage();
                },
                shape: StadiumBorder(),
              ),
            ],
          ),
        );
      });
}

String _currencyFormat(double value) {
  var usdCurrency = new NumberFormat("#,##0.00", "en_US");
  return usdCurrency.format(value);
}

_textAndSlider(double value, String fieldName) {
  return Column(
    children: [
      RichText(
        text: TextSpan(
            text: fieldName,
            style: TextStyle(color: Colors.black, fontSize: 14),
            children: <TextSpan>[
              TextSpan(
                text: ' \$ ${_currencyFormat(value)}: ',
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
              )
            ]),
      ),
      Slider(
          onChanged: (double newValue) {
            value = newValue;
          },
          value: value,
          min: 0.0,
          max: 900000),
      SizedBox(
        height: 16,
      ),
    ],
  );
}
