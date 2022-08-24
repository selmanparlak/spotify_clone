import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:spotify_design_prototype/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en",""),
        Locale("tr",""),
      ],
      debugShowCheckedModeBanner: false
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  //const MyHomePage({Key? key, required String title}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var v = AppLocalizations.of(context);

    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      extendBodyBehindAppBar: true,
      backgroundColor: mainColor,
      appBar: AppBar(
        title: const Text("Spotify"),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
    ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Stack(
            children : [
              Center(child: Padding(
                padding:  EdgeInsets.only(top:screenHeight/7),
                child: Image.asset("images/album.jpg"),
              )),
            Center(
              child: Padding(
                padding:  EdgeInsets.only(left: screenWidth/4,top: screenWidth/3,right: screenWidth/4,bottom: screenWidth/7),
                child: Text("This is Daft Punk",textAlign: TextAlign.center,style: TextStyle(color: textColor,fontSize: screenWidth/14,fontFamily: "Ubuntu",),
                  ),
              ),
            ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.all(screenHeight/50),
            child: Text(v!.defText,style: TextStyle(color: defColor,fontSize:screenWidth/27),),
          ),
          Padding(
            padding:  EdgeInsets.all(screenHeight/100),
            child: Column(
              children: [
                Text(v.createText,style: TextStyle(color:textColor,fontSize: screenWidth/28),),
                Text("Selman Parlak",style: TextStyle(color: textColor,fontSize: screenWidth/25,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(screenWidth/50),
            child: Row(
              children: [
                Text(v.likeText,style: TextStyle(color:defColor,fontSize: screenWidth/26),),
                Text(v.timeText,style: TextStyle(color: defColor,fontSize: screenWidth/26),),
              ],
                  ),
                ),
          Row(
            children: [
              TextButton.icon(
                  onPressed: (){print("Like");},
                  icon: const Icon(Icons.favorite,color: Colors.green,),
                  label: const Text(""),),
              TextButton.icon(
                  onPressed: (){print("Settings");},
                  icon: const Icon(Icons.more_vert,color: Colors.grey,),
                  label: const Text("")),
              const Spacer(),
              TextButton.icon(
                  onPressed: (){print("Play");},
                  icon: const Icon(Icons.play_circle,color: Colors.green,),
                  label: const Text("")),
            ],
          ),
          MusicData(img: "images/around.jpg", text1: "Around the World", text2: "Daft Punk", left: 0,top: 0,right:screenWidth/8,bottom: 0,
                    fontSize1: screenWidth/26,fontSize2: screenWidth/26,rowPadding:screenWidth/55,columnPadding: screenHeight/90,), // right -55
          MusicData(img: "images/Get_Lucky.jpg", text1: "Get Lucky", text2: "Daft Punk", left: 0, top: 0, right: 0, bottom: 0,
                    fontSize1: screenWidth/26,fontSize2: screenWidth/26,rowPadding: screenWidth/55,columnPadding: screenHeight/90,),
          MusicData(img: "images/veridis_quo.jpg", text1: "Veridis Quo", text2: "Daft Punk", left: 0, top: 0, right: screenWidth/50, bottom: 0,
                    fontSize1: screenWidth/26,fontSize2: screenWidth/26,rowPadding: screenHeight/90,columnPadding: screenHeight/90),
          ],
        ),
        );

  }
}
class MoreVert extends StatelessWidget {
  const MoreVert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: (){print("Settings");},
        icon: const Icon(Icons.more_vert,color: Colors.grey,),
        label: const Text(""));
  }
}

class MusicData extends StatelessWidget {
  String img ;
  String text1;
  String text2;
  double left;
  double top;
  double right;
  double bottom;
  double fontSize1;
  double fontSize2;
  double rowPadding;
  double columnPadding;
  MusicData({required this.img, required this.text1, required this.text2, required this.left,required this.top ,
            required this.right,required this.bottom,required this.fontSize1,required this.fontSize2,
            required this.rowPadding,required this.columnPadding});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(rowPadding),
      child: Row(
        children: [
          Image.asset(img),
          Padding(
            padding:  EdgeInsets.all(columnPadding),
            child: Column(
              children: [
                Text(text1,style: TextStyle(color: textColor,fontSize: fontSize1),),
                Padding(
                  padding:  EdgeInsets.only(left: left,top: top,right: right,bottom: bottom),
                  child: Text(text2,style: TextStyle(color: defColor,fontSize: fontSize2),),
                ),

              ],
            ),
          ),

          const Spacer(),
          const MoreVert(),

        ],
      ),
    );
  }
}
