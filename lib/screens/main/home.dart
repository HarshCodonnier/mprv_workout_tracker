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
    return ListTile(
      leading: Image.asset(
        image,
        height: 20,
        width: 18,
      ),
      title: title.drawerItemText(),
      onTap: onItemClick,
    );
  }

  onLogoutClick() {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed(Routes.STARTUP);
  }

  Widget logItemMenu(int index) {
    return Container(
      child: Column(
        children: [
          InkWell(
            child: "Edit".logItemMenuText(),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Edited ${DUMMY_WORKOUT[index].workoutName}"),
                ),
              );
            },
          ),
          15.0.addHSpace(),
          InkWell(
            child: "Delete".logItemMenuText(),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Deleted ${DUMMY_WORKOUT[index].workoutName}"),
                ),
              );
            },
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    _userItem = ModalRoute.of(context).settings.arguments;

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
                      _userItem.userEmail.drawerSubHeaderText()
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
                    drawerItem(
                        ImageAssets.userProfile, "Edit Profile", onLogoutClick),
                    4.0.dividerSpace(startSpace: 15),
                    drawerItem(ImageAssets.changePassword, "Change Password",
                        onLogoutClick),
                    4.0.dividerSpace(startSpace: 15),
                    drawerItem(ImageAssets.logout, "Log Out", onLogoutClick),
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
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    color: appColor,
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
                                                    if (_selectedIndex != index)
                                                      _selectedIndex = index;
                                                    else
                                                      _selectedIndex = -1;
                                                  });
                                                },
                                              )
                                            ],
                                          ),
                                          item.workoutName
                                              .logItemSubTitleText(),
                                          Row(
                                            children: [
                                              "Weight: ${item.weight == null ? "0.0" : item.weight}"
                                                  .logItemWeightRepsText(),
                                              20.0.addWSpace(),
                                              "Reps: ${item.reps == null ? "0" : item.reps}"
                                                  .logItemWeightRepsText(),
                                            ],
                                          ),
                                          20.0.addHSpace(),
                                          item.description == null ||
                                                  item.description.isEmpty
                                              ? "--".logItemDescriptionText()
                                              : item.description
                                                  .logItemDescriptionText(),
                                          20.0.addHSpace(),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
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
