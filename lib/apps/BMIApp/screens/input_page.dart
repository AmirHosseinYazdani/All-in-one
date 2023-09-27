import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_app/apps/BMIApp/components/bottom_button.dart';
import 'package:multi_app/apps/BMIApp/components/inside_card.dart';
import 'package:multi_app/apps/BMIApp/components/reusable_card.dart';
import 'package:multi_app/apps/BMIApp/components/round_icon_button.dart';
import 'package:multi_app/apps/BMIApp/computing_BMI.dart';
import 'package:multi_app/apps/BMIApp/constants.dart';
import 'package:multi_app/apps/BMIApp/screens/results_page.dart';

enum GenderEnum { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderEnum? genderEnum;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: genderEnum == GenderEnum.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: ReusableInsideCard(
                      iconData: FontAwesomeIcons.mars,
                      iconName: 'MALE',
                    ),
                    onPress: () => setState(() => genderEnum = GenderEnum.male),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: genderEnum == GenderEnum.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: ReusableInsideCard(
                      iconData: FontAwesomeIcons.venus,
                      iconName: 'FEMALE',
                    ),
                    onPress: () =>
                        setState(() => genderEnum = GenderEnum.female),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kInactiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'قد',
                    style: kLableUnitTxtStyle,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      // textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          'cm ',
                          style: kLableUnitTxtStyle,
                        ),
                        FittedBox(
                          child: Text(
                            height.toString(),
                            style: kNumberTxtStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xffeb1555),
                      activeTrackColor: Color(0xffffffff),
                      inactiveTrackColor: Color(0x6fffffff),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 18,
                      ),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 40),
                      overlayColor: Color(0x32EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 210,
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.round();
                        });
                      },
                      label: height.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'وزن',
                          style: kLableUnitTxtStyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ' kg ',
                                style: kLableUnitTxtStyle,
                              ),
                              Text(
                                '$weight',
                                style: kNumberTxtStyle,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.minus),
                              onPress: () {
                                setState(
                                  () {
                                    weight--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.plus),
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'سن',
                          style: kLableUnitTxtStyle,
                        ),
                        Expanded(
                          child: Text(
                            '$age',
                            style: kNumberTxtStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.minus),
                              onPress: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              icon: Icon(FontAwesomeIcons.plus),
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: "محاسبه شاخص BMI",
            onTap: () {
              ComputeBMI cBMI = new ComputeBMI(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: cBMI.getBMI(),
                    result: cBMI.getResult(),
                    recommend: cBMI.getRecommend(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
