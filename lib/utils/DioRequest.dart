//基于dio进行二次封装
import 'package:dio/dio.dart';
import 'package:mc00_shop/constants/index.dart';

class DioRequest {
  final _dio = Dio();
  DioRequest() {
    _dio.options
      ..baseUrl = GlobleConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobleConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobleConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobleConstants.TIME_OUT);

    //拦截器
  }
  void _addInterceptor() {}

  //   final Dio _dio = Dio();
  //
  //   DioRequest() {
  //     _dio.options
  //       ..baseUrl = GlobleConstants.BASE_URL
  //       ..connectTimeout = Duration(seconds: GlobleConstants.TIME_OUT)
  //       ..sendTimeout = Duration(seconds: GlobleConstants.TIME_OUT)
  //       ..receiveTimeout = Duration(seconds: GlobleConstants.TIME_OUT);
  //     //拦截器
  //     _addInterceptor();
  //   }
  //
  //   void _addInterceptor() {
  //     // _dio.interceptors.add(
  //     //   Interceptor(onRequest: () {}, onResponse: () {}, onError: () {}),
  //     // );
  //     _dio.interceptors.add(
  //       InterceptorsWrapper(
  //         onRequest: (options, handler) {
  //           handler.next(options);
  //         },
  //         onResponse: (response, handler) {
  //           //http状态码200 300
  //           if (response.statusCode! >= 200 && response.statusCode! <= 300) {
  //             handler.next(response);
  //             return;
  //           }
  //           handler.reject(DioException(requestOptions: response.requestOptions));
  //           handler.next(response);
  //         },
  //         onError: (error, handler) {
  //           handler.reject(error);
  //         },
  //       ),
  //     );
  //
  //     get(String url, {Map<String, dynamic>? params}) {
  //       return _dio.get(url, queryParameters: params);
  //     }
  //
  //     //进一步处理结果的函数
  //     _handleResponse(Future<Response<dynamic>> task) async {
  //       try {
  //         Response<dynamic> res = await task;
  //         final data = res.data as Map<String, dynamic>;
  //         if (data["code"] == GlobleConstants.SUCCESS_CODE) {
  //           //才认定http状态和业务状态均正常 就可以正常放行
  //           return data["result"];
  //         }
  //         //抛出异常
  //         throw Exception(data["msg"] ?? "加载数据异常");
  //       } catch (e) {
  //         throw Exception(e);
  //       }
  //     }
  //   }
}

final dioRequest = DioRequest();
//dio请求工具发出请求 返回的数据 Response<dynamic>.data
//把所有的接口的data解放出来 拿到真的数据 判断业务状态码是不是等于1
