import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/text_theme.dart';

class CustomMovieCardWidget extends StatelessWidget {
  const CustomMovieCardWidget({
    super.key,
    this.onTap,
    this.future,
    this.voteAverage = '',
    required this.title,
    required this.imageUrl,
    this.width = 250,
    this.height = 300,
    this.border,
    this.icon = Icons.star,
    this.iconColor = Colors.yellow,
    this.releaseDate = '',
  });
  final double? width;
  final double? height;
  final String? voteAverage;
  final String title;
  final String imageUrl;
  final String? releaseDate;
  final IconData icon;
  final Color iconColor;
  final BoxBorder? border;
  final Future<String>? future;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  placeholder: (context, url) => const Center(
                    child: CupertinoActivityIndicator(
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error,
                      size: 24.0,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: 300,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: MyTextTheme.defaultStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(icon, size: 16, color: iconColor),
                      const SizedBox(width: 3),
                      FutureBuilder<String>(
                        future: future,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            String genre = snapshot.data!;
                            return Text(
                              '$voteAverage | $releaseDate • $genre • Movie',
                              style: MyTextTheme.defaultStyle(
                                color: Colors.grey[300]!,
                                fontSize: 10,
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
