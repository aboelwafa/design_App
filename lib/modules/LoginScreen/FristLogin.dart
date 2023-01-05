
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../RegisterScreen/FristRegister.dart';

class FristLogin extends StatefulWidget {
   const FristLogin({Key? key}) : super(key: key);
   static String id = 'FristLogin';

  @override
  State<FristLogin> createState() => _FristLoginState();
}

class _FristLoginState extends State<FristLogin> {
  bool obscureText=true;
  Icon fab = Icon(
    Icons.remove_red_eye_outlined,
  );

  int fabIconNumber = 0;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  var formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.png'),
          fit: BoxFit.cover,
        ),

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 150),
              child:DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                  fontFamily: 'Pacifico'
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    WavyAnimatedText('Welcome Back',textStyle: TextStyle(color:HexColor('#59BEE6') )),
                    WavyAnimatedText('if you have account can you login ',textStyle: TextStyle(color: HexColor('#F4AC47'))),
                    WavyAnimatedText('Thank you for use my application '),

                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            Container(

              child: Padding(
                padding:  EdgeInsets.only(
                  top: size.height * .5,
                  left: 35.0,
                  right: 35.0,
                ),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: emailController,
                          validator: (String? value)
                          {
                            if(value!.isEmpty ||!value.contains('@'))
                            {
                              return'please enter a valid email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration:InputDecoration (

                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontFamily: 'ChivoMono'
                            ),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(20.0),
                            )
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          controller: passwordController,
                          obscureText: obscureText,
                          validator: (String? value)
                          {
                            if(value!.isEmpty )
                            {
                              return'please enter your password';
                            }
                            else if(value.length<5)
                            {
                              return'please enter strong password';
                            }

                            return null;
                          },
                          decoration:InputDecoration (
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  obscureText=!obscureText;
                                  setState(() {
                                  if (fabIconNumber == 0) {
                                    fab = Icon(
                                      Icons.remove_red_eye_outlined,
                                    );
                                    fabIconNumber = 1;
                                  } else {
                                    fab = Icon(Icons.visibility_off_outlined);
                                    fabIconNumber = 0;
                                  }
                                });
                                },
                                icon:fab ,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  fontFamily: 'ChivoMono'
                              ),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(20.0),

                              ),

                          ),
                        ),
                        SizedBox(height: 30.0,),
                        InkWell(
                          child: Container(
                            height: 65,
                            width: size.width/1.5,

                            decoration:BoxDecoration(
                              color: HexColor('#3A434D'),
                              borderRadius: BorderRadius.circular(50.0),

                            ),
                            child: Center(
                              child:
                              DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 7.0,
                                      color: Colors.white,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    FlickerAnimatedText('Login'),
                                  ],
                                  onTap: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                        backgroundColor: Colors.white,
                                        content: Column(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 50),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/images/true.gif'
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 10,top: 20),
                                              child: Text(
                                                'Login Successfully',
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 25.0,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          ],
                                        )));                                  },
                                ),
                              ),

                            ),
                          ),
                          onTap: ()
                          {
                            if(formKey.currentState!.validate())
                            {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  backgroundColor: Colors.white,
                                  content: Column(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 50),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/true.gif'
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10,top: 20),
                                        child: Text(
                                          'Login Successfully',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 25.0,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  )));
                              // emailController.clear();
                              // passwordController.clear();
                            }
                          },
                        ),
                        SizedBox(height: 40.0,),

                        Row(children: [
                          AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              RotateAnimatedText('Sing In ',
                                  textStyle: TextStyle(
                                fontSize: 40,
                                    fontFamily: 'Pacifico',
                                    color: HexColor('#3A434D'),


                              ),

                              ),
                              RotateAnimatedText('Sing In ',textStyle: TextStyle(
                                fontSize: 40,
                                fontFamily: 'Pacifico',
                                color: HexColor('#59BEE6'),
                              )),
                              RotateAnimatedText('Sing In ',textStyle: TextStyle(
                                fontSize: 40,
                                fontFamily: 'Pacifico',
                                color: HexColor('#F4AC47'),
                              )),
                            ],
                            isRepeatingAnimation: true,
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                         Spacer(),
                          CircleAvatar(
                            radius: 30.0,
                            backgroundColor: HexColor('#3A434D'),
                            child: IconButton(
                              onPressed: (){
                                Navigator.pushNamed(context, FristRegister.id);
                              },
                              icon: Icon(Icons.arrow_forward_rounded,color: Colors.blue,),
                            ),
                          ),
                        ],)

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
