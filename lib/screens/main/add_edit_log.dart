import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprv_workout_tracker/category_list.dart';

import '../../extras/extras.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';
import '../../workout_list.dart';

class AddEditLog extends StatefulWidget {
  @override
  _AddEditLogState createState() => _AddEditLogState();
}

class _AddEditLogState extends State<AddEditLog> {
  final dropdownState = GlobalKey<FormFieldState>();
  final _weightController = TextEditingController();
  final _repsController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _customWorkoutController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<ListItem> _workoutList = List.empty();

  int _categoryController = -1;
  String _categoryName = "";
  bool _isCategoryDropdownOpened = false;
  bool _isCategoryItemSelected = false;

  int _workoutController = -1;
  String _workoutName = "";
  bool _isWorkoutDropdownOpened = false;
  bool _isWorkoutItemSelected = false;
  bool _isCustomWorkout = false;

  LogItem _logItem;
  bool _isEdit = false;

  void _onBackClick() {
    setState(() {
      _isCategoryDropdownOpened = false;
      _isCategoryItemSelected = false;
      _isWorkoutDropdownOpened = false;
      _isWorkoutItemSelected = false;
    });
    Navigator.of(context).pop();
  }

  void _setLogData() {
    if (_isEdit) {
      _categoryController = _logItem.categoryId;
      _categoryName = _logItem.categoryName;
      _isCategoryItemSelected = true;

      _workoutController = _logItem.workoutId;
      _workoutName = _logItem.workoutName;
      _isWorkoutItemSelected = true;
      if (_logItem.isCustomWorkout) {
        _isWorkoutItemSelected = false;
        _isCustomWorkout = true;
        _customWorkoutController.text = _logItem.customWorkoutName;
      }

      _weightController.text = _logItem.weight.toString();
      _repsController.text = _logItem.reps.toString();
      _descriptionController.text = _logItem.description;
    }
  }

  List<Widget> _generateCategoryList() {
    return CATEGORIES
        .map(
          (item) => Container(
            width: mediaQueryWidth(context) * 0.35,
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: Colors.transparent,
              child: InkWell(
                splashColor: appColor,
                onTap: () => _onCategorySelected(item.id, item.name),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: item.name.logItemMenuText(),
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  void _onCategorySelected(int id, String name) {
    setState(() {
      _categoryController = id;
      _categoryName = name;
      _workoutList = WORKOUT2[_categoryController];
      _isCategoryDropdownOpened = false;
      _isCategoryItemSelected = true;
      _workoutController = -1;
      _workoutName = "Workout";
      _isWorkoutItemSelected = false;
      _isWorkoutDropdownOpened = false;
    });
  }

  List<Widget> _generateWorkoutList() {
    return _workoutList
        .map(
          (item) => Container(
            width: mediaQueryWidth(context) * 0.483,
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: Colors.transparent,
              child: InkWell(
                splashColor: appColor,
                onTap: () => _onWorkoutSelected(item.id, item.name),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: item.name.logItemMenuText(),
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  void _onWorkoutSelected(int id, String name) {
    setState(() {
      _workoutController = id;
      _workoutName = name;
      _isWorkoutDropdownOpened = false;
      _isWorkoutItemSelected = true;
    });
  }

  void _onCustomWorkoutChecked() {
    setState(() {
      _isCustomWorkout = !_isCustomWorkout;
      if (_isEdit) {
        _logItem.isCustomWorkout = _isCustomWorkout;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _logItem = ModalRoute.of(context).settings.arguments as LogItem;
    _isEdit = _logItem != null;
    _setLogData();
    return WillPopScope(
      onWillPop: () async {
        _onBackClick();
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 10,
              top: 50,
              child: IconButton(
                icon: Image.asset(ImageAssets.back, width: 24, height: 24),
                onPressed: _onBackClick,
              ),
            ),
            Column(children: [
              SafeArea(child: MediumToolbar()),
              spaceTop.addHSpace(),
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
                      spaceTop.addHSpace(),
                      _isEdit
                          ? "EDIT LOG".screenTitleText()
                          : "NEW LOG".screenTitleText(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 30, right: 20, left: 20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      MPRVDropdown(
                                        width: mediaQueryWidth(context) * 0.35,
                                        text: "Category",
                                        valueId: _categoryController,
                                        valueName: _categoryName,
                                        isDropdownOpened:
                                            _isCategoryDropdownOpened,
                                        isItemSelected: _isCategoryItemSelected,
                                        items: _generateCategoryList(),
                                      ),
                                      spaceW.addWSpace(),
                                      Expanded(
                                        child: _isCustomWorkout
                                            ? MPRVTextField(
                                                controller:
                                                    _customWorkoutController,
                                                label: "Type here",
                                                type: TextInputType.text,
                                              )
                                            : MPRVDropdown(
                                                text: "Workout",
                                                valueId: _workoutController,
                                                valueName: _workoutName,
                                                isDropdownOpened:
                                                    _isWorkoutDropdownOpened,
                                                isItemSelected:
                                                    _isWorkoutItemSelected,
                                                items: _generateWorkoutList(),
                                              ),
                                      )
                                    ],
                                  ),
                                  spaceH.addHSpace(),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: _isCustomWorkout
                                              ? appColor
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              width: 2,
                                              color: _isCustomWorkout
                                                  ? appColor
                                                  : lineColor),
                                        ),
                                        width: 20,
                                        height: 20,
                                        child: Image.asset(
                                          ImageAssets.check,
                                          width: 12,
                                          height: 12,
                                        ),
                                      ),
                                      10.0.addWSpace(),
                                      Material(
                                        clipBehavior: Clip.antiAlias,
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: _onCustomWorkoutChecked,
                                          child: Text(
                                            "Custom Workout",
                                            style: GoogleFonts.sourceSansPro(
                                                color: _isCustomWorkout
                                                    ? appColor
                                                    : lightAppColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  spaceH.addHSpace(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: MPRVTextField(
                                          controller: _weightController,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Please enter weight.";
                                            } else if (int.parse(value) <= 0) {
                                              return "Please enter valid weight.";
                                            }
                                            return null;
                                          },
                                          label: "Weight",
                                          type: TextInputType.number,
                                        ),
                                      ),
                                      spaceW.addWSpace(),
                                      Expanded(
                                        child: MPRVTextField(
                                          controller: _repsController,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Please enter reps.";
                                            } else if (int.parse(value) <= 0) {
                                              return "Please enter valid reps.";
                                            }
                                            return null;
                                          },
                                          label: "Reps",
                                          type: TextInputType.number,
                                        ),
                                      )
                                    ],
                                  ),
                                  spaceH.addHSpace(),
                                  MPRVTextField(
                                    controller: _descriptionController,
                                    label: "Description",
                                    type: TextInputType.text,
                                    maxLines: 5,
                                  ),
                                  (mediaQueryHeight(context) * 0.15)
                                      .addHSpace(),
                                  MPRVSaveButton("SAVE", () {
                                    _formKey.currentState.validate();
                                  }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
