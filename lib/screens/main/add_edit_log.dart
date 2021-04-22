import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprv_workout_tracker/bloc/log/log_bloc.dart';
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

  int _categoryController = 0;
  String _categoryName = "";
  bool _isCategoryDropdownOpened = false;
  bool _isCategoryItemSelected = false;

  int _workoutController = 0;
  String _workoutName = "";
  bool _isWorkoutDropdownOpened = false;
  bool _isWorkoutItemSelected = false;
  int _isCustomWorkout = 0;

  LogItem _logItem;
  bool _isEdit = false;
  bool _isSaveChange = false;
  int _selectedIndex;
  bool _showProgress = false;
  LogBloc _logBloc;

  void _onBackClick() {
    setState(() {
      _isCategoryDropdownOpened = false;
      _isCategoryItemSelected = false;
      _isWorkoutDropdownOpened = false;
      _isWorkoutItemSelected = false;
    });
    Navigator.of(context).pop();
  }

  void _setLogData(LogItem logItem) {
    _categoryController = logItem.categoryId;
    _categoryName = logItem.categoryName;
    _isCategoryItemSelected = true;

    _workoutController = logItem.workoutId;
    _workoutName = logItem.workoutName;
    _isWorkoutItemSelected = true;
    if (_isEdit) {
      _workoutList = WORKOUT2[_categoryController];
      _generateWorkoutList();
    }
    if (logItem.isCustom == 1) {
      _isWorkoutItemSelected = false;
      _isCustomWorkout = 1;
      _customWorkoutController.text = _logItem.customWorkoutName;
    }

    _weightController.text = logItem.weight.toString();
    _repsController.text = logItem.reps.toString();
    _descriptionController.text = logItem.workoutDesc;
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
      _workoutController = 0;
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
      _isCategoryDropdownOpened = false;
      _isWorkoutDropdownOpened = false;
      _isCustomWorkout = _isCustomWorkout == 1 ? 0 : 1;
      if (_isEdit) {
        _logItem.isCustom = _isCustomWorkout;
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
        _setLogData(item);
      } else {
        _resetFields();
      }
    });
  }

  void _resetFields() {
    _selectedIndex = -1;
    _categoryController = 0;
    _categoryName = "";
    _isCategoryDropdownOpened = false;
    _isCategoryItemSelected = false;

    _workoutController = 0;
    _workoutName = "";
    _isWorkoutDropdownOpened = false;
    _isWorkoutItemSelected = false;
    _isCustomWorkout = 0;
    _weightController.text = "";
    _repsController.text = "";
    _descriptionController.text = "";
    _customWorkoutController.text = "";
  }

  void addWorkout(bool saveToServer) {
    if (_formKey.currentState.validate() &&
        _categoryController > 0 &&
        (_isCustomWorkout == 1 || _workoutController > 0)) {
      LogItem item = LogItem(
        addWorkoutId: _isEdit ? _logItem.addWorkoutId : _logList.length,
        categoryId: _categoryController,
        categoryName: _categoryName,
        workoutId: _workoutController,
        workoutName: _workoutName,
        isCustom: _isCustomWorkout,
        customWorkoutName: _customWorkoutController.text.toString().isEmpty
            ? ""
            : _customWorkoutController.text.toString(),
        weight: double.parse(_weightController.text.toString().isEmpty
            ? "0.0"
            : _weightController.text.toString()),
        reps: int.parse(_repsController.text.toString().isEmpty
            ? "0"
            : _repsController.text.toString()),
        workoutDesc: _descriptionController.text.toString(),
      );
      setState(() {
        if (_isSaveChange) {
          _isSaveChange = false;
          _logList[_logList.indexWhere((workout) =>
              workout.addWorkoutId ==
              _logList[_selectedIndex].addWorkoutId)] = item;
          _selectedIndex = -1;
        } else {
          _logList.add(item);
          if (saveToServer) _logBloc.add(AddEditLogEvent(_logList, _isEdit));
        }
        _resetFields();
      });
    } else {
      if (_logList.isNotEmpty) {
        if (saveToServer) _logBloc.add(AddEditLogEvent(_logList, _isEdit));
        _resetFields();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Category and Workout fields are mandatory.")),
        );
      }
    }
  }

  void deleteWorkout(int index) {
    setState(() {
      _logList.removeAt(index);
      _selectedIndex = -1;
      _isSaveChange = false;
      _resetFields();
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        _logItem = ModalRoute.of(context).settings.arguments as LogItem;
        _isEdit = _logItem != null;
        if (_isEdit) _setLogData(_logItem);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logBloc = BlocProvider.of<LogBloc>(context);

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
                                            child: Stack(children: [
                                              MPRVDropdown(
                                                text: "Workout",
                                                valueId: _workoutController,
                                                valueName: _workoutName,
                                                isDropdownOpened:
                                                    _isWorkoutDropdownOpened,
                                                isItemSelected:
                                                    _isWorkoutItemSelected,
                                                items: _generateWorkoutList(),
                                              ),
                                              Visibility(
                                                child: Container(
                                                  color: Colors.white,
                                                  child: MPRVTextField(
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
                                                  ),
                                                ),
                                                visible: _isCustomWorkout == 1,
                                              )
                                            ]),
                                          )
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                      spaceH.addHSpace(),
                                      Row(
                                        children: [
                                          Material(
                                            clipBehavior: Clip.antiAlias,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: _onCustomWorkoutChecked,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: _isCustomWorkout == 1
                                                      ? appColor
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      width: 2,
                                                      color:
                                                          _isCustomWorkout == 1
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
                                                        color:
                                                            _isCustomWorkout ==
                                                                    1
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
                                        addWorkout(false);
                                      }),
                                      (mediaQueryHeight(context) * 0.054)
                                          .addHSpace(),
                                      MPRVSaveButton("SAVE", () {
                                        addWorkout(true);
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
            BlocConsumer<LogBloc, LogState>(
              builder: (context, state) {
                if (state is LogLoading) {
                  _showProgress = true;
                } else if (state is LogDone) {
                  _showProgress = false;
                }
                return Visibility(
                  visible: _showProgress,
                  child: Container(
                    color: Colors.white24,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              },
              listener: (context, state) {
                if (state is LogDone) {
                  if (state.data["status"]) {
                    _resetFields();
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.data["message"]),
                    ));
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
