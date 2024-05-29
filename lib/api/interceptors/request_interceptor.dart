import 'dart:async';

import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<Request> requestInterceptor(request) async {
  // final token = StorageService.box.pull(StorageItems.accessToken);

  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';

   // request.headers['User-Agent'] = await StorageService().getUserAgent();

  // EasyLoading.show(status: '');
  try {
    print("Http Request: ${request.url}");

    ///OLD WAY to be deleted soon if print("Http Request: ${request.url}"); works as expected
    // print("Http Request: " +
    //     request.url.origin +
    //     request.url.path +
    //     (request.url.query != null && request.url.query.toString().isNotEmpty
    //         ? "/?" + request.url.query
    //         : ""));
  } catch (e) {
    print("Http Request Error: " + e.toString());
  }
  return request;
}
