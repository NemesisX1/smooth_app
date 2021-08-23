import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth/views/widgets/custom_text_field.widget.dart';
import 'package:smooth/helpers/extensions.dart';

class FieldChooserWidget extends StatefulWidget {
  FieldChooserWidget({
    Key? key,
    this.onEdited,
    this.keyboardType,
    this.displaySearch = true,
    this.textController,
    required this.hintText,
    required this.fieldList,
  }) : super(key: key);

  final void Function(String)? onEdited;
  final String hintText;
  final TextInputType? keyboardType;
  final List<String> fieldList;
  final bool displaySearch;
  final TextEditingController? textController;
  @override
  _FieldChooserWidgetState createState() => _FieldChooserWidgetState();
}

class _FieldChooserWidgetState extends State<FieldChooserWidget> {
  bool _hasFoundName = true;
  late TextEditingController _typedFieldController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _typedFieldController = widget.textController ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          CustomTextField(
            controller: _typedFieldController,
            hintText: widget.hintText,
            keyboardType: widget.keyboardType,
            onChanged: (value) {
              setState(() {
                _hasFoundName = true;
                widget.onEdited!(_typedFieldController.text);
              });
            },
            validator: (value) {},
          ),
          _typedFieldController.text.isNotEmpty &&
                  _hasFoundName &&
                  widget.displaySearch
              ? Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Theme.of(context).accentColor.withOpacity(0.15),
                      ),
                      margin: EdgeInsets.only(top: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Color(0xff733904),
                            size: 26,
                          ),
                          Gap(10),
                          Text(
                            "Rechercher ${widget.hintText.toLowerCase()}",
                            style: TextStyle(
                              color: Color(0xff733904),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...List<Widget>.generate(widget.fieldList.length, (index) {
                      if (widget.fieldList[index]
                          .toLowerCase()
                          .contains(_typedFieldController.text.toLowerCase())) {
                        return widget.fieldList[index].toListTile(
                          color: Color(0xffCF8F5),
                          onTap: () {
                            setState(() {
                              _typedFieldController.text =
                                  widget.fieldList[index];
                              widget.onEdited!(_typedFieldController.text);
                            });
                          },
                        );
                      } else {
                        setState(() {
                          _hasFoundName = false;
                        });
                      }
                      return Container();
                    }),
                  ],
                )
              : Container(),
        ],
      );
}
