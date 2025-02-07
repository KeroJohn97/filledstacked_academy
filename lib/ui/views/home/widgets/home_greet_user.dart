import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stacked/stacked.dart';

import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/home/home_viewmodel.dart';

class HomeGreetUser extends ViewModelWidget<HomeViewModel> {
  const HomeGreetUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    if (!viewModel.hasUser) return const SizedBox.shrink();

    return GestureDetector(
      onTap: viewModel.navigateToUserProfile,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              'Welcome, ',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w700,
                fontSize: 60,
              ),
              maxLines: 1,
              minFontSize: 20,
              stepGranularity: 0.1,
            ),
            Row(
              children: [
                if (viewModel.currentUser!.hasProfilePicture) ...[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      viewModel.currentUser!.profilePicture!,
                    ),
                    radius: 30,
                  ),
                  horizontalSpaceSmall,
                ],
                GradientText(
                  viewModel.currentUser!.fullName,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                  colors: kgTitle,
                ),
              ],
            ),
          ],
        ),
      ),
    ).showCursorOnHover;
  }
}
