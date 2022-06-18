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
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xff2AB5E1),
              leading: IconButton(
                icon: Icon(
                    Icons.arrow_back
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ),
            body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:[Color(0xff2AB5E1),Color(0xff19C5FC).withOpacity(0.2)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Text(
                      "Journal Entries",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70
                      ),
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
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
                ],
              )
            ),
          );
        }
    );
  }
}
