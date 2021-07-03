import 'package:flutter/material.dart';

class StaggeredDual extends StatelessWidget {
  const StaggeredDual(
      {Key key,
      @required this.itemBuilder,
      @required this.itemCount,
      this.spacing = 0.0,
      this.aspectRatio = 0.5})
      : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.minWidth;
      final height = constraints.maxHeight;
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: aspectRatio,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Transform.translate(
                offset: Offset(0.0, index.isOdd ? 100 : 0.0),
                child: itemBuilder(context, index));
          });
    });
  }
}
