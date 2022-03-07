//Original idea: https://docs.flutter.dev/cookbook/effects/expandable-fab
import 'package:flutter/material.dart';

@immutable
class ExpandableFab extends StatefulWidget {
  final bool? initialOpen;
  final double distance;
  final List<Widget> children;
  final Icon icon;

  const ExpandableFab({
    Key? key,
    this.initialOpen,
    required this.distance,
    required this.children,
    required this.icon,
  }) : super(key: key);

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> with SingleTickerProviderStateMixin {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_open) ..._buildExpandingActionButtons(),
        Stack(
          children: [
            _buildTapToCloseFab(),
            _buildTapToOpenFab(),
          ],
        ),
      ],
    );
  }

  Widget _buildTapToCloseFab() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: _toggle,
      child: Icon(
        Icons.close,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildTapToOpenFab() {
    return AnimatedContainer(
      transformAlignment: Alignment.center,
      transform: Matrix4.diagonal3Values(
        _open ? 0.7 : 1.0,
        _open ? 0.7 : 1.0,
        1.0,
      ),
      duration: const Duration(milliseconds: 250),
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      child: AnimatedOpacity(
        opacity: _open ? 0.0 : 1.0,
        curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
        duration: const Duration(milliseconds: 250),
        child: FloatingActionButton(
          onPressed: _toggle,
          child: widget.icon,
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;

    for (int i = 0; i < count; i++) {
      children.add(
        _ExpandingActionButton(
          position: i,
          bottomPadding: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  final int position;
  final double bottomPadding;
  final Animation<double> progress;
  final Widget child;

  const _ExpandingActionButton({
    Key? key,
    required this.position,
    required this.bottomPadding,
    required this.progress,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: AnimatedBuilder(
        animation: progress,
        builder: (context, child) {
          return child!;
        },
        child: FadeTransition(
          opacity: progress,
          child: child,
        ),
      ),
    );
  }
}
