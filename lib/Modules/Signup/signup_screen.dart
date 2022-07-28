import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/Modules/About_us/about_us_screen.dart';
import 'package:petology/Modules/Login/login_screen.dart';
import 'package:petology/Modules/Signup/Cubit/signup_cubit.dart';
import 'package:petology/Modules/Signup/Cubit/signup_states.dart';
import 'package:petology/Shared/Components/components.dart';
import 'package:petology/Shared/Components/constant.dart';
import 'package:petology/Shared/Network/local/cache_helper.dart';

class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  var emailController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var passwordController = TextEditingController();
  var reEnterPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  String dropDownValue = 'Egypt';

  List<String> countries = [
    'Egypt',
    'Alex',
    'Mansoura',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit,SignUpStates>(
        listener: (context, state)
        {
          if(state is SignUpSuccessState) {
            if (state.loginModel.status) {
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data.token,
              ).then((value) {
                token = state.loginModel.data.token;
              });
            } else {
              print(state.loginModel.message);
            }
          }
        },
        builder:(context, state)
        {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    // content of Header
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [
                                  HexColor("#50352A"),
                                  HexColor("#170F0C"),
                                ],
                              ),
                            ),
                            height: 90,
                            width:MediaQuery.of(context).size.width,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Image(image: AssetImage('assets/logo.png'),width: 170,height: 50,),
                                  SizedBox(
                                    width: 280,
                                  ),
                                  TextButton(
                                    onPressed: ()
                                    {
                                      navigateTo(context, AboutUsScreen());
                                    },
                                    child: Text(
                                      'About us',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: HexColor("#C9C9C9"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      'Categories',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: HexColor("#C9C9C9"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      'Services',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: HexColor("#C9C9C9"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      'Request',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: HexColor("#C9C9C9"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 110,
                                  ),
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: HexColor("#FFE3C5"),
                                      ),
                                    ),
                                    color: Colors.white,
                                    height: 50,
                                    minWidth: 160,
                                    onPressed: (){},
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                        color: HexColor("#101010"),
                                        fontSize: 25,
                                      ),
                                    ) ,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: HexColor("#FFE3C5"),
                                      ),
                                    ),
                                    height: 50,
                                    minWidth: 160,
                                    onPressed: ()
                                    {
                                      navigateTo(context, LoginScreen());
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: HexColor("#C9C9C9"),
                                        fontSize: 25,
                                      ),
                                    ) ,
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Stack(
                      children: [
                        Image.asset('assets/brownLeg2.png'),
                        Padding(
                          padding: const EdgeInsets.only(top: 1008,left:796),
                          child: Image.asset('assets/brownLeg.png'),
                        ),
                        // content of signup data
                        Container(
                          width: 900,
                          height: 1100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 3,color: HexColor("#101010"),),
                          ),
                          child:Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: HexColor("#492F24"),
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 300,
                                    height: 80,
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(34),
                                      ),
                                      color: HexColor("#2F4582"),
                                      minWidth: 250,
                                      onPressed: (){},
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 25),
                                            child: Icon(Icons.facebook,color: Colors.white,size: 40),
                                          ),
                                          SizedBox(
                                            width: 35,
                                          ),
                                          Text(
                                            'Facebook',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Container(
                                    width: 300,
                                    height: 80,
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(34),
                                        side: BorderSide(
                                          color: HexColor("#707070"),
                                        ),
                                      ),
                                      minWidth: 250,
                                      onPressed: (){},
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 35),
                                            child: Image.asset('assets/icons8-google-48.png',width: 40,height: 40,),
                                          ),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Text(
                                            'Google',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(start: 40,end: 35),
                                      child: Container(
                                        width: 370,
                                        height: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'or',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: HexColor("#492F24"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(start: 35,),
                                      child: Container(
                                        width: 360,
                                        height: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: 700,
                                child: defaultFormFeild(
                                  controller: firstNameController,
                                  type: TextInputType.name ,
                                  validate: (String value){
                                    if (value.isEmpty)
                                    {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  } ,
                                  label: 'First Name',
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                width: 700,
                                child: defaultFormFeild(
                                  controller: lastNameController,
                                  type: TextInputType.name ,
                                  validate: (String value){
                                    if (value.isEmpty)
                                    {
                                      return 'Please enter your last name';
                                    }
                                    return null;
                                  } ,
                                  label: 'Last Name',
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                width: 700,
                                child: defaultFormFeild(
                                  controller: emailController,
                                  type: TextInputType.name ,
                                  validate: (String value){
                                    if (value.isEmpty)
                                    {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  } ,
                                  label: 'Email',
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                width: 700,
                                child: defaultFormFeild(
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword ,
                                  validate: (String value){
                                    if (value.isEmpty)
                                    {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  } ,
                                  label: 'Password',
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                width: 700,
                                child: defaultFormFeild(
                                  controller: reEnterPasswordController,
                                  type: TextInputType.visiblePassword ,
                                  validate: (String value){
                                    if (value.isEmpty)
                                    {
                                      return 'Please re-enter your password';
                                    }
                                    return null;
                                  } ,
                                  label: 'Re-Enter Password',
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              SizedBox(
                                width: 705,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ) ,
                                  value: dropDownValue,
                                  icon: Icon(Icons.arrow_drop_down_sharp),
                                  items: countries.map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item, style: TextStyle(fontSize: 24),),
                                  )).toList(),
                                  onChanged: (item) => setState(() => dropDownValue = item),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Center(
                                child: Container(
                                  width: 700,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: HexColor("#492F24"),
                                    borderRadius: BorderRadius.circular(54),
                                  ),
                                  child: MaterialButton(
                                    onPressed: ()
                                    {
                                      if(formKey.currentState.validate()){
                                        print(firstNameController.text);
                                        print(lastNameController.text);
                                        print(emailController.text);
                                        print(passwordController.text);
                                        print(reEnterPasswordController.text);
                                      }
                                    },
                                    child: Text(
                                      ' Sign up',
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: HexColor("#FFE3C5"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: HexColor("#492F24"),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: ()
                                    {
                                      navigateTo(context, LoginScreen());
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: HexColor("#492F24"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ) ,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 140,
                    ),
                    // content of footer
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                HexColor("#50352A"),
                                HexColor("#170F0C"),
                              ],
                            ),
                          ),
                          height: 520,
                          width:MediaQuery.of(context).size.width,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 330,top: 20),
                          child: Image.asset('assets/biegLeg2.png',width: 200,height: 200,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 950,top: 20),
                          child: Image.asset('assets/biegLeg2.png',width: 200,height: 200,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1100,top: 170),
                          child: Image.asset('assets/footer_dog.png',),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:45,top: 80 ),
                                  child: Text(
                                    'For any questions',
                                    style: TextStyle(
                                      color: HexColor("#FFE3C5"),
                                      fontSize: 54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 165,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 80 ),
                                  child: Text(
                                    'We are waiting you',
                                    style: TextStyle(
                                      color: HexColor("#FFE3C5"),
                                      fontSize: 54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:45,top: 80 ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.email_sharp,color: HexColor("#AE957B"),size: 70,),
                                      SizedBox(width: 20,),
                                      Text(
                                        'Email@petology.com',
                                        style: TextStyle(
                                          color: HexColor("#AE957B"),
                                          fontSize: 41,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 80 ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on,color: HexColor("#AE957B"),size: 70,),
                                      SizedBox(width: 20,),
                                      Text(
                                        'First settlement/Cairo',
                                        style: TextStyle(
                                          color: HexColor("#AE957B"),
                                          fontSize: 41,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:45,top: 80 ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.phone,color: HexColor("#AE957B"),size: 70,),
                                      SizedBox(width: 30,),
                                      Text(
                                        '(+2)0123456789',
                                        style: TextStyle(
                                          color: HexColor("#AE957B"),
                                          fontSize: 41,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 165,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 80 ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on,color: HexColor("#AE957B"),size: 70,),
                                      SizedBox(width: 20,),
                                      Text(
                                        'Cairo/Egypt',
                                        style: TextStyle(
                                          color: HexColor("#AE957B"),
                                          fontSize: 41,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } ,
      ),
    );
  }
}