// ignore_for_file: prefer_const_constructors

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_manager/controller/date_controller.dart';

class DateTimeView extends ConsumerWidget {
  const DateTimeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DatePicker(
      
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.black,
      selectedTextColor: Colors.white,
      dateTextStyle: GoogleFonts.lato(
          textStyle:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          )
      ),
      monthTextStyle: GoogleFonts.lato(
          textStyle:TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          )
      ),
      dayTextStyle: GoogleFonts.lato(
          textStyle:TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          )
      ),
      height: 90,
      onDateChange: (date) {
        var result = date.toString().split(" ")[0];
        // ignore: deprecated_member_use
        ref.read(dateControllerProvider.state).state = result;
      },
    );
  }
}
