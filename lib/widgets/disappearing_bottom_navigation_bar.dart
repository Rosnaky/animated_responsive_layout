import "package:animated_responsive_layout/animations.dart";
import "package:animated_responsive_layout/transitions/bottom_bar_transition.dart";
import "package:flutter/material.dart";

import "../destinations.dart";

class DisappearingBottomNavigationBar extends StatelessWidget {
  const DisappearingBottomNavigationBar(
      {super.key,
      required this.selectedIndex,
      this.onDestinationSelected,
      required this.barAnimation});

  final BarAnimation barAnimation;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return BottomBarTransition(
      animation: barAnimation,
      backgroundColor: Colors.white,
      child: NavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        destinations: destinations
            .map((d) =>
                NavigationDestination(icon: Icon(d.icon), label: d.label))
            .toList(),
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
