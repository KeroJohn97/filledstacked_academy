import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

enum VideoPlatform {
  vimeo(src: 'https://player.vimeo.com/video/'),
  youtube(src: 'https://www.youtube.com/embed/');

  final String src;
  const VideoPlatform({this.src = 'https://player.vimeo.com/video/'});
}

class IframePlayer extends StatefulWidget {
  final String videoId;
  final String videoThumbnail;
  final VideoPlatform platform;
  const IframePlayer({
    super.key,
    required this.videoId,
    required this.videoThumbnail,
    this.platform = VideoPlatform.vimeo,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<IframePlayer> {
  bool webView = true;
  bool webViewJs = true;

  @override
  Widget build(BuildContext context) =>
      // CheckboxListTile(
      //   value: webView,
      //   onChanged: (v) => setState(() => webView = v == true),
      //   title: const HtmlWidget('<var>.webView</var>'),
      //   subtitle: const Text('Renders web view, default ❌'),
      // ),
      // CheckboxListTile(
      //   value: webViewJs,
      //   onChanged: (v0) => setState(() {
      //     final v = v0 == true;
      //     if (v) {
      //       webView = true;
      //     }
      //     webViewJs = v;
      //   }),
      //   title: const HtmlWidget('<var>.webViewJs</var>'),
      //   subtitle: const Text('Allows JavaScript execution, default ✅'),
      // ),
      Align(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HtmlWidget(
            '''
                  <iframe 
                  height= ${MediaQuery.of(context).size.height * 0.55} 
                  width=${MediaQuery.of(context).size.width * 0.8} 
                  src="${widget.platform.src}${widget.videoId}" 
                  style="border:none; 
                  allow:autoplay,fullscreen; position:absolute; 
                  right:0px;" 
                  ></iframe>
                  ''',
            customWidgetBuilder: (element) => SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: HtmlWidget(element.outerHtml),
              ),
            ),
            factoryBuilder: () => _WidgetFactory(
              webView: webView,
              webViewJs: webViewJs,
            ),
            rebuildTriggers: RebuildTriggers([webView, webViewJs]),
          ),
        ),
      );
}

class _WidgetFactory extends WidgetFactory {
  @override
  final bool webView;

  @override
  final bool webViewJs;

  _WidgetFactory({
    required this.webView,
    required this.webViewJs,
  });
}
