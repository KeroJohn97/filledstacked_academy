import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/home/home_viewmodel.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/home_image.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/home_subtitle.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/home_title.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: ListView(
          children: const [
            HomeTitle(),
            verticalSpaceTiny,
            HomeSubtitle(),
            verticalSpaceLarge,
            HomeImage(),
          ],
        ),
      ),
    );
  }
}
