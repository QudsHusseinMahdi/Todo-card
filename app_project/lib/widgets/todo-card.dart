// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
class Todocard extends StatelessWidget {
final String vartitle;
final bool doneORnot;
final Function changeStatus;
final int index;
 final Function delete;

const Todocard({super.key, required this.vartitle,required this.delete,required this.changeStatus,
      required this.index,required this.doneORnot});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      }, 
      child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                //حتى يخلي حدود من فوك 
                padding:EdgeInsets.all(15) ,
                //هنا يخلي حدود للتاسك من جميع الاتجاهات مثل المربع 
                //هذا اللون للحدود مال التاسك 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //هذي تخلي التكست والايكون بالوسط
                  children: [
                    Text(vartitle,style: TextStyle( color: doneORnot? Color.fromARGB(255, 27, 26, 26) : Colors.white, 
                  fontSize: 22,
                  decoration: doneORnot?  TextDecoration.lineThrough :   TextDecoration.none,
                       
                  ),
              ),
              Row(
                  
                children: [
                    Icon(doneORnot ? Icons.check  :Icons.close,
                    size: 27,
                    color:doneORnot ?Color.fromARGB(255, 75, 244, 99): const Color.fromARGB(255, 180, 57, 48) ,),
                  SizedBox(
                    width: 17,
                  ),
                  IconButton(
                    onPressed: () {
                      delete(index);
                    },
                    icon: Icon(Icons.delete),
                    iconSize: 27,
                    color: Color.fromARGB(255, 117, 20, 13),
                  )
                ],
              )
            ],
          ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(75, 212, 157, 0.2),
                  borderRadius: BorderRadius.circular(11)
                  //هنا بالبوكس ديكوريشن سوينه الكيرف
                  ),
        ),
      ),
    );
  }
}
