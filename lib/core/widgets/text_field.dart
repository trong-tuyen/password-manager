import 'package:flutter/material.dart';
import 'package:flutter_practice/core/repositories/data.dart';
import 'package:flutter_practice/core/themes/theme.dart';
import 'package:flutter_practice/core/validators/validators.dart';
import 'text.dart';

class MPTextField extends StatefulWidget {
  const MPTextField({
    required this.controller,
    required this.hintText,
    this.title = '',
    this.obscureText = false,
    this.onpress,
    super.key,
  });

  final TextEditingController controller;
  final String title;
  final bool? obscureText;
  final String hintText;
  final Function? onpress;

  @override
  State<MPTextField> createState() => _MPTextFieldState();
}

class _MPTextFieldState extends State<MPTextField> {
  bool _obscureText = false;
  String? errorValueValidator = '';

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText!;
  }

  final _focusNode = FocusNode();

  // method to validate the input field value and return null if the value passes the validation
  String? validate(String text) {
    if (widget.title == 'Email') {
      return Validators.validatorEmail(text);
    } else if (widget.title == 'Password') {
      return Validators.validatorPassword(text);
    } else if (widget.title == 'Confirm Password') {
      return Validators.validatorConfirmPassword(user.password, text);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: MediumLabel(
              text: widget.title, // if title is empty, padding is still here
              color: MPTheme.lightTheme.colorScheme.onSurface,
              hasUpperCase: false,
            ),
          ),
          SizedBox(
            child: TextFormField(
              autofocus: true,
              controller: widget.controller,
              focusNode: _focusNode,
              cursorColor: MPTheme.lightTheme.colorScheme.onSurface,
              enableInteractiveSelection: true,
              readOnly: disableTextField,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MPTheme.lightTheme.colorScheme.onSurface,
                  ),
              obscureText: _obscureText,
              decoration: InputDecoration(
                errorText:
                    errorValueValidator == '' ? null : errorValueValidator,
                contentPadding: const EdgeInsets.all(8),
                suffixIcon: widget.obscureText!
                    // default suffixIcon uses obscureText
                    // no use _obscureText
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: _obscureText
                            ? Icon(
                                Icons.visibility_off,
                                color: MPTheme.lightTheme.colorScheme.onSurface,
                                size: 20,
                              )
                            : Icon(
                                Icons.visibility,
                                color: MPTheme.lightTheme.colorScheme.onSurface,
                                size: 20,
                              ),
                      )
                    : null,
                hintText: widget.hintText,
              ),
              validator: (value) {
                return validate(value!);
              },
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
              onChanged: (text) {
                setState(() {
                  errorValueValidator = validate(text);
                });

                if (widget.title == 'Password') {
                  user.password = text; // update password of user
                  cardPassword.password =
                      text; //update password of card password
                }
                if (widget.title == 'Username') {
                  //update username of card password
                  cardPassword.username = text;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
