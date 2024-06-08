import "package:animated_responsive_layout/animations.dart";
import 'package:animated_responsive_layout/transitions/nav_rail_transition.dart';
import "package:animated_responsive_layout/widgets/animated_floating_action_button.dart";
import "package:flutter/material.dart";

import "../destinations.dart";

class DisappearingNavigationRail extends StatelessWidget {
  const DisappearingNavigationRail(
      {super.key,
      required this.backgroundColor,
      required this.selectedIndex,
      required this.railAnimation,
      required this.railFabAnimation,
      this.onDestinationSelected});
  final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final RailAnimation railAnimation;
  final RailFabAnimation railFabAnimation;

  @override
  Widget build(BuildContext context) {
    return NavRailTransition(
      animation: railAnimation,
      backgroundColor: backgroundColor,
      child: NavigationRail(
        selectedIndex: selectedIndex,
        backgroundColor: backgroundColor,
        onDestinationSelected: onDestinationSelected,
        leading: Column(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            const SizedBox(
              height: 8,
            ),
            AnimatedFloatingActionButton(
                animation: railFabAnimation,
                elevation: 0,
                onPressed: () {},
                child: const Icon(Icons.add))
          ],
        ),
        groupAlignment: -0.85,
        destinations: destinations
            .map((d) => NavigationRailDestination(
                icon: Icon(d.icon), label: Text(d.label)))
            .toList(),
      ),
    );
  }
}
