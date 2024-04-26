import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),() => Navigator.pushReplacementNamed(context, "home"),);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/background/2.jpg",
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          ),
          Center(child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 25,),
            Image.asset("assets/logo/logo.gif",height: 150,width: 150,),
            const SizedBox(height: 5,),
            const Text("Planet Encyclopedia",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
          ],),)
        ],
      ),
    ));
  }
}
