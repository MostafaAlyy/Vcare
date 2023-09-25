import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcare/Core/general_components/main_button.dart';
import 'package:vcare/Core/my_validators.dart';
import 'package:vcare/Features/Auth/View/Pages/register.dart';
import 'package:vcare/Features/Auth/ViewModel/login_cubit/login_cubit.dart';
import 'package:vcare/Features/Home%20Screen/View/Pages/homeScreen.dart';

import '../../../../Core/general_components/CustomCircularProgressIndicator.dart';
import '../../../../Core/general_components/build_show_toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = 'login-screen';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController(text: 'aa@aa.com');
    _passwordController = TextEditingController(text: 'password');
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool keepMeLogin = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 36.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Login to access your assigned tasks and personal overview.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      validator: (value) => MyValidators.emailValidator(value),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: "Email",
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      validator: (value) =>
                          MyValidators.passwordValidator(value),
                      controller: _passwordController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: keepMeLogin,
                          onChanged: (value) {
                            setState(() {
                              keepMeLogin = value!;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'keep Me Logged In',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildRegisterHereRichText(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildBlocConsumerMainButton(cubit),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildRegisterHereRichText() {
    return RichText(
      text: TextSpan(
        text: 'No account yet?   ',
        style: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14.sp),
        children: [
          TextSpan(
            text: 'Register here.',
            recognizer: TapGestureRecognizer()
              ..onTap =
                  () => Navigator.of(context).pushNamed(RegisterPage.routeName),
          )
        ],
      ),
    );
  }

  Widget buildBlocConsumerMainButton(LoginCubit cubit) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          buildShowToast(state.successMessage);
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
        }
        if (state is LoginError) {
          buildShowToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const CustomCircularProgressIndicator();
        }
        return MainButton(
          text: 'Login',
          onTap: () {
            validateAndSubmit(cubit);
          },
        );
      },
    );
  }

  void validateAndSubmit(LoginCubit cubit) {
    if (_formKey.currentState!.validate()) {
      cubit.login(
        keepMeLogin: keepMeLogin,
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }
}
