import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/widgets/text_shadow.dart';

class CardPostBlog extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String image;
  final String url;
  final VoidCallback openContainer;
  const CardPostBlog({
    Key? key,
    required this.title,
    this.subtitle,
    required this.image,
    required this.url,
    required this.openContainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _footerPost(context);
  }

  Widget get _photoPost => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      );

  Widget _footerPost(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.80,
        child: Stack(
          children: [
            GridTile(
              footer: Material(
                color: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16.0)),
                ),
                clipBehavior: Clip.antiAlias,
                child: GridTileBar(
                  backgroundColor: Colors.black54,
                  title: _GridTitleText(
                    title,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                  subtitle: subtitle != null
                      ? _GridTitleText(
                          subtitle!,
                          fontSize: 12.0,
                        )
                      : null,
                ),
              ),
              child: _photoPost,
            ),
            _AnimatedOpacityWrapper(
              url: url,
              openContainer: openContainer,
            ),
          ],
        ),
      );
}

class _GridTitleText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;

  const _GridTitleText(this.text, {this.fontWeight, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: TextShadow(
        text: text,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}

class _AnimatedOpacityWrapper extends StatefulWidget {
  final String url;
  final VoidCallback openContainer;
  const _AnimatedOpacityWrapper(
      {Key? key, required this.url, required this.openContainer})
      : super(key: key);

  @override
  State<_AnimatedOpacityWrapper> createState() =>
      _AnimatedOpacityWrapperState();
}

class _AnimatedOpacityWrapperState extends State<_AnimatedOpacityWrapper> {
  double _opacityLevel = 0.0;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        _opacityLevel = _opacityLevel == 0.0 ? 0.9 : 0.0;
        _isTapped = !_isTapped;
      }),
      child: AnimatedOpacity(
        opacity: _opacityLevel,
        duration: const Duration(milliseconds: 300),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Center(
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isTapped = !_isTapped;
                  _opacityLevel = _opacityLevel == 0.0 ? 0.9 : 0.0;
                });

                widget.openContainer.call();
              },
              child: Text(
                AppLocalizations.of(context)?.action_read_post.toUpperCase() ??
                    "action_read_post",
                style: const TextStyle(
                    color: K.accentColor, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
