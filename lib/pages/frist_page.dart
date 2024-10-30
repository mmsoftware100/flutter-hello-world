import 'package:flutter/material.dart';
import 'package:state/data/person.dart';
import 'package:state/pages/drink/drink_home_page.dart';
import 'package:state/pages/second_page.dart';

class FirstPage extends StatefulWidget {
  static const String routeName = "/FirstPage";

  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  /*
  List<String> nameList = ["Aung Ko Man", "Bhone Myat Hein", "Aung Aung Htet"];
  List<String> ageList = ["32","31","32"];
  List<String> rankList = ["Capt", "Maj", "Capt"];

   */

  // List<String> akm = ["Aung Ko Man", "32", "Capt"];
  // List<String> bhoneMyatHein = ["Bhone Myat Hein", "31", "Maj"];
  /*
  List<List<String>> personList = [
    ["Aung Ko Man", "32", "Capt"],
    ["Bhone Myat Hein", "31", "Maj"]
  ];

   */
  /*
  Map<String, dynamic> akm = {
    "name" : "Aung Ko Man",
    "age" : 32,
    "rank" : "Capt"
  };


  List<Map<String, dynamic>> personList = [
    {
      "name" : "Aung Ko Man",
      "age" : 32,
      "rank" : "Capt"
    },
    {
      "nane" : "Bhone Myat Hein",
      "age" : 31,
      "rank" : "Maj"
    }
  ];

   */


  List<Person> personList = [
    Person(name: "Aung Ko Man", age: 32, rank: "Capt",education: ["BCSC", "MCSc"]),
    Person(name: "Bhone Myat Hein", age: 31, rank: "Maj",education: ["BCSC", "MCSc"])
  ];






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) =>
              Text(personList[index].name + personList[index].age.toString() +
                  personList[index].education.length.toString()),
          separatorBuilder: (context, index) => Divider(),
          itemCount: personList.length
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, DrinkHomePage.routeName);
        },
        child: Icon(Icons.place),
      ),
    );
  }


}
