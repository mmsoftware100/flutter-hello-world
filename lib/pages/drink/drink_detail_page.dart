import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/data/bottle.dart';
import 'package:state/providers/bottle_provider.dart';

class DrinkDetailPage extends StatefulWidget {
  static const String routeName = "/DrinkDetailPage";
  const DrinkDetailPage({super.key});

  @override
  State<DrinkDetailPage> createState() => _DrinkDetailPageState();
}

class _DrinkDetailPageState extends State<DrinkDetailPage> {

  /*
  // state
  Bottle bottle =  Bottle(photoUrl: "assets/images/drink_2.webp", name: "Grand Royal", price: 15000, favourite: true);


  // modifier
  void toggleFav(String bottleName){
    setState(() {
      bottle.favourite = !bottle.favourite;
    });
  }

   */


  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      /*
      appBar: AppBar(
        title: Text(Provider.of<BottleProvider>(context, listen: true).bottle.name),
        actions: [
          Provider.of<BottleProvider>(context, listen: true).bottle.favourite == true ?
          IconButton(onPressed: (){ Provider.of<BottleProvider>(context, listen: false).toggleFav(Provider.of<BottleProvider>(context, listen: false).bottle.name); }, icon: Icon(Icons.favorite, color: Colors.red,)) : InkWell(
              onTap: (){
                Provider.of<BottleProvider>(context, listen: false).toggleFav(Provider.of<BottleProvider>(context, listen: false).bottle.name);
              },
              child: Icon(Icons.favorite_outline_rounded))
        ],
      ),

       */
      
      body: bottleView(Provider.of<BottleProvider>(context, listen: true).bottle),
    );
  }

  Widget bottleView(Bottle bottle){
    return Column(
      children: [
        Image.asset(bottle.photoUrl),
        Text(bottle.name),
        Text(bottle.price.toString()),
        Text(bottle.favourite.toString()),
        bottle.favourite == true ?  IconButton(onPressed: (){
          Provider.of<BottleProvider>(context, listen: false).toggleFav(bottle.name);
        }, icon: Icon(Icons.favorite)) :
        IconButton(onPressed: (){
          Provider.of<BottleProvider>(context, listen: false).toggleFav(bottle.name);
        }, icon: Icon(Icons.favorite_outline_rounded))
      ],
    );
  }
}
