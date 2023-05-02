// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  Data data;

  DataModel({
    required this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<Symptom> symptoms;

  Data({
    required this.symptoms,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        symptoms: List<Symptom>.from(
            json["symptoms"].map((x) => Symptom.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "symptoms": List<dynamic>.from(symptoms.map((x) => x.toJson())),
      };
}

class Symptom {
  int id;
  String title;
  List<SubSymptom> subSymptom;

  Symptom({
    required this.id,
    required this.title,
    required this.subSymptom,
  });

  factory Symptom.fromJson(Map<String, dynamic> json) => Symptom(
        id: json["id"],
        title: json["title"],
        subSymptom: List<SubSymptom>.from(
            json["sub_symptom"].map((x) => SubSymptom.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sub_symptom": List<dynamic>.from(subSymptom.map((x) => x.toJson())),
      };
}

class SubSymptom {
  int id;
  String icon;
  String title;

  SubSymptom({
    required this.id,
    required this.icon,
    required this.title,
  });

  factory SubSymptom.fromJson(Map<String, dynamic> json) => SubSymptom(
        id: json["id"],
        icon: json["icon"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "title": title,
      };
}
