import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // variable
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State"),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(child: Container(color: Colors.transparent)),
            Text( counter.toString() , style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.blue),),
            Container(
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    print("counter is $counter");
                    if(counter < 0 || counter == 0 ){
                      setState(() {
                        counter = 0;
                      });
                    }
                    else{
                      setState(() {
                        counter = counter - 1;
                      });
                    }
                    print("after added -> $counter");
                  }, child: Text(" - ")),
                  SizedBox(width: 8.0,),
                  ElevatedButton(onPressed: (){
                    print("counter is $counter");
                    setState(() {
                      counter = counter + 1;
                    });
                    print("after added -> $counter");
                  }, child: Text(" + ")),
                ],
              ),
            ),
            Expanded(child: Container(color: Colors.transparent,))
          ],
        ),
      ),
    );
  }
}
