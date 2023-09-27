import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_app/apps/CryptoTicker/coin_data.dart';
import 'package:multi_app/apps/CryptoTicker/currency_card.dart';
import 'package:multi_app/apps/CryptoTicker/network_helper.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? dropdownValue = 'USD';
  List<Container> textList = [];
  double? btcPrice, ethPrice, ltcPrice;
  var btcData, ethData, ltcData;
  late Timer _timer;

  updateCounter() {
    _timer = Timer.periodic(Duration(seconds: 15), (timer) {
      setState(() {
        getCurrencyData();
      });
    });
  }

  stopCounter() {
    _timer.cancel();
  }

  Widget getDataForAndroid() {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String s in currenciesList) {
      var newItem = DropdownMenuItem<String>(
        value: s,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: Text(s),
            padding: const EdgeInsets.symmetric(horizontal: 13),
          ),
        ),
      );
      dropdownItem.add(newItem);
    }

    return DropdownButton<String>(
      items: dropdownItem,
      hint: Text('رمز ارز خود را انتخاب کنید'),
      icon: const Icon(Icons.arrow_downward),
      // iconSize: 24,
      // elevation: 16,
      // underline: Container(
      //   height: 2,
      //   color: Color(0xFF4DFFF9),
      // ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue;
          getCurrencyData();
        });
      },
      value: dropdownValue,
    );
  }

  Widget getDataForIOS() {
    for (String s in currenciesList) {
      textList.add(new Container(
        decoration: new BoxDecoration(
          color: Color(0x22D7D7DB),
          shape: BoxShape.circle,
        ),
        // decoration: ShapeDecoration(
        //   shape: RoundedRectangleBorder(
        //     side: BorderSide(width: 1.0, style: BorderStyle.solid),
        //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //   ),
        // ),
        alignment: Alignment.center,
        child: Text(s, style: TextStyle(color: Colors.white)),
      ));
    }
    return CupertinoPicker(
      // backgroundColor: Color(0xff1b1c22),
      children: textList,
      itemExtent: 50.0,
      onSelectedItemChanged: (data) {
        dropdownValue = currenciesList[data];
        btcData = null;
        ethData = null;
        ltcData = null;
        getCurrencyData();
      },
      squeeze: 1,
      magnification: 1.3,
      useMagnifier: true,
    );
  }

  void getCurrencyData() async {
    btcData =
        await NetworkHelper(cryptoSymbol: 'BTC', currencySymbol: dropdownValue)
            .getCurrenciesData();
    ethData =
        await NetworkHelper(cryptoSymbol: 'ETH', currencySymbol: dropdownValue)
            .getCurrenciesData();
    ltcData =
        await NetworkHelper(cryptoSymbol: 'LTC', currencySymbol: dropdownValue)
            .getCurrenciesData();

    print('btcData : \n ' + btcData.toString());
    print('ethData : \n ' + ethData.toString());
    print('ltcData : \n ' + ltcData.toString());
    setState(() {
      btcPrice = double.parse(btcData[0]['price']);
      ethPrice = double.parse(ethData[0]['price']);
      ltcPrice = double.parse(ltcData[0]['price']);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrencyData();
    updateCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            CurrencyCard(
              currencyName: 'BTC',
              currencyData: btcData,
              price: btcPrice,
              dropdownValue: dropdownValue,
              image: 'assets/images/bitcoin.png',
            ),
            SizedBox(
              height: 15,
            ),
            CurrencyCard(
              currencyName: 'ETH',
              currencyData: ethData,
              price: ethPrice,
              dropdownValue: dropdownValue,
              image: 'assets/images/etherium.png',
            ),
            SizedBox(
              height: 15,
            ),
            CurrencyCard(
              currencyName: 'LTC',
              currencyData: ltcData,
              price: ltcPrice,
              dropdownValue: dropdownValue,
              image: 'assets/images/litcoin.png',
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                width: 150,
                decoration: new BoxDecoration(
                  color: Color(0xFFFF0033),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                // child: Platform.isIOS ? getDataForIOS() : getDataForAndroid(),
                child: getDataForIOS(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
