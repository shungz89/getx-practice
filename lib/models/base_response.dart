class BaseResponse<T> {
  T? data;

  BaseResponse({this.data});

  //Take note, Function(Object) create is Object instead of Map<String,dynamic>
  //That is why when we retrieve it at caller, we need to Map it back to
  //Map<String, dynamic> or List<dynamic>
  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(Object) create) {
    //Check for Object Type:
    // print('Object Created Type is: '+
    //     create(json['result']).runtimeType.toString());

    return BaseResponse<T>(
      data: json['data'] != null ? create(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}
