import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/widgets/alert_dialog.dart';
import 'package:flutter_practice/core/widgets/button.dart';
import 'package:flutter_practice/features/auth/login/bloc/login_bloc.dart';
import 'package:flutter_practice/generated/l10n.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/widgets/text.dart';

/// AppBar for home page
class AppBarHomePage extends StatelessWidget {
  const AppBarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MediumLabel(
          text: S.of(context).all,
          color: MPTheme.lightTheme.colorScheme.surface,
          hasUpperCase: false,
        ),
        const SizedBox(
          width: 20,
        ),
        MediumLabel(
          text: S.of(context).recent,
          color: MPTheme.lightTheme.colorScheme.surface,
          fontWeight: FontWeight.w400,
          hasUpperCase: false,
        ),
        const Spacer(),
        MPButton.floating(
          onPress: () {
            AlertConfirmWidget.show(
                context: context,
                title: S.of(context).logout,
                message: S.of(context).messageLogout,
                onPressCancel: () {
                  Navigator.of(context).pop();
                },
                onPressYes: () {
                  // Log the user out
                  BlocProvider.of<LoginBloc>(context).add(const LogOutEvent());
                });
          },
          heroTag: 'btn2',
          child: Icon(Icons.login_outlined,
              color: MPTheme.lightTheme.colorScheme.surface),
          //Fix me:
          //   child: Image.asset(
          //     Assets.images.filter.path,
          //     width: 40,
          //     height: 40,
          //   ),
        )
      ],
    );
  }
}
