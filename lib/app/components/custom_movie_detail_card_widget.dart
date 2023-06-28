import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/responsive/responsive_layout.dart';
import '../theme/text_theme.dart';
import 'custom_elevated_button_icon_widget.dart';

class CustomMovieDetailsCardWidget extends StatelessWidget {
  final Future<String>? future;
  final String title;
  final String voteAverage;
  final String imageUrl;
  final String overview;
  final String releaseDate;

  final Color addNewGradientColor;
  final double? width;
  final double? height;
  final bool customDetails;
  final EdgeInsetsGeometry? paddingDetails;

  const CustomMovieDetailsCardWidget({
    Key? key,
    this.future,
    required this.title,
    required this.voteAverage,
    required this.imageUrl,
    required this.overview,
    this.height,
    this.customDetails = false,
    this.paddingDetails,
    this.addNewGradientColor = Colors.transparent,
    required this.releaseDate,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        var isPhone = ResponsiveLayout.isPhone(context);
        var isTablet = ResponsiveLayout.isTablet(context);
        return SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Container(
                width: Get.width,
                height: double.infinity,
                decoration: const BoxDecoration(),
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
              Container(
                width: Get.width,
                height: double.infinity,
                padding: isPhone || isTablet
                    ? const EdgeInsets.symmetric(horizontal: 16)
                    : constraints.maxWidth <= 1000
                        ? const EdgeInsets.symmetric(horizontal: 24)
                        : const EdgeInsets.symmetric(horizontal: 100),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      addNewGradientColor,
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
                                '${voteAverage.toString()}  |  $releaseDate • $genre • Movie',
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
                      width: 550,
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
                        isPhone
                            ? const SizedBox.shrink()
                            : const SizedBox(width: 12),
                        isPhone
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
              ),
            ],
          ),
        );
      }),
    );
  }
}
