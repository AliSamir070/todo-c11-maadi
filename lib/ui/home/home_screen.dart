import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_c11_maadi/ui/home/tabs/settings_tab.dart';
import 'package:todo_c11_maadi/ui/home/tabs/tasks_tab.dart';
import 'package:todo_c11_maadi/ui/home/widgets/AddTaskSheet.dart';
import 'package:todo_c11_maadi/ui/login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [TasksTab(),SettingsTab()];

  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
        actions: [
          IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
              }, icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showAddTaskBottomSheet();
          },
        elevation: 0,
        child: Icon(Icons.add,color: Colors.white,),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        elevation: 0,
        child: BottomNavigationBar(
          currentIndex:currentTabIndex ,
          onTap: (newIndex){
            currentTabIndex = newIndex;
            setState(() {

            });
          },
          backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu_rounded
                  ),
                label: ""
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    Icons.settings
                ),
                label: ""
              )
            ]
        ),
      ),
      body: tabs[currentTabIndex],
    );
  }

  void showAddTaskBottomSheet(){
    showModalBottomSheet(context: context,
      isScrollControlled: true,
      builder: (context) => AddTaskSheet(),);
  }
}
