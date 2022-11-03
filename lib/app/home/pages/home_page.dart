import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home_controller.dart';

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
              Text(
                'Purchase price: ',
                style: TextStyle(fontSize: 14),
              ),
              Slider(
                  onChanged: (double value) {
                    controller.downPaymentValue = value;
                  },
                  value: controller.downPaymentValue,
                  min: 0.0,
                  max: 24000),
              SizedBox(
                height: height * .01,
              ),
              Text(
                'Down payment: ',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                'Interest rate: ',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                'Loan amount: ',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                'Estimated pr. month: ',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: height * .01,
              ),
              MaterialButton(
                child: Text('Get a mortgage quote'),
                textColor: Colors.white,
                color: Colors.purple,
                onPressed: () {},
                shape: StadiumBorder(),
              ),
            ],
          ),
        );
      });
}
