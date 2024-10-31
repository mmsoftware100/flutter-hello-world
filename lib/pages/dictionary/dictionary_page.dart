import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/providers/dictionary_provider.dart';

import '../../data/dictionary.dart';

class DictionaryPage extends StatefulWidget {
  static const String routeName = "/DictionaryPage";
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  @override
  Widget build(BuildContext context) {
    // internal state
    TextEditingController _tec = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        title: Text("Dictionary"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Input Box
            TextField(
              controller: _tec,
            ),

            // Search
            ElevatedButton(onPressed: (){
              Provider.of<DictionaryProvider>(context, listen: false).getMeaning(_tec.text);

            }, child: Text("Search")),

            // Result , list of Dictionary
            ...Provider.of<DictionaryProvider>(context, listen: true).dictionaryList.map((dictionary) => _dictionaryWidget(dictionary)).toList(),

          ],
        ),
      ),
    );
  }

  Widget _dictionaryWidget(Dictionary dictionary){
    return Column(
      children: [
        Text(dictionary.word, style: TextStyle(fontWeight: FontWeight.bold),),
        ...dictionary.meanings.map(
                (meaning) => Column(
                  children: [
                    Text(meaning.partOfSpeech, style: TextStyle(fontStyle: FontStyle.italic),),
                    Column(
                      children: [
                        ...meaning.definitions.map((definition) => Text(definition.definition)).toList()
                      ],
                    )
                  ],
                )
        ).toList(),

        Divider(),
      ],
    );


    return Column(
      children: [
        Row(
          children: [
            Text("8 parts of speech"),
            Text(" | "),
            Text("definition")
          ],
        ),
        Row(
          children: [
            Text("8 parts of speech"),
            Text(" | "),
            Text("definition")
          ],
        ),
      ],
    );
  }
}
