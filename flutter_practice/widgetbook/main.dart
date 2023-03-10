import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:flutter_practice/themes/dark_theme.dart';
import 'package:flutter_practice/themes/light_theme.dart';
import 'package:flutter_practice/widgets/record_password.dart';
import 'package:flutter_practice/widgets/icon_app.dart';
import 'package:flutter_practice/widgets/text_content.dart';
import 'package:flutter_practice/widgets/button.dart';

void main() {
  runApp(
    const WidgetbookHotReload(),
  );
}

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      categories: [
        WidgetbookCategory(
          name: 'widgets',
          widgets: [
            WidgetbookComponent(
              name: 'Icon App',
              useCases: [
                WidgetbookUseCase(
                  name: 'Shield',
                  builder: (context) => IconApp('assets/images/shield.png',
                      EdgeInsets.only(left: 60, bottom: 70)),
                ),
                WidgetbookUseCase(
                  name: 'Facebook',
                  builder: (context) => IconApp(
                      'assets/images/facebook.png', EdgeInsets.only(left: 140)),
                ),
                WidgetbookUseCase(
                  name: 'Gmail',
                  builder: (context) => IconApp(
                      'assets/images/gmail.png', EdgeInsets.only(left: 20)),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Record Password',
              useCases: [
                WidgetbookUseCase(
                  name: 'Twiter',
                  builder: (context) => RecordPassword(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Text content',
              useCases: [
                WidgetbookUseCase(
                  name: 'PASSWORD',
                  builder: (context) => TextContent(
                      'PASSWORD', Colors.white, 25, FontWeight.bold),
                ),
                WidgetbookUseCase(
                  name: 'MANAGER',
                  builder: (context) => TextContent(
                      'MANAGER', Colors.white, 22, FontWeight.normal),
                ),
                WidgetbookUseCase(
                  name: 'Transparent & Secured.',
                  builder: (context) => TextContent(
                      'Transparent & Secured.', null, 31, FontWeight.normal),
                ),
                WidgetbookUseCase(
                  name: 'Only you can see your personal data',
                  builder: (context) => TextContent(
                      'Only you can see your personal data',
                      Color(0xff85C9FF),
                      18,
                      FontWeight.normal),
                ),
                WidgetbookUseCase(
                  name: 'Login with',
                  builder: (context) =>
                      TextContent('Login with', null, 18, FontWeight.normal),
                ),
                WidgetbookUseCase(
                  name: 'Or',
                  builder: (context) =>
                      TextContent('Or', Colors.white70, 18, FontWeight.normal),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Button',
              useCases: [
                WidgetbookUseCase(
                    name: 'Create New Account',
                    builder: (context) =>
                        Button('Create New Account', Colors.blue)),
                WidgetbookUseCase(
                    name: 'Sing In',
                    builder: (context) => const Button('Sing In', null)),
              ],
            ),
          ],
        )
      ],
      appInfo: AppInfo(
        name: 'Password Manager',
      ),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        )
      ],
    );
  }
}
