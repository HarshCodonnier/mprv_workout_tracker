import 'package:flutter/material.dart';

import '../../extras/extras.dart';
import '../../widgets/widgets.dart';

class Home extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  Widget drawerItem(String image, String title) {
    return ListTile(
      leading: Image.asset(
        image,
        height: 20,
        width: 18,
      ),
      title: title.drawerItemText(),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      "Sample Text".drawerHeaderText(),
                      "sample.text@mprv.com".drawerSubHeaderText()
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
                    drawerItem(ImageAssets.userProfile, "Edit Profile"),
                    4.0.dividerSpace(startSpace: 15),
                    drawerItem(ImageAssets.changePassword, "Change Password"),
                    4.0.dividerSpace(startSpace: 15),
                    drawerItem(ImageAssets.logout, "Log Out"),
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
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [10.0.addHSpace(), "LOGS".screenTitleText()],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: MPRVFabButton(
        imageFile: ImageAssets.add,
        onClick: () {},
      ),
    );
  }
}
