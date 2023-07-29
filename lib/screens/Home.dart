
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:pravda_or_deistvie/screens/game/gamedata/list.dart';
import 'package:pravda_or_deistvie/screens/game/sprav.dart';
import 'package:pravda_or_deistvie/screens/game/page1_1.dart';
import 'package:pravda_or_deistvie/screens/game/page1_2.dart';
import 'package:yandex_mobileads/mobile_ads.dart';
import 'game/init/StartPageView.dart';
import 'game/init/screen_lover.dart';


class Home extends StatefulWidget {
  const Home({super.key});
  static _HomeState? of(BuildContext context) {
    return context.findAncestorStateOfType<_HomeState>();
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static dynamic currentPageValue = 0.0;
  int curPages = currentPageValue.toInt();
  PageController controller = PageController();
  bool isExitval = false;
  bool isVar = false;
  late var adUnitId = '';
  late RewardedAd? _ad_rewerded;
  bool isAdLoaded = false;
  bool isLoading = false;
  late InterstitialAd? _ad;
  var adRequest = const AdRequest();


  @override
  void initState() {
    super.initState();
    MobileAds.initialize();
       controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
        curPages = currentPageValue.toInt();
      });
    });
  }

  Future<void> _onLoadClicked() async {
    _ad = await _createInterstitialAd();
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents dismissing the modal when tapping outside
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(), // Add the circular progress indicator
                SizedBox(height: 16.0),
                Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    await _showInterstitialAd();
  }

  Future<InterstitialAd> _createInterstitialAd() {
    return InterstitialAd.create(
      adUnitId: adUnitId,
      onAdLoaded: () {
        setState(() => isLoading = false);
        
      },
      onAdDismissed: () { 
        _ad = null;
        
      },
      onAdFailedToLoad: (error) { 
        Navigator.of(context).pop();
        _ad = null;
      },
    );
  }

  Future<void> _showInterstitialAd() async {
    final ad = _ad;
    if (ad != null) {
      setState(() => isLoading = true);
      try {
        await ad.load(adRequest: adRequest);
        await ad.show();
        await ad.waitForDismiss();
      } catch (error) {
      } finally {
        setState(() => isLoading = false);
      }
    }
  }





  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Оповещение'),
            content: Text('Вы действительно хотите выйти ?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: Text('Да')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Нет'),
              )
            ],
          );
        });
  }


  void exits_app(){
    setState(() {
      exit(0);
    });
  }


  void click1_1() async{
    await _onLoadClicked();
    Timer(
        Duration(seconds: 1),()=>
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page1_1(array_vopros: array_vopros1_1, array_vopros_destvie: array_vopros_destvie1_1,)),),);
  }


  void click1_2()async{
    await _onLoadClicked();
    Timer(
        Duration(seconds: 1),()=>
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page1_2(array_vopros: array_vopros1_2, array_vopros_destvie: array_vopros_destvie1_2,)),),);
  }
  void click2_1()async{
    await _onLoadClicked();
    Timer(

        Duration(seconds: 1),()=>
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page1_1(array_vopros: array_vopros2_1, array_vopros_destvie: array_vopros_destvie2_1,)),),);
  }
  void click2_2()async{
    await _onLoadClicked();
    Timer(
        Duration(seconds: 1),()=>
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page1_2(array_vopros: array_vopros2_2, array_vopros_destvie: array_vopros_destvie2_2,)),),);
  } 
  void click3_1()async{
    await _onLoadClicked();
    Timer(
        Duration(seconds: 1),()=>
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page1_1(array_vopros: array_vopros3_1, array_vopros_destvie: array_vopros_destvie3_1,)),),);
  }
  void click3_2()async{
    await _onLoadClicked();
    Timer(
        Duration(seconds: 1),()=>
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page1_2(array_vopros:array_vopros3_2, array_vopros_destvie: array_vopros_destvie3_2,)),),);
  } 

  void exits(){
    setState(() {
      // _showMaterialDialog();
      isExitval = !isExitval;
    });
  }


  void spravs() async {
    setState(() {
          isVar = !isVar;
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Material(child: start_page_view(curPages:curPages,controller:controller,click1_1:click1_1,click1_2:click1_2,click2_1:click2_1,click2_2:click2_2,click3_1:click3_1,click3_2:click3_2, exits:isExitval, sprav_init: isVar));
  }
}
