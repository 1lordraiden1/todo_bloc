import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../archive/archive_screen.dart';
import '../done/done_screen.dart';
import '../task/task_screen.dart';



bool isBottomSheet = false;

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {



List<Widget> pages = [
    TaskScreen(),
    DoneScreen(),
    ArchiveScreen(),
  ];


  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  void initState() {
    DatabaseFactory;
    createDB();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text("Todo App"),
            ),
            body:
             FloatingActionButton(
              onPressed: () {
                if (isBottomSheet) {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context);
                    isBottomSheet = false;
                  }
                } else {
                  scaffoldKey.currentState?.showBottomSheet((context) => Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: titleController,
                              validator: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'Enter Title';
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: Text('Task title'),
                                prefix: Icon(Icons.abc_outlined),
                              ),
                            ),
                            TextFormField(
                              controller: timeController,
                              keyboardType: TextInputType.datetime,
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((dynamic value) {
                                  timeController.text =
                                      value.format(context).toString();
                                  print(value.format(context));
                                });
                              },
                              validator: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'Enter Time';
                                }
                              },
                              decoration: InputDecoration(
                                label: Text('Task Time'),
                                prefix: Icon(
                                  Icons.watch_later_outlined,
                                  size: 25,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: dateController,
                              validator: (dynamic value) {
                                if (value.toString().isEmpty) {
                                  return 'Enter Date';
                                }
                              },
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2023),
                                        lastDate: DateTime(2024))
                                    .then((value) {
                                  dateController.text =
                                      value.toString().substring(0, 10);
                                });
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: Text('Task Date'),
                                prefix: Icon(Icons.calendar_month_outlined),
                              ),
                            ),
                          ],
                        ),
                      ));
                  isBottomSheet = true;
                }
              },
              child: Icon(
                Icons.add,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              elevation: 0,
              onTap: (index) {

              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.task_outlined), label: "Tasks"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline_outlined),
                    label: "Done"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: "Archive"),
              ],
            ),
          );
  }
}


/*void createDB ()async {
  Database DB = await openDatabase(
      'todo.db',version: 1,
      onCreate: (DB,version){
    print("data base is created");
    DB.execute("CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)").then((value){
      print("table is created successfully");
    }).catchError((error){
      print("Error on Creating DB table ${error.toString()}");
    });

  },
  onOpen: (DB){
    print("DB is opened");
  }
  ).catchError((error){print("Error in openning DB ${error.toString()}");});

}*/

void createDB()
{
DatabaseFactory? path ;
  openDatabase(
      'todo.db',
      version: 1,
      onCreate: (DB, version) {
        print("Database created");
        DB.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT,time TEXT,state TEXT)')
            .then((value) {
          print("Table created");
        }).catchError((error) {
          print("Error on Creating table");
        });
      },
      onOpen: (DB) {
        /*getDB(DB).then((value) {
            print(value);
            print("Database opened");
            emit(CreateDBState());
          });*/
        print("Database opened");

      }
  ).then((value) {
    /*emit(CreateDBState());*/
  });
}