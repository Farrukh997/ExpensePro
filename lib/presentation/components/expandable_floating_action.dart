import 'dart:math' as math;
import 'package:expense_pro/res/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            // _buildTapToCloseFab(),
            ..._buildExpandingActionButtons(),
            _buildTapToOpenFab(),
          ],
        ),
      ),
    );
  }

  // Widget _buildTapToCloseFab() {
  //   return AnimatedContainer(
  //     transformAlignment: Alignment.center,
  //     transform: Matrix4.diagonal3Values(
  //       !_open ? 0.7 : 1.0,
  //       !_open ? 0.7 : 1.0,
  //       1.0,
  //     ),
  //     duration: const Duration(milliseconds: 250),
  //     curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
  //     child: AnimatedOpacity(
  //       opacity: !_open ? 0.0 : 1.0,
  //       curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
  //       duration: const Duration(milliseconds: 250),
  //       child: FloatingActionButton(
  //         onPressed: _toggle,
  //         child: const Icon(
  //           Icons.close,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return AnimatedContainer(
      transformAlignment: Alignment.center,
      transform: _open ? Matrix4.rotationZ(math.pi / 4) : Matrix4.identity(),
      duration: const Duration(milliseconds: 250),
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      child: FloatingActionButton(
        onPressed: _toggle,
        child: const Icon(
          Icons.add,
          size: 32.0,
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 90.0),
          progress.value * maxDistance,
        );
        return Positioned(
          left: 180.0 + offset.dx,
          right: 180.0 - offset.dx,
          bottom: 48.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2.0,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
    required this.color,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.secondary,
      elevation: 4.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(25.0),
        splashColor: AppColors.light100,
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(16.0),
          child: icon,
        ),
      ),
    );
  }
}

@immutable
class FakeItem extends StatelessWidget {
  const FakeItem({
    super.key,
    required this.isBig,
  });

  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      height: isBig ? 128.0 : 36.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: Colors.grey.shade300,
      ),
    );
  }
}
