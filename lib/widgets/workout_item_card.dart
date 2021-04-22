import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../extras/extras.dart';
import '../models/models.dart';

class WorkoutItemCard extends StatefulWidget {
  final int index;
  final LogItem item;
  final Function onDeleteClick;
  final isSelected;

  WorkoutItemCard(this.index, this.item, this.onDeleteClick, this.isSelected);

  @override
  _WorkoutItemCardState createState() => _WorkoutItemCardState();
}

class _WorkoutItemCardState extends State<WorkoutItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
              color: widget.isSelected ? appColor : Colors.transparent,
              width: widget.isSelected ? 2 : 0)),
      color: widget.isSelected ? Colors.white : appColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: widget.item.categoryName.workoutItemTitleText(
                      widget.isSelected ? appColor : Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: Image.asset(
                          widget.isSelected
                              ? ImageAssets.delete_selected
                              : ImageAssets.delete,
                          width: 15,
                          height: 15),
                      onTap: () => widget.onDeleteClick(widget.index),
                    ),
                  ),
                )
              ],
            ),
            5.0.addHSpace(),
            widget.item.isCustom == 1
                ? widget.item.customWorkoutName.workoutItemSubTitleText(
                    widget.isSelected ? appColor : Colors.white)
                : widget.item.workoutName.workoutItemSubTitleText(
                    widget.isSelected ? appColor : Colors.white),
            6.0.addHSpace(),
            Row(
              children: [
                "Weight: ${widget.item.weight == null ? "0.0" : widget.item.weight}"
                    .workoutItemWeightRepsText(
                        widget.isSelected ? appColor : Colors.white),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child:
                      "Reps: ${widget.item.reps == null ? "0" : widget.item.reps}"
                          .workoutItemWeightRepsText(
                              widget.isSelected ? appColor : Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
