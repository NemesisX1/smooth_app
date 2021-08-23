import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextInputType? keyboardType;

  final Key? key;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onSaved;
  final Function()? onEditingComplete;
  final bool? isSecret;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  CustomTextField({
    this.hintText,
    this.keyboardType,
    this.key,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.isSecret = false,
    this.controller,
    this.onEditingComplete,
    this.suffixIcon,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool? _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isSecret! ? true : false;
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  autocorrect: true,
                  controller: widget.controller,
                  onFieldSubmitted: widget.onSaved,
                  onEditingComplete: widget.onEditingComplete,
                  onChanged: widget.onChanged,
                  validator: widget.validator!,
                  key: widget.key,
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: widget.keyboardType == null
                      ? TextInputType.text
                      : widget.keyboardType,
                  obscureText: _obscureText!,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    labelText: widget.hintText,
                    suffixIcon: widget.isSecret!
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText!;
                              });
                            },
                            child: Icon(
                              _obscureText!
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                              color: Theme.of(context).accentColor,
                            ),
                          )
                        : widget.suffixIcon,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
