import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram/data/firebase_services/firebase_auth.dart';
import 'package:instagram/util/dailog_box.dart';
import 'package:instagram/util/exceptions.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback togglePage;
  const LoginPage({super.key, required this.togglePage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final FocusNode email_f = FocusNode();
  final FocusNode password_f = FocusNode();
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 45.h),
              Center(child: Image.asset('assets/pictures/logo.jpg')),
              SizedBox(height: 80.h),
              _textField(email, Icons.email_outlined, 'Email', email_f),
              SizedBox(height: 15.h),
              _textField(
                password,
                Icons.lock,
                'Password',
                password_f,
                isObscure: true,
              ),
              SizedBox(height: 10.h),
              _forgotPassword(),
              SizedBox(height: 20.h),
              _loginButton(),
              SizedBox(height: 10.h),
              _signupRedirect(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(
    TextEditingController controller,
    IconData icon,
    String hint,
    FocusNode node, {
    bool isObscure = false,
  }) {
    return Container(
      height: 52.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: TextField(
          controller: controller,
          focusNode: node,
          obscureText: isObscure,
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(width: 2.w, color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(width: 2.w, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: InkWell(
        onTap: () async {
          setState(() {
            _isloading = true;
          });
          try {
            await Authentication().Login(
              email: email.text.trim(),
              password: password.text.trim(),
            );
          } on Exceptions catch (e) {
            dailogBuilder(context, e.toString());
          }
          setState(() {
            _isloading = false;
          });
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 44.h,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child:
              _isloading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 23.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        ),
      ),
    );
  }

  Widget _forgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.w),
      child: Text(
        "Forgot your password?",
        style: TextStyle(
          fontSize: 13.sp,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _signupRedirect() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 0, 20, 0),
            child: TextButton(
              onPressed: widget.togglePage,
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
