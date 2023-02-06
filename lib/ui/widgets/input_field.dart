import 'package:flutter/cupertino.dart';

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
        children: [
          Text(title,style: titleStyle,),
          MyInputField(title: 'Title', hint: 'Enter Title',),
        ],
      ),
    );
  }
}
