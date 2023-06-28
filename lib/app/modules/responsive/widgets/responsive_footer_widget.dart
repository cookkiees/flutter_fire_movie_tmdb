import 'package:flutter/material.dart';

import '../../../theme/text_theme.dart';

class ResponsiveFooterWidget extends StatelessWidget {
  const ResponsiveFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Container(
          height: 200,
          width: double.infinity,
          padding: constraints.maxWidth <= 1050
              ? const EdgeInsets.all(24)
              : const EdgeInsets.symmetric(horizontal: 100, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Our Platform is Trust by millions & features\nbest updates movie all around the world',
                    style: MyTextTheme.defaultStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        'Privacy policy',
                        style: MyTextTheme.defaultStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 24),
                      Text(
                        'Term of service',
                        style: MyTextTheme.defaultStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 24),
                      Text(
                        'Language',
                        style: MyTextTheme.defaultStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
