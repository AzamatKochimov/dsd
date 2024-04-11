import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backround,
        body: Consumer(
          builder: (context, ref, _) {
            ref.watch(loginref);
            return Container(
              margin: const EdgeInsets.only(top: 90, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Good Morning, ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white),
                      ),
                      Image.asset(
                        'assets/images/waveemoji.png',
                        width: 25,
                        height: 25,
                      )
                    ],
                  ),
                  const Text(
                    "Welcome back!",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.white),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: ref.read(loginref).isEmail
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: 5,
                          color: ref.read(loginref).isEmail
                              ? AppColors.greenishblue
                              : AppColors.backround,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              ref.read(loginref).swapEmail();
                            },
                            child: SizedBox(
                              height: 55,
                              width: 150.w,
                              child: const Center(
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: ref.read(loginref).isEmail
                              ? Border.all(color: Colors.white)
                              : Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: 5,
                          color: ref.read(loginref).isEmail
                              ? AppColors.backround
                              : AppColors.greenishblue,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              ref.read(loginref).swapEmail();
                            },
                            child: SizedBox(
                              height: 55,
                              width: 150.w,
                              child: const Center(
                                child: Text(
                                  "Mobile Number",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ref.read(loginref).isEmail
                      ? TextField(
                        controller: ref.read(loginref).isEmail
                            ? emailController
                            : phoneController,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: ref.read(loginref).isEmail
                              ? 'Email'
                              : 'Mobile Number',
                          hintStyle: const TextStyle(
                              color: Colors.white70, fontSize: 14),
                        ),
                        style: const TextStyle(color: Colors.white),
                      )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 70,
                              height: 35,
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: AppColors.greenishblue),
                              child: Center(
                                child: DropdownButton(
                                  style: const TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600),
                                  value: ref.read(loginref).dropdownvalue,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  ),
                                  dropdownColor: AppColors.backround,
                                  items: ref
                                      .read(loginref)
                                      .numberCodes
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    ref
                                        .read(loginref)
                                        .swapDropdownValue(newValue);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                controller: ref.read(loginref).isEmail
                                    ? emailController
                                    : phoneController,
                                decoration: InputDecoration(
                                  fillColor: Colors.transparent,
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: ref.read(loginref).isEmail
                                      ? 'Email'
                                      : 'Mobile Number',
                                  hintStyle: const TextStyle(
                                      color: Colors.white70, fontSize: 14),
                                ),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref.read(loginref).swapChecked();
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.greenishblue,
                              width: 2.5,
                            ),
                            color: ref.read(loginref).isChecked
                                ? AppColors.greenishblue
                                : Colors.transparent,
                          ),
                          child: ref.read(loginref).isChecked
                              ? const Icon(
                                  Icons.check,
                                  size: 16.0,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Keep this number",
                        style: TextStyle(fontSize: 12, color: AppColors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                  Center(
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      elevation: 5,
                      color: AppColors.greenishblue,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          Navigator.pushNamed(context, AppRouteName.SMS_VERIFICATION_PAGE);
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
                  const SizedBox(
                    height: 30,
                  ),
                  Center(child: Image.asset('assets/images/or.png')),
                  const SizedBox(
                    height: 30,
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
                                    "Login with Google",
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
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRouteName.REGISTER_PAGE);
                          },
                          child: const SizedBox(
                            height: 55,
                            width: 310,
                            child: Center(
                              child: Text(
                                "Create an account",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
