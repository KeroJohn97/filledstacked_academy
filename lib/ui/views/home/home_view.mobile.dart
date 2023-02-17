import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/home/home_viewmodel.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/gradient_title.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/input_field.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/notify_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stacked/stacked.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  final TextEditingController emailController;
  const HomeViewMobile({Key? key, required this.emailController})
      : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 50,
          ),
          children: [
            Text(
              'FilledStacks Academy',
              style: GoogleFonts.openSans(
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            verticalSpaceLarge,
            const HomeTitle(),
            verticalSpaceTiny,
            Column(
              children: [
                Text(
                  'Build amazing software, the right way.',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                GradientText(
                  ' Sign up to be notified',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  colors: kgTitle,
                ).scaleOnHover.moveOnHover(y: 5),
              ],
            ),
            verticalSpaceLarge,
            InputField(controller: emailController),
            verticalSpaceMedium,
            const NotifyButton(),
            verticalSpaceMedium,
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/master-web-hero-image.png',
                height: 650,
                fit: BoxFit.cover,
              ),
            ).scaleOnHover.moveOnHover(y: 10, x: -20)
          ],
        ));
  }
}
