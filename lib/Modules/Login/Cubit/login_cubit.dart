import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/Models/login_model.dart';
import 'package:petology/Modules/Login/Cubit/login_states.dart';
import 'package:petology/Shared/Network/end_points.dart';
import 'package:petology/Shared/Network/remote/dio_helper.dart';

class LoginCubit extends Cubit <LoginStates>
{
  LoginCubit() : super (LoginInitialState());

  static LoginCubit get(context) =>BlocProvider.of(context);

  LoginModel loginModel ;

  void userLogin({
    @required String email,
    @required String password,
  })
  {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email':email,
        'password':password,
      },
    ).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
  }

}