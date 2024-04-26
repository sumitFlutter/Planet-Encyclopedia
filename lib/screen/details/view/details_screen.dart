import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:planets_project/screen/home/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../home/provider/planets_details_provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  PlanetsDetailsProvider? r;
  PlanetsDetailsProvider? w;
  AnimationController? animationController;
  Animation? tweenSequence;
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animationController!.repeat();
    animationController!.addListener(() {setState(() {

    });});
    tweenSequence = TweenSequence([
      TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.centerLeft, end: Alignment.topCenter),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.topCenter, end: Alignment.centerRight),
          weight: 1),
      TweenSequenceItem(tween: Tween<Alignment>(begin: Alignment.centerRight,end: Alignment.bottomCenter), weight: 1),
      TweenSequenceItem(
          tween: Tween<Alignment>(
              begin: Alignment.bottomCenter, end: Alignment.centerLeft),
          weight: 1),
    ]).animate(animationController!);
  }

  @override
  Widget build(BuildContext context) {
    i = ModalRoute.of(context)!.settings.arguments as int;
    r = context.read<PlanetsDetailsProvider>();
    w = context.watch<PlanetsDetailsProvider>();
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Image.asset(
            context.watch<ThemeProvider>().bgImage,
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height*0.5,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      padding: EdgeInsets.all(10),
                      child: Center(child: Hero(tag: i==2?"enter$i":"enter",
                          child: Image.asset("assets/image/8.png",height: i!=2?120:350,width:  i!=2?120:350,)),),),
                    i!=2?
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Align(alignment: tweenSequence!.value,child: RotationTransition(
                        turns: animationController!,
                        child: Image.asset(r!.planetsModelList[i].image!,height: 80,width: 80,),
                      ),),
                      ):Container()
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("${r!.planetsModelList[i].name}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),),
                  )),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 5),
                child: Text("${r!.planetsModelList[i].description}",style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 10,),
              Text("Distance From Sun:${r!.planetsModelList[i].distance} lac KM",style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 10,),
              Text("Velocity:${r!.planetsModelList[i].velocity} Km/s",style: TextStyle(color: Colors.white,fontSize: 20),),
              Spacer(),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                  animationController!.dispose();
                },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BottomAppBar(child: Center(child: Text("<- Back To HomeScreen",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),),color: Colors.white.withOpacity(0)),
                  ))
            ],
          ),

              ],
            ),
        )
          );

  }
}
