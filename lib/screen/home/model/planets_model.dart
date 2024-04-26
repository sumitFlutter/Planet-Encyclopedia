class PlanetsModel{
  String? position,name,image,velocity,distance,description;

  PlanetsModel({this.position, this.name, this.image, this.velocity,
      this.distance, this.description});
  factory PlanetsModel.mapToModel(Map m1)
  {
    return PlanetsModel(name: m1["name"],image: m1["image"],description: m1["description"],distance: m1["distance"],position: m1["position"],velocity: m1["velocity"]);
  }
}