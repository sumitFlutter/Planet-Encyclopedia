import 'package:flutter/material.dart';
import 'package:planets_project/utils/helpers/json_helper.dart';

import '../model/planets_model.dart';

class PlanetsDetailsProvider with ChangeNotifier{
List <PlanetsModel> planetsModelList=[];
void getPlanetData()
async {
   List<PlanetsModel>planetsList=await JsonHelper.jsonHelper.getData();
   planetsModelList=planetsList;
   notifyListeners();
}
}