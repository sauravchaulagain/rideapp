import 'package:flutter/material.dart';

class NestedTabWrapper extends StatelessWidget {
  final List<Widget> slivers;
  final ScrollPhysics? physics;
  const NestedTabWrapper({
    Key? key,
    required this.slivers,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: physics,
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        ...slivers,
      ],
    );
  }
}
