import 'package:coctail_book/widgets/app_navigation.dart';
import 'package:coctail_book/widgets/screen_size.dart';
import 'package:flutter/material.dart';

class AppPageWrapper extends StatelessWidget {
  const AppPageWrapper({
    super.key,
    required this.page,
  });

  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
          direction: getSize(context) == ScreenSize.tabletOrDesktop
              ? Axis.horizontal
              : Axis.vertical,
          verticalDirection: VerticalDirection.up,
          children: [
            AppNavigation(),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ]),
    );
  
  }
}
