// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:work_manager/service/notification_service.dart';
import 'package:work_manager/view/addtask/add_task.dart';
import 'package:work_manager/view/homepage/component/appbar.dart';
import 'package:work_manager/view/homepage/component/date_time.dart';
import 'package:work_manager/view/homepage/component/task_view.dart';
import 'package:work_manager/view/notes/notes_page.dart';

import '../../theme/theme.dart';
import '../../util/widgets/button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  late int _selectedIndex;




  @override


  }
  Widget build(BuildContext context) {
    NotificationClass().initiallizationPlatform(context);
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[700]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor:  Color(0xFFF7F7F7).withOpacity(0.5),
              iconSize: 24,
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.transparent,
              color:const Color(0xFFF7F7F7),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.add,
                  text: 'Add Task',
                ),
                GButton(
                  icon: Icons.notes,
                  text: 'Notes',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),




      // bottomNavigationBar: Container(
      //   color: Colors.black,
      //   child: Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      //     child: GNav(
      //       backgroundColor: Colors.black,
      //       color: Colors.white,
      //       activeColor: Colors.white,
      //       tabBackgroundColor: primaryClr,
      //       padding: EdgeInsets.all(14),
      //       onTabChange: (index) {
      //         if(index==1){
      //           Navigator.pushReplacement(context,
      //               MaterialPageRoute(builder: (context) => const AddTask()));
      //         }
      //         else if (index==2 ) { Navigator.pushReplacement(context,
      //             MaterialPageRoute(builder: (context) => const NotesPage()));
      //
      //         }
      //         else if (index==0 ) { Navigator.pushReplacement(context,
      //             MaterialPageRoute(builder: (context) => const HomePage()));
      //
      //         }
      //       },
      //       gap: 8, tabs:const[
      //       GButton(icon: Icons.home, text: "Home",),
      //       GButton(icon: Icons.add, text: "Add Task"),
      //       GButton(icon: Icons.notes, text: "Notes"),
      //
      //         ]),
      //   ),
      // ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: CustomAppBar()),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(),
          _addTaskBar(),
          SizedBox(
            height: 30,
          ),

          DateTimeView(),
          SizedBox(
            height: 30,
          ),
          TaskView()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const NotesPage()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
  _addTaskBar(){
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text("Today",
                  style: TextStyle(
                    fontStyle: GoogleFonts.lato().fontStyle,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                  ),)
              ],
            ),
          ),
          MyButton(label: "+ Add Task", onTap: () =>Get.to(() => AddTask()), ),

        ],),
    );
  }}