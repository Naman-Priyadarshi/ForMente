// ignore_for_file: import_of_legacy_library_into_null_safe, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:formente/Screens/Home/show_entries.dart';
import 'package:provider/provider.dart';

import '../../Providers/user.dart';
import 'add_diary_entry.dart';
import 'drawer.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late SwiperController _swiperController;
  double opac = 1.2;
  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> dashboardItemList = [
      DashboardItem("The way we think, feel and behave are linked. Sometimes we develop patterns of thoughts or behaviours that are unhelpful so recognising them, and taking steps to think about things differently, can improve your mental health and wellbeing.", ),
      DashboardItem("If we take time to be aware of ourselves and be in the present moment, noticing our own thoughts and feelings, and the world around us, we can gain a better perspective. Sometimes this is known as being more mindful."),
      DashboardItem("Good-quality sleep makes a big difference to how we feel mentally and physically, so it's important to get enough."),
      DashboardItem("Talking about your feelings can help you stay in good mental health and deal with times when you feel troubled."),
      DashboardItem("Regular exercise can boost your self-esteem and can help you concentrate, sleep, and look and feel better. Also cutting down on alcohol and caffeine can have a positive effect on our mood."),
      DashboardItem("From enjoying your favourite hobby, learning something new or simply taking time to relax, it's important to do things that make you happy, like trying a new hobby or learning a new skill."),
      DashboardItem("Strong family ties and supportive friends can help you deal with the stresses of life."),
      DashboardItem("None of us are superhuman. We all sometimes get tired or overwhelmed by how we feel or when things don’t go to plan."),
      DashboardItem("A change of scene or a change of pace is good for your mental health. "),
      DashboardItem("We’re all different. It’s much healthier to accept that you’re unique than to wish you were more like someone else."),
    ];
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xff2AB5E1),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[const Color(0xff2AB5E1),const Color(0xff19C5FC).withOpacity(0.5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            Expanded(
              flex: 6,
              child: Swiper(
                controller: _swiperController,
                itemCount: dashboardItemList.length,
                onIndexChanged: (int value) {
                  if (value == 2) {
                    setState(() {
                      opac = 0.0;
                    });
                  } else {
                    setState(() {
                      opac = 1.2;
                    });
                  }
                },
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: MediaQuery.of(context).size.height / 1.5,
                itemBuilder: (BuildContext context, index) {
                  return dashboardItemList[index];
                },
                layout: SwiperLayout.TINDER,
                curve: Curves.bounceOut,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShowEntries()));
                    },
                    child: const Text("Show all entries")),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddDiaryEntry()));
        },
        child: const Icon(
          Icons.add
        ),
      ),
    );
  }


  Widget DashboardItem(String text) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/dashboardbg.png"),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            blurRadius: 5,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                        offset: Offset(0, 8),
                      )
                    ]),
              ),
            ],
          ),
          const Padding(
              padding: EdgeInsets.only(top: 30,bottom: 10),
            child: Text(
              "Mental Health Tips!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                '"$text"',
                softWrap: true,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
