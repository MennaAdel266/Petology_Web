import 'package:petology/Models/login_model.dart';

abstract class SignUpStates {}

class SignUpInitialState extends  SignUpStates{}

class SignUpLoadingState extends  SignUpStates{}

class SignUpSuccessState extends  SignUpStates
{
  final LoginModel loginModel;

  SignUpSuccessState(this.loginModel);

}

class SignUpErrorState extends  SignUpStates
{
  final String error;

  SignUpErrorState(this.error);
}