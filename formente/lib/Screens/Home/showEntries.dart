import 'package:flutter/material.dart';
import 'package:formente/Models/diaryEntry.dart';
import 'package:formente/Screens/Home/entry_tile.dart';
import 'package:provider/provider.dart';

import '../../Providers/user.dart';

class ShowEntries extends StatefulWidget {
  const ShowEntries({Key? key}) : super(key: key);

  @override
  State<ShowEntries> createState() => _ShowEntriesState();
}

class _ShowEntriesState extends State<ShowEntries> {
  UserProvider? userProvider;
  Future<List<DiaryEntryModel>>? entries;

  @override
  void didChangeDependencies() {
    userProvider = Provider.of<UserProvider>(context);
    entries = userProvider?.getEntries();
    print(entries);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: entries,
        builder: (BuildContext context,AsyncSnapshot<List<DiaryEntryModel>> entries){
          return Scaffold(
            body: ListView.builder(
                itemCount: entries.data?.length,
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                      // onTap:(){
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>FilteredPosts(genre: posts.data![index].genreNeeded, genreNeeded:posts.data![index].genre )));
                      // },
                      child: DiaryEntryTile(entry: entries.data![index])
                  );
                }
            ),
          );
        }
    );
  }
}
