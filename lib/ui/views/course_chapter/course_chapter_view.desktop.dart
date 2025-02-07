import 'package:filledstacked_academy/ui/common/app_strings.dart';
import 'package:filledstacked_academy/ui/widgets/common/course_price_card.dart';
import 'package:filledstacked_academy/ui/widgets/common/google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/shared_styles.dart';
import '../../common/ui_helpers.dart';
import 'course_chapter_viewmodel.dart';

part '_widgets.dart';

class CourseChapterViewDesktop extends ViewModelWidget<CourseChapterViewModel> {
  const CourseChapterViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CourseChapterViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: viewModel.loadingChapter
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenHeight(context) * 0.7,
                    alignment: Alignment.center,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/master-web-hero-image.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                          color: viewModel.hasUser
                              ? null
                              : Colors.white.withOpacity(0.2),
                          colorBlendMode: viewModel.hasUser
                              ? BlendMode.srcIn
                              : BlendMode.modulate,
                        ),
                        Center(
                          child: viewModel.hasUser
                              ? Text(viewModel.chapterId, style: ktsTitle)
                              : _CourseChapterUserNotLogged(),
                        ),
                        if (!viewModel.hasUser)
                          Positioned(
                            bottom: 0.0,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const _CourseChapterArrow(),
                                  Column(
                                    children: const [
                                      CoursePriceCard(
                                        price: '35',
                                        discountPrice: '20',
                                        discountPeriod: '1 Week only',
                                      ),
                                      GoogleSignIn(
                                        eventName: ksCTASignInToView,
                                        title: ksCTASignInToView,
                                      ),
                                      verticalSpaceSmall,
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  verticalSpaceLarge,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('💻', style: ktsTitle2),
                      horizontalSpaceSmall,
                      Expanded(
                        child: GradientText(
                          viewModel.chapter?.title ?? 'Loading ...',
                          colors: kgTitle,
                          style: ktsTitle2,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  Text(
                    viewModel.chapter?.description ?? '...',
                    style: ktsBodyRegular.copyWith(color: kcLightGrey),
                  ),
                  verticalSpaceSmall,
                ],
              ),
            ),
    );
  }
}
