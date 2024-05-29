import 'dart:async';


import '../models/base_response.dart';
import '../models/request/get_some_list_request.dart';
import '../models/result/get_user_list_result.dart';
import 'api_provider.dart';

class ApiRepository {
  ApiRepository({required this.apiProviderFj});

  final ApiProvider apiProviderFj;

  Future<BaseResponse<List<GetUserListResult?>>?> getUserList(
      GetSomeListRequest data) async {
    try {
      final res =
          await apiProviderFj.getUserList('users', data);
      if (res.statusCode == 200) {
        return BaseResponse.fromJson(
            res.body,
            (json) =>
                (json as List<dynamic>)
                    .map((e) => GetUserListResult.fromJson(e as Map<String, dynamic>))
                    .toList());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
