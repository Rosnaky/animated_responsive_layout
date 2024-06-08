import 'dart:ui';

import 'package:animated_responsive_layout/animations.dart';
import 'package:flutter/material.dart';

class AnimatedFloatingActionButton extends StatefulWidget {
  const AnimatedFloatingActionButton(
      {super.key,
      required this.animation,
      this.onPressed,
      this.child,
      this.elevation});
  final Animation<double> animation;
  final VoidCallback? onPressed;
  final Widget? child;
  final double? elevation;

  @override
  State<AnimatedFloatingActionButton> createState() =>
      _AnimatedFloatingActionButtonState();
}

class _AnimatedFloatingActionButtonState
    extends State<AnimatedFloatingActionButton> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  late final Animation<double> _scaleAnimation =
      ScaleAnimation(parent: widget.animation);
  late final Animation<double> _shapeAnimation =
      ScaleAnimation(parent: widget.animation);

  @override
  Widget build(BuildContext build) {
    return ScaleTransition(
        scale: _scaleAnimation,
        child: FloatingActionButton(
          elevation: widget.elevation,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(lerpDouble(30, 15, _shapeAnimation.value)!))),
          onPressed: widget.onPressed,
          backgroundColor: _colorScheme.tertiaryContainer,
          foregroundColor: _colorScheme.onTertiaryContainer,
          child: widget.child,
        ));
  }
}
