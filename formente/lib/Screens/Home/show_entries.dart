// ignore_for_file: must_call_super, avoid_print

import 'package:flutter/material.dart';
import 'package:formente/Models/diary_entry.dart';
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
    return FutureBuilder<List<DiaryEntryModel>>(
        future: entries as Future<List<DiaryEntryModel>>,
        builder: (BuildContext context,AsyncSnapshot<List<DiaryEntryModel>> entries){
          if(entries.hasData) {
            return Scaffold(
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: const Color(0xff2AB5E1),
                  leading: IconButton(
                    icon: const Icon(
                        Icons.arrow_back
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
              ),
              body: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            const Color(0xff2AB5E1),
                            const Color(0xff19C5FC).withOpacity(0.5)

                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                      )
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: const Text(
                          "Recent Entries",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white70
                          ),
                        ),
                      ),

                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: entries.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return DiaryEntryTile(entry: entries.data![index]);
                          }
                      ),
                    ],
                  )
              ),
            );
          }else {
            return Container();
          }
        }
    );
  }
}
