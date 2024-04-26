import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:planets_project/screen/home/provider/planets_details_provider.dart';
import 'package:planets_project/screen/home/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PlanetsDetailsProvider>().getPlanetData();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));
    animationController!.repeat();
  }

  PlanetsDetailsProvider? r;
  PlanetsDetailsProvider? w;

  @override
  Widget build(BuildContext context) {
    r = context.read<PlanetsDetailsProvider>();
    w = context.watch<PlanetsDetailsProvider>();
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset(context.watch<ThemeProvider>().bgImage,fit: BoxFit.cover,height: MediaQuery.sizeOf(context).height,width: MediaQuery.sizeOf(context).width,),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                return Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "details",arguments: index);
                    },
                    child: Hero(
                      tag: "enter$index",
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          index!=2?
                          RotationTransition(
                            turns: animationController!,
                              child: Image.asset(r!.planetsModelList[index].image!,height: 170,width: 170,)):
                          Image.asset(r!.planetsModelList[index].image!,height: 150,width: 170,),
                          SizedBox(height: 2,),
                          Center(child: Text(r!.planetsModelList[index].name!,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),)
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: w!.planetsModelList.length,),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: IconButton(onPressed: () {
                    context.read<ThemeProvider>().setTheme();
                  }, icon: Icon(context.watch<ThemeProvider>().themeMode,size: 40,color: Colors.white,)),
                ),
              ),

            ],
          ),
    ));
  }
}
