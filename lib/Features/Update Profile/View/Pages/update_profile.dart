import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Core/my_validators.dart';
import 'package:vcare/Features/Account%20Tab/View/Pages/account_tab.dart';

import '../../../../Core/general_components/CustomCircularProgressIndicator.dart';
import '../../../../Core/general_components/build_show_toast.dart';
import '../../../../Core/general_components/main_button.dart';
import '../../../Auth/ViewModel/login_cubit/login_cubit.dart';
import '../../View Model/update_profile_cubit.dart';
import '../../View Model/update_profile_states.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});
  static const String routeName = 'update-screen';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController phoneController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController passwordConfirmController =
      TextEditingController();
  bool male = true;
  var formKey = GlobalKey<FormState>();
  var passwordKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateCubit(),
      child: BlocConsumer<UpdateCubit, UpdateState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is UpdateSuccessState) {
            Fluttertoast.showToast(
                msg: state.updateResponse,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 12.0);
          }
        },
        builder: (context, state) {
          var cupit = UpdateCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorHelper.mainColor,
            ),
            resizeToAvoidBottomInset: true,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Update details!",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor *
                                        38),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Update your info and become a new you!",
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
                          validator: (value) =>
                              MyValidators.phoneValidator(value),
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
                        TextButton(
                            onPressed: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Form(
                                          key: passwordKey,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                validator: (value) =>
                                                    MyValidators
                                                        .passwordValidator(
                                                            value),
                                                controller: passwordController,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                decoration:
                                                    const InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(),
                                                  labelText: "Password",
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              TextFormField(
                                                validator: (value) => MyValidators
                                                    .repeatPasswordValidator(
                                                        password:
                                                            passwordController
                                                                .text,
                                                        value: value),
                                                controller:
                                                    passwordConfirmController,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                decoration:
                                                    const InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(),
                                                  labelText: "Confirm Password",
                                                ),
                                              ),
                                              const Spacer(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        passwordController
                                                            .clear();
                                                        passwordConfirmController
                                                            .clear();
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 20),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        if (passwordKey
                                                                .currentState
                                                                ?.validate() ==
                                                            false) {
                                                          return;
                                                        }
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        'Ok',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text('Change password?')),
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
                        buildBlocConsumerMainButton(cupit)
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

  Widget buildBlocConsumerMainButton(UpdateCubit cubit) {
    return BlocConsumer<UpdateCubit, UpdateState>(
      listener: (context, state) {
        if (state is UpdateSuccessState) {
          buildShowToast(state.updateResponse);
        }
        if (state is UpdateErrorState) {
          buildShowToast(state.message ?? '');
        }
      },
      builder: (context, state) {
        if (state is UpdateLoading) {
          return const CustomCircularProgressIndicator();
        }
        return MainButton(
          text: 'Update',
          onTap: () {
            validateAndSubmit(cubit);
          },
        );
      },
    );
  }

  void validateAndSubmit(UpdateCubit cubit) {
    if (formKey.currentState!.validate()) {
      cubit.updateData(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          gender: (male) ? 0 : 1,
          password: passwordController.text,
          passwordConfirmation: passwordConfirmController.text);
    }
  }
}
