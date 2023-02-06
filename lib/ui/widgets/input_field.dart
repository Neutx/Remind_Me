import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({Key? key, required this.title, required this.hint, this.controller, this.widget,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: titleStyle,),
          Container(
            height: 52,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey,
                  width: 1
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextFormField(
                      readOnly: widget==null?false:true,
                      autofocus: false,
                      cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                      controller: controller,
                      style: subTitleStyle,
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: subTitleStyle,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: context.theme.backgroundColor,
                          width: 0),
                        ),
                        contentPadding: EdgeInsets.only(left: 20, top: 14),
                      ),
                    )),
                widget==null?Container():widget!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
