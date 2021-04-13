import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mprv_workout_tracker/dummy_workout.dart';

import '../extras/extras.dart';
import '../model/workout_item.dart';

class LogItemCard extends StatefulWidget {
  final WorkoutItem item;
  final int index;

  LogItemCard(this.item, this.index);

  @override
  _LogItemCardState createState() => _LogItemCardState();
}

class _LogItemCardState extends State<LogItemCard> {
  Widget logItemMenu() {
    return Container(
      child: Column(
        children: [
          InkWell(
            child: "Edit".logItemMenuText(),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text("Edited ${DUMMY_WORKOUT[widget.index].workoutName}"),
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
                  content: Text(
                      "Deleted ${DUMMY_WORKOUT[widget.index].workoutName}"),
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

  var _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: appColor,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: widget.item.categoryName.logItemTitleText(),
                    ),
                    IconButton(
                      icon: Image.asset(
                        "assets/images/ic_more.png",
                        width: 20,
                        height: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_selectedIndex != widget.index)
                            _selectedIndex = widget.index;
                          else
                            _selectedIndex = -1;
                        });
                      },
                    )
                  ],
                ),
                widget.item.workoutName.logItemSubTitleText(),
                Row(
                  children: [
                    "Weight: ${widget.item.weight == null ? "0.0" : widget.item.weight}"
                        .logItemWeightRepsText(),
                    20.0.addWSpace(),
                    "Reps: ${widget.item.reps == null ? "0" : widget.item.reps}"
                        .logItemWeightRepsText(),
                  ],
                ),
                20.0.addHSpace(),
                widget.item.description == null ||
                        widget.item.description.isEmpty
                    ? "--".logItemDescriptionText()
                    : widget.item.description.logItemDescriptionText(),
                20.0.addHSpace(),
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: DateFormat("EEEE, dd MMMM yyyy")
                          .format(widget.item.date)
                          .logItemDateText(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Visibility(
          child: Positioned(top: 65, right: 15, child: logItemMenu()),
          visible: _selectedIndex == widget.index,
        )
      ],
    );
  }
}
