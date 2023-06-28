import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/responsive/responsive_layout.dart';
import '../theme/text_theme.dart';
import 'custom_elevated_button_icon_widget.dart';

class CustomMovieCardPageViewsWidget extends StatelessWidget {
  const CustomMovieCardPageViewsWidget({
    super.key,
    required this.imageUrl,
    this.future,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
  });
  final Future<String>? future;
  final String title;
  final String voteAverage;
  final String imageUrl;
  final String overview;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 16),
          ClipRRect(
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
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: MyTextTheme.defaultStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.yellow,
                  ),
                  const SizedBox(width: 4),
                  FutureBuilder<String>(
                    future: future,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        String genre = snapshot.data!;
                        return Text(
                          '$voteAverage  |  $releaseDate • $genre • Movie',
                          style: MyTextTheme.defaultStyle(
                            color: Colors.grey[300]!,
                            fontSize: 12,
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                child: Text(
                  overview,
                  maxLines: ResponsiveLayout.isPhone(context) ? 3 : 4,
                  style: MyTextTheme.defaultStyle(
                    color: Colors.grey[100]!,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  CustomElevatedButtonIconWidget(
                    onPressed: () {},
                    side: BorderSide.none,
                    backgroundColor: Colors.purple,
                  ),
                  ResponsiveLayout.isPhone(context)
                      ? const SizedBox.shrink()
                      : const SizedBox(width: 12),
                  ResponsiveLayout.isPhone(context)
                      ? const SizedBox.shrink()
                      : CustomElevatedButtonIconWidget(
                          onPressed: () {},
                          label: 'Watch Trailer',
                          icon: Icons.play_circle_outline,
                          side: BorderSide.none,
                          backgroundColor: Colors.grey[800]!,
                        ),
                  const SizedBox(width: 12),
                  CustomElevatedButtonIconWidget(
                    onPressed: () {},
                    label: 'Add Watchlist',
                    icon: Icons.turned_in_not,
                    side: const BorderSide(color: Colors.white),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderPageViewWidget extends StatelessWidget {
  const HeaderPageViewWidget({
    super.key,
    this.previousPage,
    this.nextPage,
    this.title = 'Title',
  });
  final void Function()? previousPage;
  final void Function()? nextPage;

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyTextTheme.defaultStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: previousPage,
              child: const Icon(
                Icons.arrow_back_ios,
                size: 24.0,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: nextPage,
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 24.0,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
