import 'package:coctail_book/widgets/app_navigation.dart';
import 'package:coctail_book/utilities/screen_size.dart';
import 'package:flutter/material.dart';

class AppPageWrapper extends StatelessWidget {
  const AppPageWrapper({
    super.key,
    required this.page,
  });

  final Widget page;

  @override
  Widget build(BuildContext context) {
    var size = getScreenSize(context);

    return Scaffold(
      body: Flex(
          direction: size.mobileOrTablet ? Axis.vertical : Axis.horizontal,
          verticalDirection: VerticalDirection.up,
          children: [
            AppNavigation(),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.background,
                child: page,
              ),
            ),
          ]),
    );
  }
}
