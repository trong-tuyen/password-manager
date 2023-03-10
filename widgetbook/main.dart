import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/widgets/button.dart';
import 'package:flutter_practice/core/widgets/image_app.dart';
import 'package:flutter_practice/core/widgets/text.dart';
import 'package:flutter_practice/core/widgets/text_field.dart';
import 'package:flutter_practice/gen/assets.gen.dart';
import 'package:flutter_practice/gen/colors.gen.dart';

import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatefulWidget {
  const WidgetbookHotReload({super.key});

  @override
  State<WidgetbookHotReload> createState() => _WidgetbookHotReloadState();
}

class _WidgetbookHotReloadState extends State<WidgetbookHotReload> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final icons = <Option<String>>[
      Option(
        label: 'shield',
        value: Assets.images.shield.path,
      ),
      Option(
        label: 'gmailLogin',
        value: Assets.images.gmailLogin.path,
      ),
      Option(
        label: 'facebookLogin',
        value: Assets.images.facebookLogin.path,
      ),
      Option(
        label: 'fill',
        value: Assets.images.fill.path,
      ),
      Option(
        label: 'filter',
        value: Assets.images.filter.path,
      ),
      Option(
        label: 'mask',
        value: Assets.images.mask.path,
      ),
      Option(
        label: 'start',
        value: Assets.images.start.path,
      ),
      Option(
        label: 'twitter',
        value: Assets.images.twitter.path,
      ),
      Option(
        label: 'media',
        value: Assets.images.media.path,
      ),
      Option(
        label: 'paypal',
        value: Assets.images.paypal.path,
      ),
      Option(
        label: 'gmailCard',
        value: Assets.images.gmailCard.path,
      ),
      Option(
        label: 'facebookCard',
        value: Assets.images.facebookCard.path,
      ),
      Option(
        label: 'quora',
        value: Assets.images.quora.path,
      ),
      Option(
        label: 'upwork',
        value: Assets.images.upwork.path,
      ),
      Option(
        label: 'basecamp',
        value: Assets.images.basecamp.path,
      )
    ];

    return Widgetbook.material(
      devices: const [
        // iOS
        Apple.iPhone8,
        Apple.iPhone8Plus,

        Apple.iPhone11,
        Apple.iPhone11Pro,
        Apple.iPhone11ProMax,

        Apple.iPhone12,
        Apple.iPhone12Pro,
        Apple.iPhone12ProMax,

        Apple.iPhone13Mini,
        Apple.iPhone13,
        Apple.iPhone13Pro,
        Apple.iPhone13ProMax,

        // Android
        Samsung.s10,
        Samsung.s21ultra,
      ],
      appInfo: AppInfo(
        name: 'Password Manager Widgetbook',
      ),
      categories: [
        WidgetbookCategory(
          name: 'Widgets',
          widgets: [
            WidgetbookComponent(
              name: 'MPButton',
              useCases: [
                WidgetbookUseCase(
                  name: 'All buttons',
                  builder: (context) => SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CodeView(
                            title: 'Button Primary',
                            code: '''
  MPButton.primary(onPress: () {},
  text: text,),
''',
                          ),
                          const SizedBox(height: 10),
                          MPButton.primary(
                            text: context.knobs.text(
                              label: 'Text',
                              initialValue: 'Create New Account',
                            ),
                            onPress: () {},
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: 'Button Second',
                            code: '''
 MPButton.second(onPress: () {},
, text: text)
''',
                          ),
                          const SizedBox(height: 10),
                          MPButton.second(
                            text: context.knobs.text(
                              label: 'Text',
                              initialValue: 'Login',
                            ),
                            onPress: () {},
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: 'Button Card Password',
                            code: '''
MPButton.cardPassword(
 text: text,
 onPress: (){},
 width: width))
''',
                          ),
                          const SizedBox(height: 10),
                          MPButton.cardPassword(
                              text: context.knobs.text(
                                label: 'Text',
                                initialValue: 'Open app',
                              ),
                              onPress: () {},
                              width: 100),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: 'Button Text',
                            code: '''
GTButton.text(
  text: text,
  onPress: () {},
)
''',
                          ),
                          const SizedBox(height: 10),
                          MPButton.text(
                            text: context.knobs.text(
                              label: 'Text',
                              initialValue: 'Save',
                            ),
                            onPress: () {},
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: 'Button Floating',
                            code: '''
GTButton.text(
  text: text,
  onPress: () {},
)
''',
                          ),
                          const SizedBox(height: 10),
                          MPButton.floating(
                            onPress: () {},
                            heroTag: 'btn1',
                            child: Image.asset(
                              Assets.images.filter.path,
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'MPTextField',
              useCases: [
                WidgetbookUseCase(
                  name: 'TextField',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CodeView(
                          title: 'MPTextField',
                          code: '''
MPTextField(hintText:'hintText'),
''',
                        ),
                        MPTextField(
                          controller: controller,
                          title: context.knobs.text(
                            label: 'title',
                            initialValue: 'Email',
                          ),
                          hintText: context.knobs.text(
                            label: 'hintText',
                            initialValue: 'email@example.com',
                          ),
                          obscureText: context.knobs.boolean(
                            label: 'obscureText',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'MPText',
              useCases: [
                WidgetbookUseCase(
                  name: 'All Text in practice',
                  builder: (context) => SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CodeView(
                            title: '',
                            code: '''
SmallBody(text: text)
''',
                          ),
                          const SizedBox(height: 10),
                          SmallBody(
                            text: context.knobs.text(
                              label: 'text',
                              initialValue: 'webperts',
                            ),
                            color: ColorName.onPrimaryColor,
                            hasUpperCase: context.knobs.boolean(
                              label: 'hasUpperCase',
                            ),
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: '',
                            code: '''
MediumBody(text: text)
''',
                          ),
                          const SizedBox(height: 10),
                          MediumBody(
                            text: context.knobs.text(
                              label: 'text',
                              initialValue: 'Create New Account',
                            ),
                            color: ColorName.onPrimaryColor,
                            hasUpperCase: context.knobs.boolean(
                              label: 'hasUpperCase',
                            ),
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: '',
                            code: '''
LargeBody(text: text)
''',
                          ),
                          const SizedBox(height: 10),
                          LargeBody(
                            text: context.knobs.text(
                              label: 'text',
                              initialValue: 'Login with',
                            ),
                            color: ColorName.onPrimaryColor,
                            hasUpperCase: context.knobs.boolean(
                              label: 'hasUpperCase',
                            ),
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: '',
                            code: '''
 SmallLabel(text: text)
''',
                          ),
                          const SizedBox(height: 10),
                          MediumLabel(
                            text: context.knobs.text(
                              label: 'text',
                              initialValue: 'All',
                            ),
                            color: ColorName.onPrimaryColor,
                            hasUpperCase: context.knobs.boolean(
                              label: 'hasUpperCase',
                            ),
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: '',
                            code: '''
 MediumLabel(text: text)
''',
                          ),
                          const SizedBox(height: 10),
                          MediumLabel(
                            text: context.knobs.text(
                              label: 'text',
                              initialValue: 'Open app',
                            ),
                            color: ColorName.onPrimaryColor,
                            hasUpperCase: context.knobs.boolean(
                              label: 'hasUpperCase',
                            ),
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: '',
                            code: '''
LargeLabel(text: text)
''',
                          ),
                          const SizedBox(height: 10),
                          MediumLabel(
                            text: context.knobs.text(
                              label: 'text',
                              initialValue: 'Favorites',
                            ),
                            color: ColorName.onPrimaryColor,
                            hasUpperCase: context.knobs.boolean(
                              label: 'hasUpperCase',
                            ),
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: '',
                            code: '''
SubTitle(text: text)
''',
                          ),
                          const SizedBox(height: 10),
                          SubTitle(
                            text: context.knobs.text(
                              label: 'text',
                              initialValue: 'Manager',
                            ),
                            color: ColorName.onPrimaryColor,
                            hasUpperCase: context.knobs.boolean(
                              label: 'hasUpperCase',
                            ),
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: '',
                            code: '''
MainTitle(text: text)
''',
                          ),
                          const SizedBox(height: 10),
                          MainTitle(
                            text: context.knobs.text(
                              label: 'text',
                              initialValue: 'Password',
                            ),
                            color: ColorName.onPrimaryColor,
                            hasUpperCase: context.knobs.boolean(
                              label: 'hasUpperCase',
                            ),
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: '',
                            code: '''
LargeHeadline(text: text)
''',
                          ),
                          const SizedBox(height: 10),
                          LargeHeadline(
                            text: context.knobs.text(
                              label: 'text',
                              initialValue: 'Transparent & Secured',
                            ),
                            color: ColorName.onPrimaryColor,
                            hasUpperCase: context.knobs.boolean(
                              label: 'hasUpperCase',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Image app',
              useCases: [
                WidgetbookUseCase(
                  name: 'All image app in practice',
                  builder: (context) => ImageApp(
                      context.knobs.options(
                        label: 'Icon',
                        options: icons,
                      ),
                      const EdgeInsets.symmetric(horizontal: 50)),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Color',
              useCases: [
                WidgetbookUseCase(
                  name: 'All color in practice',
                  builder: (context) => SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: whiteToBlack.length * 30,
                          child: CardColor(data: whiteToBlack),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: primaryColor.length * 30,
                          child: CardColor(data: primaryColor),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: errorColor.length * 30,
                          child: CardColor(data: errorColor),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: cardColor.length * 30,
                          child: CardColor(data: cardColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
      themes: [
        WidgetbookTheme(name: 'Light', data: MPTheme.lightTheme),
        WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
      ],
    );
  }
}

void main() {
  runApp(
    const WidgetbookHotReload(),
  );
}

class CodeView extends StatefulWidget {
  const CodeView({
    required this.title,
    required this.code,
    super.key,
  });

  final String code;
  final String title;

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmallLabel(
              text: widget.title,
            ),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                  width: 130,
                  child: MPButton.text(
                    text: _isVisible ? 'hide code' : 'show code',
                    onPress: _toggleVisibility,
                  ),
                );
              },
            ),
          ],
        ),
        Visibility(
          visible: _isVisible,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallLabel(
                  text: widget.code,
                  color: ColorName.onSecondaryColor,
                  hasUpperCase: false),
              const Spacer(),
              CopyButton(text: widget.code),
            ],
          ),
        ),
      ],
    );
  }
}

class CopyButton extends StatelessWidget {
  const CopyButton({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return MPButton.text(
      text: 'Copy',
      onPress: () {
        Clipboard.setData(ClipboardData(text: text));
        const snackBar = SnackBar(content: Text('Copied to clipboard'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}

class CardColor extends StatelessWidget {
  const CardColor({
    required this.data,
    super.key,
  });

  final List<ColorInfo> data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Container(
              height: 40,
              width: size.width,
              color: data[index].color,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Row(
                children: [
                  SmallLabel(
                    text: data[index].hex,
                    color: index > 3
                        ? Theme.of(context).colorScheme.onBackground
                        : Theme.of(context).colorScheme.onSecondary,
                    hasUpperCase: false,
                  ),
                  const Spacer(),
                  SmallLabel(
                    text: data[index].name,
                    color: index > 3
                        ? Theme.of(context).colorScheme.onBackground
                        : Theme.of(context).colorScheme.onSecondary,
                    hasUpperCase: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorInfo {
  const ColorInfo({
    required this.color,
    required this.hex,
    required this.name,
  });
  final Color color;
  final String hex;
  final String name;
}

final whiteToBlack = <ColorInfo>[
  const ColorInfo(
    color: ColorName.backgroundColor,
    hex: '#FFFFFF',
    name: 'background',
  ),
  const ColorInfo(
    color: ColorName.onBackgroundColor,
    hex: '7150F1',
    name: 'onBackground',
  ),
  const ColorInfo(
    color: ColorName.primaryColor,
    hex: '#000000',
    name: 'primaryColor',
  ),
  const ColorInfo(
    color: ColorName.onPrimaryColor,
    hex: '#B69CF6',
    name: 'onPrimaryColor',
  ),
  const ColorInfo(
    color: ColorName.secondaryColor,
    hex: '#85C9FF',
    name: 'secondaryColor',
  ),
  const ColorInfo(
    color: ColorName.onSecondaryColor,
    hex: '#2196F3',
    name: 'onSecondaryColor',
  ),
  const ColorInfo(
    color: ColorName.surfaceColor,
    hex: '#6F6F6F',
    name: 'surfaceColor',
  ),
  const ColorInfo(
    color: ColorName.onSurfaceColor,
    hex: '#3E3E3E',
    name: 'onSurfaceColor',
  ),
  const ColorInfo(
    color: ColorName.visibilityColor,
    hex: '#939393',
    name: 'onTertiary',
  ),
  const ColorInfo(
    color: ColorName.onPrimaryBackgroundColor,
    hex: '#939393',
    name: 'tertiaryContainer',
  ),
  const ColorInfo(
    color: ColorName.secondaryBackgroundColor,
    hex: '#939393',
    name: 'onTertiaryContainer',
  ),
];

final primaryColor = <ColorInfo>[
  const ColorInfo(
    color: ColorName.primaryColor,
    hex: '#FF7D0D',
    name: 'primary',
  ),
];

final errorColor = <ColorInfo>[
  const ColorInfo(
    color: ColorName.errorColor,
    hex: '#FF0000',
    name: 'error',
  ),
  const ColorInfo(
    color: ColorName.onErrorColor,
    hex: '#FFFFFF',
    name: 'onErrorColor',
  ),
];
final cardColor = <ColorInfo>[
  ColorInfo(
    color: MPTheme.cardTwitterColor,
    hex: 'Color.alphaBlend',
    name: 'cardTwitterColor',
  ),
  ColorInfo(
    color: MPTheme.cardMediaColor,
    hex: 'Color.alphaBlend',
    name: 'cardMediaColor',
  ),
  ColorInfo(
    color: MPTheme.cardGmailColor,
    hex: 'Color.alphaBlend',
    name: 'cardGmailColor',
  ),
  ColorInfo(
    color: MPTheme.cardBaseCampColor,
    hex: 'Color.alphaBlend',
    name: 'cardBaseCampColor',
  ),
  ColorInfo(
    color: MPTheme.cardUpworkColor,
    hex: 'Color.alphaBlend',
    name: 'visibilityColor',
  ),
];
