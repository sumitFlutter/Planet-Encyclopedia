import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:planets_project/screen/home/model/planets_model.dart';

class JsonHelper{
  static JsonHelper jsonHelper=JsonHelper._();
  JsonHelper._();
  Future<List<PlanetsModel>> getData()
  async {
   String jsonString=await  rootBundle.loadString("assets/json/planets.json");
   List planetsDataList=jsonDecode(jsonString);
   List <PlanetsModel> planetsModelList=planetsDataList.map((e) => PlanetsModel.mapToModel(e)).toList();
   return planetsModelList;
  }
}