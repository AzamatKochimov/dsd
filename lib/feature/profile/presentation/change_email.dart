import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({super.key});

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> with WidgetsBindingObserver {
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;
  double _sizedBoxHeight = 300.h;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _newEmailController.dispose();
    _passwordController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    setState(() {
      final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
      _sizedBoxHeight = bottomInset > 0 ? 50.0.h : 300.0.h;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c202020,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Change email",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Old email
            const Text(
              "Available email",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.h),
            //! Email container
            Container(
              height: 40.h,
              width: 312.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "sevinchmardonova@gmail.com",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            //! New Email
            const Text(
              "Your new email",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.h),
            //! Email container
            SizedBox(
              width: 312.w,
              child: TextField(
                onChanged: (_) => _validateInputs(),
                controller: _newEmailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white.withOpacity(0.5),
                  hintText: "Enter an email",
                  hintStyle: TextStyle(
                    color: AppColors.white.withOpacity(0.4),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: AppColors.white.withOpacity(0.5)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: AppColors.white.withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: AppColors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            //! Password
            const Text(
              "Password",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.h),
            //! Password container
            SizedBox(
              width: 312.w,
              child: TextField(
                controller: _passwordController,
                onChanged: (_) => _validateInputs(),
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white.withOpacity(0.5),
                  hintText: "********",
                  hintStyle: TextStyle(
                    color: AppColors.white.withOpacity(0.4),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: AppColors.white.withOpacity(0.5)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: AppColors.white.withOpacity(0.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: AppColors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                const Text(
                  "Email or password is incorrect",
                  style: TextStyle(
                    color: Color(0xffFF0000),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 5.w),
                SvgPicture.asset('assets/icons/error-email.svg'),
              ],
            ),
            SizedBox(
              height: _sizedBoxHeight,
            ),
            Visibility(
              visible: _isButtonEnabled,
              child: SizedBox(
                width: 312.w,
                child: ElevatedButton(
                  onPressed: _isButtonEnabled ? () {} : null,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.c57C5B6),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Text('Save',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validateInputs() {
    setState(() {
      _isButtonEnabled = _newEmailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }
}
