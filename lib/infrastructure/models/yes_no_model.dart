

// To parse this JSON data, do
//
//     final yesNoAnswer = yesNoAnswerFromJson(jsonString);

import 'dart:convert';

import 'package:yes_no_app/domain/entities/message.dart';

YesNoModel yesNoAnswerFromJson(String str) => YesNoModel.fromJsonMap(json.decode(str));
String yesNoAnswerToJson(YesNoModel data) => json.encode(data.toJson());


class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };


    Message toMessageEntity(){
      return Message(
        fromWho: FromWho.hisOrHer,
        text: answer=='yes' ? 'Si' :'No' ,
        imageUrl: image
      );
    }
}






/* class YesNoModel{
  String answer;
  bool forced;
  String image;

  YesNoModel({ required this.answer, required this.forced, required this.image});

  factory YesNoModel.fromJson( Map<String, dynamic> json){
    return YesNoModel(
      answer: json['answer'],
      forced: json['forced'],
      image: json['image']
    );
  }
} */