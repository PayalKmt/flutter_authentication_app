import 'package:authentication_app/app/models/token_model.dart';
import 'package:authentication_app/app/utils/constants.dart';
import 'package:dio/dio.dart';

class AppService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      contentType: 'application/json'
    )
  );

  Future<void> loginAndSendOtp({required String phone}) async{
    try{
      final response = await _dio.post(
        '/api/v1/auth/login',
        data: {'phone_number': phone},
      );

      if(response.statusCode == 200){
        print('OTP sent successfully');
        return;
      }

    }catch(e){
      throw Exception(e);
    }
  }

  Future<TokenModel> verifyOtp({required String phone, required String otp}) async{
    try{
      final response = await _dio.post(
        '/api/v1/auth/verify/otp',
        data: {'phone_number': phone, 'otp': otp},
      );
      if (response.statusCode == 200) {
        // Successfully received token
        return TokenModel.fromJson(response.data);
      }
      throw Exception('Verification failed with status code ${response.statusCode}');
    }catch(e){
      throw Exception(e);
    }
  }

}