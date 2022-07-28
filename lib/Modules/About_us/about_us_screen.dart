import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/Modules/Login/login_screen.dart';
import 'package:petology/Shared/Components/components.dart';

class AboutUsScreen extends StatefulWidget {

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  var phoneController = TextEditingController();

  var locationController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  String selectedItems = 'category';

  List<String> categories = [
    'category',
    'category1',
    'category2',
  ];

  @override
  Widget build(BuildContext context) {
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
                              onPressed: (){},
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

              // content of signup data
              Container(
                width: 900,
                height: 1200,
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
                        'Help your friend',
                        style: TextStyle(
                          color: HexColor("#492F24"),
                          fontSize: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Icon(Icons.camera_alt,size: 200,color: HexColor("#492F24"),),
                    SizedBox(
                      height: 40,
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
                        value: selectedItems,
                        icon: Icon(Icons.arrow_drop_down_sharp),
                        items: categories.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item, style: TextStyle(fontSize: 24),),
                        )).toList(),
                        onChanged: (item) => setState(() => selectedItems = item),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 400),
                      child: Text(
                        'Detect your current location',
                        style: TextStyle(
                          fontSize: 20,
                          color: HexColor("#492F24"),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 700,
                      child: defaultFormFeild(
                        controller: locationController,
                        type: TextInputType.text ,
                        validate: (String value){
                          if (value.isEmpty)
                          {
                            return 'Please enter your location';
                          }
                          return null;
                        } ,
                        label: 'Location',
                        suffix: Icons.location_on,
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      width: 700,
                      child: defaultFormFeild(
                        controller: phoneController,
                        type: TextInputType.phone ,
                        validate: (String value){
                          if (value.isEmpty)
                          {
                            return 'Please enter your phone number';
                          }
                          return null;
                        } ,
                        label: 'Phone number',
                      ),
                    ),
                    SizedBox(
                      height: 65,
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
                              print(locationController.text);
                              print(phoneController.text);
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
                    Center(
                      child: Container(
                        width: 700,
                        height: 90,
                        decoration: BoxDecoration(
                          color: HexColor("#FFE3C5"),
                          borderRadius: BorderRadius.circular(54),
                        ),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            ' Call',
                            style: TextStyle(
                              fontSize: 40,
                              color: HexColor("#492F24"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ) ,
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
  }
}
