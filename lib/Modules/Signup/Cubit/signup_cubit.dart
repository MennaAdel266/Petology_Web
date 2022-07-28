import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/Models/login_model.dart';
import 'package:petology/Modules/Signup/Cubit/signup_states.dart';
import 'package:petology/Shared/Network/end_points.dart';
import 'package:petology/Shared/Network/remote/dio_helper.dart';

class SignUpCubit extends Cubit <SignUpStates> {
  SignUpCubit() : super (SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel;

  void userRegister({
    @required String email,
    @required String name,
    @required String password,
    @required String phone,
  }) {
    emit(SignUpLoadingState());
    DioHelper.postData(
      url: SIGNUP,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(SignUpSuccessState(loginModel));
    }).catchError((error) {
      emit(SignUpErrorState(error.toString()));
    });
  }
}