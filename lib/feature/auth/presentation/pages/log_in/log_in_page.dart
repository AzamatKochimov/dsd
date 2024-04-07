import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff91C788),
      appBar: AppBar(
        backgroundColor: const Color(0xff91C788),
        title: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
            child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        )),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 45, right: 45, top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome Back",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              "to kcal. Have a good time",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.white, width: 2))),
              child: Row(
                children: [
                  const Icon(Icons.email,
                      color: Colors.white), // No need for const here
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.white, width: 2))),
              child: Row(
                children: [
                  const Icon(Icons.lock,
                      color: Colors.white),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 5,
              color: Colors.white,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: const SizedBox(
                  height: 55,
                  width: 290,
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff91C788),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 200,),
            Container(
              // padding: EdgeInsets.only(bottom: 30.h),
              height: 250.h,
              alignment: Alignment.bottomCenter,
              child: const Row(  
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account ?",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    "Register here",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
