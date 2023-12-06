import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/widgets/common/iframe_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../common/ui_helpers.dart';

class CourseLandingTrailer extends StatelessWidget {
  const CourseLandingTrailer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: kIsWeb
                ? const IframePlayer(
                    videoId: '783455878',
                    videoThumbnail: 'assets/master-web-hero-image.png',
                  )
                : const Text('not supported'),
          ),
        ),
        verticalSpaceLarge,
        Text(
          'MASTER\nFLUTTER\nON THE WEB',
          style: ktsTitle,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
