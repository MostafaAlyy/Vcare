import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Core/my_validators.dart';

import '../../ViewModel/register_cubit/register_cubit.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const String routeName = 'register-screen';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  bool male = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is RegisterSuccessState) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 12.0);
          }
        },
        builder: (context, state) {
          var cupit = RegisterCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Let’s get started!",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 38),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "create an account and start booking now.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 22),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) =>
                              MyValidators.nameValidator(value),
                          controller: nameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            labelText: "Name",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) =>
                              MyValidators.emailValidator(value),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            labelText: "Email",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            labelText: "Phone",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) =>
                              MyValidators.passwordValidator(value),
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            labelText: "Password",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) =>
                              MyValidators.repeatPasswordValidator(
                                  password: passwordController.text,
                                  value: value),
                          controller: passwordConfirmController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            labelText: "Confirm Password",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                    activeColor: ColorHelper.mainColor,
                                    checkColor: Colors.white,
                                    value: male,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        male = value!;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: MediaQuery.of(context)
                                              .textScaleFactor *
                                          18),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                    activeColor: ColorHelper.mainColor,
                                    checkColor: Colors.white,
                                    value: !male,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        male = !value!;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: MediaQuery.of(context)
                                              .textScaleFactor *
                                          18),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Already have an account?'),
                            TextButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(LoginPage.routeName),
                                child: const Text('Login here'))
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 15,
                          child: MaterialButton(
                            onPressed: () {
                              if (formKey.currentState?.validate() == false) {
                                return;
                              }
                              cupit.register(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  gender: (male) ? 0 : 1,
                                  password: passwordController.text,
                                  passwordConfirmation:
                                      passwordConfirmController.text);
                            },
                            color: ColorHelper.mainColor,
                            child: const Text(
                              "Register",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
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
