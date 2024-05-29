import 'sub_object.dart';

class MainObject {
  int? id;
  String? someKey;
  List<SubObject>? subObject;

  MainObject({
    this.id,
    this.someKey,
    this.subObject,
  });

  factory MainObject.fromJson(Map<String, dynamic> json) => MainObject(
        id: json['id'] as int?,
        someKey: json['someKey'] as String?,
        subObject: (json['subObject'] as List<dynamic>?)
            ?.map((e) => SubObject.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'someKey': someKey,
        'subObject': subObject?.map((e) => e.toJson()).toList(),
      };
}
