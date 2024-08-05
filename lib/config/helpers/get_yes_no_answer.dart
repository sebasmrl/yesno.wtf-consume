

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer{
  final _dio = Dio( 
    BaseOptions(
      baseUrl: 'https://yesno.wtf' 
    )
  );

  Future<Message> getAnswer()async{
    final res =await _dio.get('/api');
   
    final yesNoModel = YesNoModel.fromJsonMap(res.data);
    return Future.value( yesNoModel.toMessageEntity() );
  } 



}



 /* final res =await _dio.get('/api');
    final yesNoModel = YesNoModel.fromJson(res.data);

    final message =  Message(
      text: yesNoModel.answer,
      fromWho: FromWho.hisOrHer,
      imageUrl: yesNoModel.image
    );
    return Future.value(message); */