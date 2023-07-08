import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/text_theme.dart';
import '../../../../theme/utils/my_strings.dart';
import '../../../responsive/responsive_layout.dart';
import '../controllers/details_movie_controller.dart';

class CastViews extends GetView<DetailsMovieController> {
  const CastViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isPhone = ResponsiveLayout.isPhone(context);
    var isTablet = ResponsiveLayout.isTablet(context);
    return LayoutBuilder(
      builder: (context, constraints) => Obx(
        () {
          if (controller.isLoadingCreditMovie.value) {
            return const CupertinoActivityIndicator();
          } else {
            var cast = controller.creditMovie;
            return Padding(
              padding: isPhone || isTablet
                  ? const EdgeInsets.symmetric(horizontal: 16)
                  : constraints.maxWidth <= 1000
                      ? const EdgeInsets.symmetric(horizontal: 24)
                      : const EdgeInsets.symmetric(horizontal: 100),
              child: Wrap(
                spacing: 24.0,
                runSpacing: 24.0,
                children: List<Widget>.generate(
                  (cast?.length ?? 0).clamp(0, 4),
                  (index) => Builder(
                    builder: (context) {
                      final artist = cast?[index];
                      if (artist != null) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            artist.profilePath != null
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      "${MyString.imageUrlOrigin}${artist.profilePath}",
                                    ),
                                  )
                                : const CircleAvatar(
                                    backgroundColor: Colors.purple,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${artist.name}",
                                  overflow: TextOverflow.clip,
                                  style: MyTextTheme.defaultStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "${artist.character}",
                                  overflow: TextOverflow.clip,
                                  style: MyTextTheme.defaultStyle(
                                    color: Colors.grey[300]!,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox(); // Widget kosong jika artist null
                      }
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
