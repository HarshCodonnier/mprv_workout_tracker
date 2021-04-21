import 'package:flutter/cupertino.dart';
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
  List<LogItem> _logList = List.empty(growable: true);

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
  bool _isSaveChange = false;
  int _selectedIndex;

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

  void _onWorkoutItemSelected(int index) {
    setState(() {
      _isSaveChange = false;
      if (_selectedIndex != index) {
        _selectedIndex = index;
        _isSaveChange = true;
        LogItem item = _logList[index];
        _categoryController = item.categoryId;
        _categoryName = item.categoryName;
        _isCategoryItemSelected = true;

        _workoutController = item.workoutId;
        _workoutName = item.workoutName;
        _isWorkoutItemSelected = true;
        if (item.isCustomWorkout) {
          _isWorkoutItemSelected = false;
          _isCustomWorkout = true;
          _customWorkoutController.text = item.customWorkoutName;
        }

        _weightController.text = item.weight.toString();
        _repsController.text = item.reps.toString();
        _descriptionController.text = item.description;
      } else {
        _selectedIndex = -1;
        _categoryController = -1;
        _categoryName = "";
        _isCategoryDropdownOpened = false;
        _isCategoryItemSelected = false;

        _workoutController = -1;
        _workoutName = "";
        _isWorkoutDropdownOpened = false;
        _isWorkoutItemSelected = false;
        _isCustomWorkout = false;
        _weightController.text = "";
        _repsController.text = "";
        _descriptionController.text = "";
        _customWorkoutController.text = "";
      }
    });
  }

  void addWorkout() {
    LogItem item = LogItem(
      id: _logList.length,
      categoryId: _categoryController,
      categoryName: _categoryName,
      workoutId: _workoutController,
      workoutName: _workoutName,
      isCustomWorkout: _isCustomWorkout,
      customWorkoutName: _customWorkoutController.text == null
          ? ""
          : _customWorkoutController.text.toString(),
      weight: double.parse(_weightController.text.toString().isEmpty
          ? "0.0"
          : _weightController.text.toString()),
      reps: int.parse(_repsController.text.toString().isEmpty
          ? "0"
          : _repsController.text.toString()),
      date: DateTime.now(),
      description: _descriptionController.text.toString(),
    );
    setState(() {
      if (_isSaveChange) {
        _isSaveChange = false;
        _logList[_logList.indexWhere(
            (workout) => workout.id == _logList[_selectedIndex].id)] = item;
        _selectedIndex = -1;
      } else
        _logList.add(item);
      _categoryController = -1;
      _categoryName = "";
      _isCategoryDropdownOpened = false;
      _isCategoryItemSelected = false;

      _workoutController = -1;
      _workoutName = "";
      _isWorkoutDropdownOpened = false;
      _isWorkoutItemSelected = false;
      _isCustomWorkout = false;
      _weightController.text = "";
      _repsController.text = "";
      _descriptionController.text = "";
      _customWorkoutController.text = "";
    });
  }

  void deleteWorkout(int index) {
    setState(() {
      _logList.removeAt(index);
      _selectedIndex = -1;
      _isSaveChange = false;
      _categoryController = -1;
      _categoryName = "";
      _isCategoryDropdownOpened = false;
      _isCategoryItemSelected = false;

      _workoutController = -1;
      _workoutName = "";
      _isWorkoutDropdownOpened = false;
      _isWorkoutItemSelected = false;
      _isCustomWorkout = false;
      _weightController.text = "";
      _repsController.text = "";
      _descriptionController.text = "";
      _customWorkoutController.text = "";
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
                                top: 20, right: 20, left: 20),
                            child: Column(
                              children: [
                                Visibility(
                                  visible: _logList.isNotEmpty,
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 4 / 2.45,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) => Material(
                                      borderRadius: BorderRadius.circular(15),
                                      clipBehavior: Clip.antiAlias,
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () =>
                                            _onWorkoutItemSelected(index),
                                        child: WorkoutItemCard(
                                          index,
                                          _logList[index],
                                          deleteWorkout,
                                          _selectedIndex == index,
                                        ),
                                      ),
                                    ),
                                    itemCount: _logList.length,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                  ),
                                ),
                                spaceH.addHSpace(),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          MPRVDropdown(
                                            width:
                                                mediaQueryWidth(context) * 0.35,
                                            text: "Category",
                                            valueId: _categoryController,
                                            valueName: _categoryName,
                                            isDropdownOpened:
                                                _isCategoryDropdownOpened,
                                            isItemSelected:
                                                _isCategoryItemSelected,
                                            items: _generateCategoryList(),
                                          ),
                                          spaceW.addWSpace(),
                                          Expanded(
                                            child: _isCustomWorkout
                                                ? MPRVTextField(
                                                    controller:
                                                        _customWorkoutController,
                                                    label: "Type here",
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return "Please enter workout name.";
                                                      }
                                                      return null;
                                                    },
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
                                                    items:
                                                        _generateWorkoutList(),
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: _onCustomWorkoutChecked,
                                              child: Text(
                                                "Custom Workout",
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                        color: _isCustomWorkout
                                                            ? appColor
                                                            : lightAppColor,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400),
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
                                              label: "Weight",
                                              type: TextInputType.number,
                                            ),
                                          ),
                                          spaceW.addWSpace(),
                                          Expanded(
                                            child: MPRVTextField(
                                              controller: _repsController,
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
                                      spaceH.addHSpace(),
                                      MPRVAddWorkoutButton(
                                          _isSaveChange
                                              ? "SAVE CHANGES"
                                              : "ADD WORKOUT", () {
                                        if (_formKey.currentState.validate() &&
                                            _categoryController > 0 &&
                                            _workoutController > 0) {
                                          addWorkout();
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    "Category and Workout fields are mandatory.")),
                                          );
                                        }
                                      }),
                                      (mediaQueryHeight(context) * 0.054)
                                          .addHSpace(),
                                      MPRVSaveButton("SAVE", () {
                                        if (_formKey.currentState.validate() &&
                                            _categoryController > 0 &&
                                            _workoutController > 0) {
                                          addWorkout();
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  "Category and Workout fields are mandatory."),
                                            ),
                                          );
                                        }
                                      }),
                                      (mediaQueryHeight(context) * 0.054)
                                          .addHSpace(),
                                    ],
                                  ),
                                ),
                              ],
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
