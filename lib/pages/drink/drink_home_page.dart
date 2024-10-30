import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/pages/drink/drink_detail_page.dart';
import 'package:state/providers/bottle_provider.dart';

import '../../data/bottle.dart';

class DrinkHomePage extends StatefulWidget {
  static const String routeName = "/DrinkHomePage";

  const DrinkHomePage({super.key});

  @override
  State<DrinkHomePage> createState() => _DrinkHomePageState();
}

class _DrinkHomePageState extends State<DrinkHomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("DrinkHomePage->initState");
    Provider.of<BottleProvider>(context, listen: false).getBottleListFromAPI();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("DrinkHomePage->dispose");
  }
  // UI
  @override
  Widget build(BuildContext context) {
    // print("DrinkHomePage->build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Drink Home Page"),
        actions: [
          IconButton(
              onPressed: (){
                Provider.of<BottleProvider>(context, listen: false).getBottleListFromAPI();
              },
              icon: Icon(Icons.refresh)
          )
        ],
      ),
      body: drinkListView(Provider.of<BottleProvider>(context, listen: true).bottleList),
      floatingActionButton: FloatingActionButton(
          onPressed: () async{
            // int ans = Provider.of<BottleProvider>(context, listen: false).add(1, 2);
            print("Fab -> onPressed");
            int ans = await Provider.of<BottleProvider>(context, listen: false).addtion(y: 2, x: 1);
            print("ans is $ans");
          },
          child : Icon(Icons.add)
      ),
    );
  }

  int add(int x, int y){
    return x+y;
  }

  Widget drinkListView(List<Bottle> bottleList){
    return  ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: (){
            // TODO: navigate to detail page
            Provider.of<BottleProvider>(context, listen: false).updateSingleBottle(bottleList[index]);
            Navigator.pushNamed(context, DrinkDetailPage.routeName);
          },
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Image.network(bottleList[index].photoUrl)
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(bottleList[index].name),
                    Text(bottleList[index].price.toString()),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: (){
                        print("${bottleList[index].name} fav pressed");
                        // toggleFav(bottleList[index].name);
                        Provider.of<BottleProvider>(context, listen: false).toggleFav(bottleList[index].name);
                      },
                      child: bottleList[index].favourite == true ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_outline_rounded)
                  )
              )
            ],
          ),
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: bottleList.length
    );
  }
}
