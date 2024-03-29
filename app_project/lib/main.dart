// ignore_for_file: sort_child_properties_last, unused_import, avoid_function_literals_in_foreach_calls, prefer_const_constructors

import 'package:app_project/widgets/todo-card.dart';
import 'package:flutter/material.dart';
import 'widgets/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     home:TodoApp(),
    );
  }
  }
  class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}
//class for task(to_do carrd).
class Task {
  String title;
  bool status;
  Task({
    required this.title,
    required this.status,
  });
}
class _TodoAppState extends State<TodoApp> {
  //list of todos.
  List allTasks = [
    Task(title: "Sport", status: true),
    Task(title: "Skin Care", status: true), 
    Task(title: "Read", status: true),
    Task(title: "Learn Language", status: true),
    ];
    //To remove todo when clicking on "delete" icon.
      delete(int clickedTask) {
    setState(() {
      allTasks.remove(allTasks[clickedTask]);
    });
  }
//To remove all todo when clicking on "delete" icon in the appBar.
  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }
    //To chaange the state of the todo (comleted or not comleted) when click on the todo.
    changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status =  !allTasks[taskIndex].status;
    });
  }
//To add new todo when clicking on "ADD" in the dialog widget .
  addnewtask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }
  //Create controller to get the text inside the textfield in the dialog widget.
  final myController = TextEditingController();
  //To calcuate only completed todos.
  int calculateCompletedTasks() {
    int completedTasks = 0;

    allTasks.forEach((item) {
      if (item.status) {
        completedTasks++;
        //دالة الكالكوليت هي تحسب كم صصح عدنا 
      }
    });

    return completedTasks;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:(){
             showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11) ),
                child: Container(
                  padding: EdgeInsets.all(22),
                  //مسافة داخلية داخل الحدود

                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //حتى تصير صفحة اضافة جديد في الوسط من نضط ادد
                    children: [
                      TextField(
                        controller: myController,
                          maxLength: 20,
                          decoration:
                              InputDecoration(hintText: "Add new Task")),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            addnewtask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
          ))
                    ],
                  ),
                ),
                );
              },
             );
        },
        child : Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 9, 147, 206),
    ),
      backgroundColor: Color.fromRGBO(45, 98, 119, 7),
      appBar: AppBar(
         actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            icon: Icon(Icons.delete_forever),
            iconSize: 37,
            color: Color.fromARGB(195, 141, 18, 65),
          )
        ],
        elevation: 0,
        backgroundColor: Color.fromRGBO(90, 159, 176, 0.675),
        title: Text("To Do App", style: TextStyle(fontSize: 33,color:Colors.white ,fontWeight: FontWeight.bold),),
      ),
       body: SizedBox(
        width: double.infinity,
        child:SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter( allTodos: allTasks.length,
              allCompleted: calculateCompletedTasks()
            ),
            Container(
               margin: EdgeInsets.only(top: 22),
               //يخلي مسافة قبل اللست مالتنه
              height: 550,
              color: Color.fromARGB(255, 25, 115, 140),
              child: ListView.builder(
                // listviewbuilder حتى نضيف عدد غير محدود للست 
                  itemCount: allTasks.length,
                  // تسخدم مع اللست فيو وحتى تحدد عدد الايتم الي حنضيفه اما رقم فقط او معادلة 
                  itemBuilder: (BuildContext context, int index) {
                    return Todocard(
                    //i well pass all these information when create the todocard() in "todo-card.dart" file.
                      vartitle: allTasks[index].title,
                      doneORnot: allTasks[index].status,
                      changeStatus: changeStatus,
                      index: index,
                      delete: delete
          );
                  }),
            )
          ],
        ),
        ),
      ),
    );
  }
}
