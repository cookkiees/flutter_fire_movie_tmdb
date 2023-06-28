import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/details_movie_controller.dart';

class DetailsMoviePage extends GetView<DetailsMovieController> {
  const DetailsMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailsPage'),
      ),
      body: const SafeArea(
        child: Text('DetailsController'),
      ),
    );
  }
}
