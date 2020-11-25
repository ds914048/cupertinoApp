import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // theme: CupertinoThemeData(
      //   textTheme: CupertinoTextThemeData(
      //       navLargeTitleTextStyle: TextStyle(
      //       fontSize:70.0,
      //       fontWeight: FontWeight.bold,
      //         color: CupertinoColors.activeBlue,
      //       ),
      //   ),
      // ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid),
            title: Text('Article'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye_solid),
            title: Text('Views'),
          ),
        ],
      ),
      tabBuilder: (context,i){
        return CupertinoTabView(
          builder: (context)
          {return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar
                (middle: (i==0)? Text('Articles'): Text('Views'),
              ),
                child: Center(
                  child:CupertinoButton(
                    child: Text('This is tab #$i',
                      style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle
                      .copyWith(fontSize: 32),
                    ),
                  onPressed:(){
                      Navigator.of(context).push(CupertinoPageRoute(builder: (context)
                      {
                        return DetailScreen(i==0 ?'Article':'Views');
                      }),
                      );
                    },
                  ),
                ),
            );
          }
        );
      }
    );
  }
}


class DetailScreen extends StatefulWidget {
  const DetailScreen(this.topic);
  final String topic;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool SwitchValue= false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Details'),
      ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min ,
              children: [
               CupertinoButton(child: Text('Launch Action Sheet'),
                   onPressed: (){
                      showCupertinoModalPopup<int>(
                        context: context,
                          builder: (context){
                            return CupertinoActionSheet(
                              title: Text('Some choices'),
                              actions: [
                                CupertinoActionSheetAction(
                                  child: Text('Tea'),
                                  onPressed: (){
                                    Navigator.pop(context,1);
                                  },
                                  isDefaultAction: true,
                                ),
                                CupertinoActionSheetAction(
                                  child: Text('Coffee'),
                                  onPressed: (){
                                    Navigator.pop(context,1);
                                  },
                                ),
                                CupertinoActionSheetAction(
                                  child: Text('Milk'),
                                  onPressed: (){
                                    Navigator.pop(context,1);
                                  },
                                ),

                              ],
                            );
                          },
                      );
                   },
               ),
              ],
            ),
          ),
        ),
    );
  }
}



