import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/feature/auth/presentation/widgets/register/register.dart';
import 'package:dsd/feature/auth/view_model/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backround,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.backround,
          leading: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          title: const Text("Registration",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        body: Consumer(
          builder: (context, ref, _) {
            ref.watch(loginref);
            var reff = ref.watch(loginref);
            return Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...customTextfield(firstnameController, "First name"),
                  const SizedBox(
                    height: 10,
                  ),
                  ...customTextfield(lastnameController, "Last name"),
                  const SizedBox(
                    height: 10,
                  ),
                  ...customTextfield(phoneController, "Phone number"),
                  const SizedBox(
                    height: 10,
                  ),
                  ...customTextfield(emailController, "Email address"),
                  const SizedBox(
                    height: 10,
                  ),
                  ...customTextfield(passwordController, "Password"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Spacer(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        elevation: 5,
                        color: AppColors.greenishblue,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            reff.getSms(emailController.text);
                            reff.phoneNumber = phoneController.text;
                            reff.email = emailController.text;
                            reff.password = passwordController.text;
                            reff.firstName = firstnameController.text;
                            reff.lastName = lastnameController.text;
                            Navigator.pushNamed(
                                context, AppRouteName.SMS_VERIFICATION_PAGE);
                          },
                          child: SizedBox(
                            height: 55,
                            width: 310.w,
                            child: const Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(child: Image.asset('assets/images/or.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        elevation: 5,
                        color: const Color.fromARGB(120, 255, 255, 255),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {},
                          child: SizedBox(
                            height: 55,
                            width: 310,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/google.png'),
                                  const SizedBox(width: 20),
                                  const Text(
                                    "Register with Google",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Center(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       border: Border.all(
                  //         color: Colors.white,
                  //         width: 2,
                  //       ),
                  //     ),
                  //     child: Material(
                  //       borderRadius: BorderRadius.circular(15),
                  //       elevation: 5,
                  //       color: const Color.fromARGB(120, 255, 255, 255),
                  //       child: InkWell(
                  //         borderRadius: BorderRadius.circular(15),
                  //         onTap: () {
                  //           Navigator.pushNamed(
                  //               context, AppRouteName.REGISTER_PAGE);
                  //         },
                  //         child: const SizedBox(
                  //           height: 55,
                  //           width: 310,
                  //           child: Center(
                  //             child: Text(
                  //               "Create an account",
                  //               style: TextStyle(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w700,
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ));
  }
}
