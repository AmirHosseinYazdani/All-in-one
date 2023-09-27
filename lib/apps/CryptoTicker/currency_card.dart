import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CurrencyCard extends StatefulWidget {
  CurrencyCard({
    required this.currencyName,
    required this.currencyData,
    required this.price,
    required this.dropdownValue,
    this.image,
  });

  final currencyData;
  final double? price;
  final String? dropdownValue, currencyName, image;

  @override
  State<StatefulWidget> createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        // color: Colors.lightBlueAccent,
        margin: EdgeInsets.symmetric(horizontal: 20),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  child: Image.asset(widget.image!),
                  radius: 30,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.currencyData == null
                      ? '1 ${widget.currencyName} = searching... USD'
                      : '1 ${widget.currencyName} = ${widget.price!.toStringAsFixed(1)} ${widget.dropdownValue}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                //todo: check internet connecton instead of using null checker
                child: widget.currencyData == null
                    ? SpinKitSquareCircle(
                        color: Colors.white,
                        size: 25.0,
                        controller: AnimationController(
                            vsync: this,
                            duration: const Duration(milliseconds: 1200)),
                      )
                    : Container(
                        width: 0,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
