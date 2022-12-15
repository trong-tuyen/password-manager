import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:flutter_practice/themes/dark_theme.dart';
import 'package:flutter_practice/themes/light_theme.dart';
import 'package:flutter_practice/widgets/record_password.dart';
import 'package:flutter_practice/widgets/logo.dart';
import 'package:flutter_practice/widgets/icon_login.dart';
import 'package:flutter_practice/widgets/text_content.dart';

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
              name: '$IconLogin',
              useCases: [
                WidgetbookUseCase(
                  name: 'Facebook',
                  builder: (context) => IconLogin(),
                ),
                WidgetbookUseCase(
                  name: 'Gmail',
                  builder: (context) => IconLogin(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Record Password',
              useCases: [
                WidgetbookUseCase(
                  name: 'Twiter',
                  builder: (context) =>RecordPassword(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Text content',
              useCases: [
                WidgetbookUseCase(
                  name: 'Services',
                  builder: (context) => TextContent(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: '$Logo',
              useCases: [
                WidgetbookUseCase(
                    name: 'Logo', builder: (context) => const Logo()),
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
