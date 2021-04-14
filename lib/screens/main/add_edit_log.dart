import 'package:flutter/material.dart';
import 'package:mprv_workout_tracker/category_list.dart';

import '../../extras/extras.dart';
import '../../widgets/widgets.dart';

class AddEditLog extends StatefulWidget {
  @override
  _AddEditLogState createState() => _AddEditLogState();
}

class _AddEditLogState extends State<AddEditLog> {
  int _categoryController;
  int _workoutController;

  final dropdownState = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 10,
            top: 50,
            child: IconButton(
              icon: Image.asset(ImageAssets.back, width: 24, height: 24),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Column(children: [
            SafeArea(child: MediumToolbar()),
            (mediaQueryHeight(context) * 0.02).addHSpace(),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    20.0.addHSpace(),
                    "NEW LOG".screenTitleText(),
                    Expanded(
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 30, right: 20, left: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton(
                                        isDense: true,
                                        style: lightColorTextStyle(),
                                        iconEnabledColor: lightAppColor,
                                        value: _categoryController,
                                        hint: Text("Category"),
                                        onChanged: (value) {
                                          setState(() {
                                            _categoryController = value;
                                          });
                                        },
                                        items: CATEGORIES
                                            .map(
                                              (category) => DropdownMenuItem(
                                                value: category.categoryId,
                                                child: Container(
                                                  width:
                                                      mediaQueryWidth(context) *
                                                          0.17,
                                                  child: category.categoryName
                                                      .addLogText(),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: lineColor, width: 2)),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                ),
                                20.0.addWSpace(),
                                Container(
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton(
                                        isDense: true,
                                        style: lightColorTextStyle(),
                                        iconEnabledColor: lightAppColor,
                                        value: _workoutController,
                                        hint: Text("Workout"),
                                        onChanged: (value) {
                                          setState(() {
                                            _workoutController = value;
                                          });
                                        },
                                        items: CATEGORIES
                                            .map(
                                              (category) => DropdownMenuItem(
                                                value: category.categoryId,
                                                child: Container(
                                                  width:
                                                      mediaQueryWidth(context) *
                                                          0.17,
                                                  child: category.categoryName
                                                      .addLogText(),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: lineColor, width: 2)),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
