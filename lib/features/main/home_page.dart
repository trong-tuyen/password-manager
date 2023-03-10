import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/widgets/alert_dialog.dart';
import 'package:flutter_practice/features/auth/login/bloc/login_bloc.dart';
import 'package:flutter_practice/features/main/app_bar.dart';
import 'package:flutter_practice/features/main/bloc/card_password_bloc.dart';
import 'package:flutter_practice/features/main/bloc/card_password_event.dart';
import 'package:flutter_practice/features/main/bloc/card_password_state.dart';
import 'package:flutter_practice/features/main/bloc/filter_card_password/filter_card_password_bloc.dart';
import 'package:flutter_practice/features/main/scaffold.dart';
import 'package:flutter_practice/core/repositories/data.dart';
import 'package:flutter_practice/core/widgets/navigation_bar.dart';
import 'package:flutter_practice/features/welcome/welcome_page.dart';
import 'package:flutter_practice/generated/l10n.dart';
import 'password_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/HomePage';
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    final size = MediaQuery.of(context).size;
    // Calculate the width of the Navigation Bar
    final sizeNavigation = size.width / 5 + 10;
    return BlocProvider(
      create: (context) => CardPasswordBloc()..add(FetchPassword()),
      child: MPScaffoldHomePage(
        child: MultiBlocListener(
          listeners: [
            // Handle when the user logs out
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LogoutSuccess) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomePage(),
                      ));
                }
              },
            ),
            // Handle when filtering card passwords
            BlocListener<FilterCardPasswordBloc, FilterCardPasswordState>(
              listener: (context, state) {
                if (state is FilterCardPasswordSuccess) {
                  setState(() {
                    cardPasswords = cardPasswordsFilter;
                  });
                }
              },
            ),
          ],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Build the Navigation Bar widget
              SizedBox(
                  width: sizeNavigation,
                  height: size.height,
                  child: buildFilter()),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height / 19,
                  ),
                  SizedBox(
                      width: size.width - sizeNavigation,
                      child: const AppBarHomePage()),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<CardPasswordBloc, CardPasswordState>(
                    listener: (context, state) {
                      if (state is CardPasswordError) {
                        // Show an alert if there is an error getting the password list
                        AlertWidget.show(context, S.of(context).notification,
                            S.of(context).listPasswordBlank, true);
                      }
                    },
                    builder: (context, state) {
                      if (state is CardPasswordLoading) {
                        // Show a progress indicator
                        //while the password list is being fetched
                        return InkWell(
                          onTap: loadCardPassword(context),
                          child: CircularProgressIndicator(
                            backgroundColor:
                                MPTheme.lightTheme.colorScheme.onBackground,
                          ),
                        );
                      }
                      // If the password list has been successfully fetched,
                      //display it
                      if (state is CardPasswordSuccess) {
                        return SizedBox(
                          height: size.height * 8.6 / 10,
                          width: size.width - sizeNavigation - 10,
                          child: PasswordList(
                            width: size.width - sizeNavigation - 10,
                            listCardPassword: state.listCardPassword
                          ),
                        );
                      }
                      return SizedBox.fromSize();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFilter() => NavigationBarWidget(
        // Call filterPassword function when the category is changed.
        onChanged: filterPassword,
      );

  void filterPassword(String categorySelected) {
    // Dispatch an event to FilterCardPasswordBloc to filter cards based on the selected category.
    BlocProvider.of<FilterCardPasswordBloc>(context).add(
      FilterCardPassword(valueFilterCategory: categorySelected),
    );
  }

  loadCardPassword(BuildContext context) {
    // Dispatch an event to CardPasswordBloc to load cards from the API.
    BlocProvider.of<CardPasswordBloc>(context).add(FetchPassword());
  }
}
