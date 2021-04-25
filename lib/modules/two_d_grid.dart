import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TwoDGrid extends StatefulWidget {
  TwoDGrid({Key key, this.items, this.controller}) : super(key: key);

  final List<GridItem> items;
  final GridController controller;

  @override
  _TwoDGridState createState() => _TwoDGridState();
}

class _TwoDGridState extends State<TwoDGrid> {
  GridController _controller;
  ValueNotifier<Offset> value = ValueNotifier(Offset(0, 0));

  @override
  void initState() {
    _controller = GridController._([]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Listener(
        onPointerMove: (details) {
          value.value -= details.delta.scale(-1, -1);
        },
        // onPanUpdate: (details) {
        //   value.value = details.localPosition;
        // },
        child: ValueListenableBuilder(
            valueListenable: value,
            child: Wrap(
              children: List.generate(
                  100,
                  (index) => Wrap(
                      direction: Axis.horizontal,
                      children: List.generate(
                        100,
                        (index) => cell(),
                      ))),
            ),
            builder: (context, value, child) {
              return Transform.translate(offset: value, child: child);
            }),
      ),
    );
  }

  Widget cell() {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: .2),
        color: Colors.white,
      ),
    );
  }
}

class GridController extends ChangeNotifier {
  final List<GridItem> items;

  GridController._(this.items);

  bool get isNull => items?.isEmpty;
}

class Barrier extends GridItem {
  final Position position;
  final Widget view;

  Barrier._(this.position, this.view);

  @override
  void onCrop() {
    // TODO: implement onCrop
  }

  @override
  void onMove() {
    // TODO: implement onMove
  }

  @override
  void onTap() {
    // TODO: implement onTap
  }
}

abstract class GridItem {
  Position position;
  Widget view;

  void onCrop();

  void onTap();

  void onMove();
}

class Position {
  int dx;
  int dy;

  Position(dx, dy);
}
