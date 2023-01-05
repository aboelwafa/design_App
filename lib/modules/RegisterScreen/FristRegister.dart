import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:design/modules/LoginScreen/FristLogin.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FristRegister extends StatefulWidget {
  const FristRegister({Key? key}) : super(key: key);
  static String id = 'FristRegister';

  @override
  State<FristRegister> createState() => _FristRegisterState();
}

class _FristRegisterState extends State<FristRegister> {
  bool obscureText = true;

  Icon fab = Icon(
    Icons.remove_red_eye_outlined,
  );

  int fabIconNumber = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/register.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 100),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  RotateAnimatedText(
                    textAlign: TextAlign.center,
                    'Create Account ',
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                    ),
                  ),
                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * .4,
                  left: 10.0,
                  right: 50.0,
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return ' the field must not be empty';
                            } else if (value.length < 3) {
                              return 'number of charcheter must more than 3';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Name',
                              hintStyle: TextStyle(fontFamily: 'ChivoMono'),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (String? value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'please enter a valid email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              hintText: 'Email',
                              hintStyle: TextStyle(fontFamily: 'ChivoMono'),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: obscureText,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            } else if (value.length < 5) {
                              return 'please enter strong password';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: () {
                                obscureText = !obscureText;
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
                              icon: fab,
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(fontFamily: 'ChivoMono'),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        InkWell(
                          child: Container(
                            height: 65,
                            width: size.width / 1.5,
                            decoration: BoxDecoration(
                              color: HexColor('#3A434D'),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'ChivoMono',
                                    color: HexColor('#59BEE6')),
                              ),
                            ),
                          ),
                          onTap: () {
                            if (formKey.currentState!.validate()) {
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
                                              'Create Account Success',
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
                              nameController.clear();
                              emailController.clear();

                              passwordController.clear();
                              Navigator.pushNamed(context, FristLogin.id);
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 55),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                textAlign: TextAlign.start,
                                'Already have an account?',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'ChivoMono',
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: HexColor('#3A434D'),
                                  ),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            color: HexColor('#59BEE6'),
                                            fontFamily: 'ChivoMono',
                                            fontSize: 16),
                                      ))),
                            ],
                          ),
                        ),
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

void showSnakBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
    message,
    style: TextStyle(
      fontFamily: 'ChivoMono',
      fontSize: 20.0,
      backgroundColor: Colors.green,
      color: Colors.white,
    ),
  )));
}
