import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../extras/extras.dart';

class MPRVDropdown extends StatefulWidget {
  final String text;
  final int valueId;
  final String valueName;
  bool isDropdownOpened;
  final bool isItemSelected;
  final List<Widget> items;
  final double width;

  MPRVDropdown(
      {Key key,
      @required this.text,
      @required this.valueId,
      this.valueName,
      @required this.items,
      @required this.isDropdownOpened,
      @required this.isItemSelected,
      this.width})
      : super(key: key);

  @override
  _MPRVDropdownState createState() => _MPRVDropdownState();
}

class _MPRVDropdownState extends State<MPRVDropdown> {
  GlobalKey _actionKey;
  double _height, _width, _xPos, _yPos;
  OverlayEntry _floatingDropdown;

  @override
  void initState() {
    _actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void _findDropdownData() {
    RenderBox renderBox = _actionKey.currentContext.findRenderObject();
    _height = renderBox.size.height;
    _width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    _xPos = offset.dx;
    _yPos = offset.dy;
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          left: _xPos,
          width: _width,
          top: _yPos + _height,
          height: 4 * _height,
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                5.0.addHSpace(),
                Container(
                  height: 4 * _height - 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: lineColor, width: 2)),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.items,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isDropdownOpened &&
        _floatingDropdown != null &&
        _floatingDropdown.mounted) {
      _floatingDropdown.remove();
      _floatingDropdown = null;
    }
    return GestureDetector(
      key: _actionKey,
      onTap: () {
        setState(() {
          if (widget.items.isNotEmpty) {
            if (widget.isDropdownOpened) {
              _floatingDropdown.remove();
              _floatingDropdown = null;
            } else {
              _findDropdownData();
              _floatingDropdown = _createFloatingDropdown();
              Overlay.of(context).insert(_floatingDropdown);
            }
            widget.isDropdownOpened = !widget.isDropdownOpened;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: lineColor, width: 2)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: widget.width == null ? double.infinity : widget.width,
        child: Row(
          children: [
            Expanded(
              child: widget.isItemSelected &&
                      (widget.valueName != null && widget.valueName.isNotEmpty)
                  ? Text(
                      widget.valueName,
                      style: GoogleFonts.sourceSansPro(
                        color: appColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : Text(
                      widget.text,
                      style: GoogleFonts.sourceSansPro(
                        color: lightAppColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
            ),
            Icon(
              widget.isDropdownOpened
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down,
              color: lightAppColor,
            )
          ],
        ),
      ),
    );
  }
}
