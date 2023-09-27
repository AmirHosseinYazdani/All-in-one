import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_app/apps/BMIApp/components/bottom_button.dart';
import 'package:multi_app/apps/BMIApp/components/reusable_card.dart';
import 'package:multi_app/apps/BMIApp/constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmi, this.result, this.recommend});

  final String? result, recommend, bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحه نتایج'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'نتایج محاسبه شاخص BMI',
                style: kResultsPageTitleStyle,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: ReusableCard(
                color: kInactiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      result!,
                      style: kResultsPageGreenTextStyle,
                    ),
                    Text(
                      "$bmi",
                      style: kResultsPageBMITextStyle,
                    ),
                    Text(
                      recommend!,
                      style: kResultsPageRecommendTextStyle,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            title: 'محاسبه مجدد',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
