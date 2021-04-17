import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    Navigator.of(context).pushNamed(Routes.EDIT_PROFILE);
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

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    height: mediaQueryHeight(context) * 0.17,
                    width: mediaQueryWidth(context) * 0.34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(65),
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(65),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1577812360848-4ecf5308ad83?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  (mediaQueryHeight(context) * 0.04).addHSpace(),
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
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) {
                            var item = DUMMY_WORKOUT[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: appColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Material(
                                      clipBehavior: Clip.antiAlias,
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.transparent,
                                      child: InkWell(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                top: 20,
                                                bottom: 20,
                                                right: 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: item.categoryName
                                                          .logItemTitleText(),
                                                    ),
                                                    IconButton(
                                                      icon: Image.asset(
                                                        "assets/images/ic_more.png",
                                                        width: 20,
                                                        height: 20,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          if (_selectedIndex !=
                                                              index)
                                                            _selectedIndex =
                                                                index;
                                                          else
                                                            _selectedIndex = -1;
                                                        });
                                                      },
                                                    )
                                                  ],
                                                ),
                                                item.isCustomWorkout
                                                    ? item.customWorkoutName
                                                        .logItemSubTitleText()
                                                    : item.workoutName
                                                        .logItemSubTitleText(),
                                                Row(
                                                  children: [
                                                    "Weight: ${item.weight == null ? "0.0" : item.weight}"
                                                        .logItemWeightRepsText(),
                                                    (mediaQueryHeight(context) *
                                                            0.03)
                                                        .addWSpace(),
                                                    "Reps: ${item.reps == null ? "0" : item.reps}"
                                                        .logItemWeightRepsText(),
                                                  ],
                                                ),
                                                spaceH.addHSpace(),
                                                item.description == null ||
                                                        item.description.isEmpty
                                                    ? "--"
                                                        .logItemDescriptionText()
                                                    : item.description
                                                        .logItemDescriptionText(),
                                                spaceH.addHSpace(),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20),
                                                      child: DateFormat(
                                                              "EEEE, dd MMMM yyyy")
                                                          .format(item.date)
                                                          .logItemDateText(),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              Routes.ADD_EDIT_LOG,
                                              arguments: item);
                                        },
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    child: Positioned(
                                        top: 65,
                                        right: 15,
                                        child: logItemMenu(index)),
                                    visible: _selectedIndex == index,
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: DUMMY_WORKOUT.length,
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
          Navigator.of(context).pushNamed(Routes.ADD_EDIT_LOG);
        },
      ),
    );
  }
}
