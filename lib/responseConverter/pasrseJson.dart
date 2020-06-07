class JsonConvertor{
  final String diseaseName;
  final String chemicalSolution;
  final String culturalSolution;

  JsonConvertor({this.diseaseName,this.chemicalSolution,this.culturalSolution});
  
factory JsonConvertor.fromJson(Map <String, dynamic> json){
  return JsonConvertor(
    diseaseName: json['prediction'] as String,
    chemicalSolution: json['chemical'] as String,
    culturalSolution: json['cultural'] as String
  );
}

}
  