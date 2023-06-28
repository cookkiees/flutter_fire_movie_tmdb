import 'package:flutter/material.dart';
import 'package:flutter_fire_movie/app/modules/responsive/responsive_layout.dart';

import '../theme/text_theme.dart';

class CustomElevatedButtonIconWidget extends StatelessWidget {
  const CustomElevatedButtonIconWidget({
    super.key,
    this.height = 40,
    this.icon = Icons.play_circle,
    this.label = 'Play Now',
    this.onPressed,
    this.backgroundColor = Colors.blue,
    this.side = const BorderSide(),
  });
  final double height;
  final IconData icon;
  final String label;
  final BorderSide side;
  final Color backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var isPhone = ResponsiveLayout.isPhone(context);
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: side,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: isPhone ? 16 : 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: MyTextTheme.defaultStyle(
                color: Colors.white,
                fontSize: isPhone ? 12 : 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
