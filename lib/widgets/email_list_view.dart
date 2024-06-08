import 'package:animated_responsive_layout/models/models.dart';
import 'package:flutter/material.dart';
import 'search_bar.dart' as search_bar;
import 'email_widget.dart';
import '../models/blob.dart' as blob;

class EmailListView extends StatelessWidget {
  const EmailListView(
      {super.key,
      this.selectedIndex,
      required this.currentUser,
      this.onSelected});
  final int? selectedIndex;
  final ValueChanged<int>? onSelected;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            search_bar.SearchBar(currentUser: currentUser),
            const SizedBox(
              height: 8,
            ),
            ...List.generate(blob.emails.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: EmailWidget(
                  email: blob.emails[index],
                  onSelected: onSelected != null
                      ? () {
                          onSelected!(index);
                        }
                      : null,
                  isSelected: selectedIndex == index,
                ),
              );
            })
          ],
        ));
  }
}
