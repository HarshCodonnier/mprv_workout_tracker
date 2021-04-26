import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mprv_workout_tracker/bloc/log/log_bloc.dart';
import 'package:mprv_workout_tracker/dummy_workout.dart';

import '../../extras/extras.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  UserItem _userItem;
  int _selectedIndex;
  LogBloc _logBloc;
  bool _showProgress = false;

  Widget drawerItem(String image, String title, Function onItemClick) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 20,
                width: 18,
              ),
              spaceW.addWSpace(),
              title.drawerItemText(),
            ],
          ),
        ),
        onTap: onItemClick,
      ),
    );
  }

  _onLogoutClick() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    preferences.clearUserItem();
    Navigator.of(context).pushReplacementNamed(Routes.STARTUP);
  }

  _onChangePasswordClick() {
    if (_scaffoldState.currentState.isDrawerOpen) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).pushNamed(Routes.CHANGE_PASSWORD);
  }

  _onEditProfileClick() {
    if (_scaffoldState.currentState.isDrawerOpen) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).pushNamed(Routes.EDIT_PROFILE).then((value) {
      setState(() {
        print(value);
      });
    });
  }

  Widget logItemMenu(int index) {
    return Container(
      child: Column(
        children: [
          Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.transparent,
            child: InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: "Edit".logItemMenuText(),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Edited ${DUMMY_WORKOUT[index].workoutName}"),
                  ),
                );
              },
            ),
          ),
          5.0.addHSpace(),
          Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.transparent,
            child: InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: "Delete".logItemMenuText(),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text("Deleted ${DUMMY_WORKOUT[index].workoutName}"),
                  ),
                );
              },
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
    );
  }

  _onItemEditClick(LogItem logItem) {
    Navigator.of(context)
        .pushNamed(Routes.ADD_EDIT_LOG, arguments: logItem)
        .then((value) => _logBloc.add(GetLogEvent()));
  }

  _onItemDeleteClick(LogItem logItem) {
    _logBloc.add(DeleteLogEvent(logItem.addWorkoutId));
  }

  @override
  Widget build(BuildContext context) {
    _logBloc = BlocProvider.of<LogBloc>(context);
    _logBloc.add(GetLogEvent());
    spaceTop = marginTop(context);
    spaceH = marginH(context);
    spaceW = marginW(context);
    _userItem = preferences.getUserItem();

    return Scaffold(
      key: _scaffoldState,
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: mediaQueryHeight(context) * 0.35,
              child: Column(
                children: [
                  (mediaQueryHeight(context) * 0.05).addHSpace(),
                  MPRVProfileImage(
                      borderColor: Colors.white,
                      imageUrl: preferences
                          .getString(SharedPreference.PROFILE_IMAGE)),
                  (mediaQueryHeight(context) * 0.02).addHSpace(),
                  Column(
                    children: [
                      "${_userItem.firstName} ${_userItem.lastName}"
                          .drawerHeaderText(),
                      _userItem.email.drawerSubHeaderText()
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    10.0.addHSpace(),
                    drawerItem(ImageAssets.userProfile, "Edit Profile",
                        _onEditProfileClick),
                    4.0.dividerSpace(startSpace: 15),
                    drawerItem(ImageAssets.changePassword, "Change Password",
                        _onChangePasswordClick),
                    4.0.dividerSpace(startSpace: 15),
                    drawerItem(ImageAssets.logout, "Log Out", _onLogoutClick),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 10,
            top: 50,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 27,
              ),
              onPressed: () => _scaffoldState.currentState.openDrawer(),
            ),
          ),
          Column(
            children: [
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
                      "LOGS".screenTitleText(),
                      Expanded(
                        child: BlocConsumer<LogBloc, LogState>(
                          builder: (context, state) {
                            if (state is LogDone) {
                              var logs = state.data["data"];
                              return logs.isNotEmpty
                                  ? ListView.builder(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 75),
                                      itemBuilder: (context, index) {
                                        var item =
                                            LogItem.fromJson(logs[index]);
                                        return LogItemCard(
                                            item,
                                            index,
                                            _onItemEditClick,
                                            _onItemDeleteClick);
                                        /*return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Stack(
                                            children:[
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: appColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Material(
                                                  clipBehavior: Clip.antiAlias,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 20,
                                                                top: 20,
                                                                bottom: 20,
                                                                right: 0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: item
                                                                      .categoryName
                                                                      .logItemTitleText(),
                                                                ),
                                                                IconButton(
                                                                  icon: Image
                                                                      .asset(
                                                                    ImageAssets
                                                                        .more,
                                                                    width: 20,
                                                                    height: 20,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      if (_selectedIndex !=
                                                                          index)
                                                                        _selectedIndex =
                                                                            index;
                                                                      else
                                                                        _selectedIndex =
                                                                            -1;
                                                                    });
                                                                  },
                                                                )
                                                              ],
                                                            ),
                                                            item.isCustom == 1
                                                                ? item
                                                                    .customWorkoutName
                                                                    .logItemSubTitleText()
                                                                : item
                                                                    .workoutName
                                                                    .logItemSubTitleText(),
                                                            Row(
                                                              children: [
                                                                "Weight: ${item.weight == null ? "0.0" : item.weight}"
                                                                    .logItemWeightRepsText(),
                                                                (mediaQueryHeight(
                                                                            context) *
                                                                        0.03)
                                                                    .addWSpace(),
                                                                "Reps: ${item.reps == null ? "0" : item.reps}"
                                                                    .logItemWeightRepsText(),
                                                              ],
                                                            ),
                                                            spaceH.addHSpace(),
                                                            item.workoutDesc ==
                                                                        null ||
                                                                    item.workoutDesc
                                                                        .isEmpty
                                                                ? "--"
                                                                    .logItemDescriptionText()
                                                                : item
                                                                    .workoutDesc
                                                                    .logItemDescriptionText(),
                                                            spaceH.addHSpace(),
                                                            Row(
                                                              children: [
                                                                Spacer(),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          20),
                                                                  child: DateFormat(
                                                                          "EEEE, dd MMMM yyyy")
                                                                      .format(item
                                                                          .workoutDate)
                                                                      .logItemDateText(),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pushNamed(
                                                              Routes
                                                                  .ADD_EDIT_LOG,
                                                              arguments: item)
                                                          .then((value) =>
                                                              _logBloc.add(
                                                                  GetLogEvent()));
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                child: Positioned(
                                                    top: 65,
                                                    right: 15,
                                                    child: logItemMenu(index)),
                                                visible:
                                                    _selectedIndex == index,
                                              )
                                            ],
                                          ),
                                        );*/
                                      },
                                      itemCount: logs.length,
                                    )
                                  : Center(
                                      child: "No logs found."
                                          .workoutItemTitleText(appColor),
                                    );
                            } else {
                              return Visibility(
                                visible: _showProgress,
                                child: Container(
                                  color: Colors.white24,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              );
                            }
                          },
                          listener: (context, state) {
                            if (state is LogLoading) {
                              _showProgress = true;
                            } else if (state is LogDone) {
                              _showProgress = false;
                            } else if (state is LogDeleted) {
                              _logBloc.add(GetLogEvent());
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: MPRVFabButton(
        imageFile: ImageAssets.add,
        onClick: () {
          Navigator.of(context)
              .pushNamed(Routes.ADD_EDIT_LOG)
              .then((value) => _logBloc.add(GetLogEvent()));
        },
      ),
    );
  }
}
