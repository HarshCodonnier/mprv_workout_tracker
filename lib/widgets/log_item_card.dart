import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../extras/extras.dart';
import '../models/models.dart';

class LogItemCard extends StatefulWidget {
  final LogItem item;
  final int index;
  final Function onEditClick;
  final Function onDeleteClick;

  LogItemCard(this.item, this.index, this.onEditClick, this.onDeleteClick);

  @override
  _LogItemCardState createState() => _LogItemCardState();
}

class _LogItemCardState extends State<LogItemCard> {
  var _selectedIndex = -1;

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
              onTap: () => widget.onEditClick(widget.item),
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
              onTap: () => widget.onDeleteClick(widget.item),
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
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: appColor, borderRadius: BorderRadius.circular(15)),
            child: Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(15),
              color: Colors.transparent,
              child: InkWell(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child:
                                  widget.item.categoryName.logItemTitleText(),
                            ),
                            IconButton(
                              icon: Image.asset(
                                ImageAssets.more,
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
                        widget.item.isCustom == 1
                            ? widget.item.customWorkoutName
                                .logItemSubTitleText()
                            : widget.item.workoutName.logItemSubTitleText(),
                        Row(
                          children: [
                            "Weight: ${widget.item.weight == null ? "0.0" : widget.item.weight}"
                                .logItemWeightRepsText(),
                            (mediaQueryHeight(context) * 0.03).addWSpace(),
                            "Reps: ${widget.item.reps == null ? "0" : widget.item.reps}"
                                .logItemWeightRepsText(),
                          ],
                        ),
                        spaceH.addHSpace(),
                        widget.item.workoutDesc == null ||
                                widget.item.workoutDesc.isEmpty
                            ? "--".logItemDescriptionText()
                            : widget.item.workoutDesc.logItemDescriptionText(),
                        spaceH.addHSpace(),
                        Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: DateFormat("EEEE, dd MMMM yyyy")
                                  .format(widget.item.workoutDate)
                                  .logItemDateText(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ),
          Visibility(
            child: Positioned(
                top: 65, right: 15, child: logItemMenu(widget.index)),
            visible: _selectedIndex == widget.index,
          )
        ],
      ),
    );
  }
}
