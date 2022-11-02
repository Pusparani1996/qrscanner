// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xml.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrintLetterBarcodeData _$PrintLetterBarcodeDataFromJson(
        Map<String, dynamic> json) =>
    PrintLetterBarcodeData(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      yob: json['yob'] as String?,
      co: json['co'] as String?,
      loc: json['loc'] as String?,
      vtc: json['vtc'] as String?,
      po: json['po'] as String?,
      dist: json['dist'] as String?,
      subdist: json['subdist'] as String?,
      state: json['state'] as String?,
      pc: json['pc'] as String?,
      dob: json['dob'] as String?,
    );

Map<String, dynamic> _$PrintLetterBarcodeDataToJson(
        PrintLetterBarcodeData instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'gender': instance.gender,
      'yob': instance.yob,
      'co': instance.co,
      'loc': instance.loc,
      'vtc': instance.vtc,
      'po': instance.po,
      'dist': instance.dist,
      'subdist': instance.subdist,
      'state': instance.state,
      'pc': instance.pc,
      'dob': instance.dob,
    };
