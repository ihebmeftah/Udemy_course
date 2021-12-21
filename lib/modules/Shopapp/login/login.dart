import 'package:flutter/material.dart';
import 'package:newsapp/modules/Shopapp/login/registre.dart';
import 'package:newsapp/shared/components/components.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var mailcontroler = TextEditingController();
  var passwordcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LOGIN',
                  style: Theme.of(context).textTheme.headline5,
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
                  isPass: true,
                  textInputType: TextInputType.visiblePassword,
                  htext: 'Password',
                  prefix: Icons.password,
                  sufix: Icons.visibility,
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
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ))),
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
    );
  }
}
