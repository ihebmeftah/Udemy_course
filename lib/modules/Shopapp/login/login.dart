// ignore_for_file: avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/Shopapp/login/logincubit/cubit.dart';
import 'package:newsapp/modules/Shopapp/login/logincubit/states.dart';
import 'package:newsapp/modules/Shopapp/login/registre.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var mailcontroler = TextEditingController();
  var passwordcontroler = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Logincubit(),
      child: BlocConsumer<Logincubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessStates) {
            if (state.shoploginmodel!.status == true) {
              print(state.shoploginmodel!.message);
              print(state.shoploginmodel!.data!.token);
              Fluttertoast.showToast(
                  msg: state.shoploginmodel!.message!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              Fluttertoast.showToast(
                  msg: state.shoploginmodel!.message!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultTextFormField(
                          textInputType: TextInputType.emailAddress,
                          htext: 'Email',
                          prefix: Icons.mail,
                          controller: mailcontroler,
                          validate: (String? val) {
                            if (val!.isEmpty) {
                              return 'Please enter your Email';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultTextFormField(
                          onsubmit: (val) {
                            if (formKey.currentState!.validate()) {
                              Logincubit.get(context).userlogin(
                                  email: mailcontroler.text,
                                  password: passwordcontroler.text);
                            }
                          },
                          isPass: Logincubit.get(context).isPassShow,
                          textInputType: TextInputType.visiblePassword,
                          htext: 'Password',
                          prefix: Icons.password,
                          pressicon: () {
                            Logincubit.get(context).changepasswordvisibilty();
                          },
                          sufix: Logincubit.get(context).suffin,
                          controller: passwordcontroler,
                          validate: (String? val) {
                            if (val!.isEmpty) {
                              return 'Please enter your Password';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginlaodingStates,
                          builder: (context) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              width: double.infinity,
                              child: TextButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      Logincubit.get(context).userlogin(
                                          email: mailcontroler.text,
                                          password: passwordcontroler.text);
                                    }
                                  },
                                  child: const Text(
                                    'LOGIN',
                                    style: TextStyle(color: Colors.white),
                                  ))),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                                onPressed: () {
                                  pushAndRemoveUntil(context, const Registre());
                                },
                                child: const Text('Registre'))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
