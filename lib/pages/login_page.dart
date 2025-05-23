import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback togglePage;
  const LoginPage({super.key, required this.togglePage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  FocusNode email_f = FocusNode();
  FocusNode password_f = FocusNode();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(width: 96.w, height: 100.h),
                Center(child: Image.asset('assets/logo.jpg')),
                SizedBox(height: 120.h),
                Textfeild(email, Icons.email_outlined, 'Email', email_f),
                SizedBox(height: 15.h),
                Textfeild(password, Icons.lock, 'Password', password_f),
                SizedBox(height: 10.h),
                /* Container(
                  color: Colors.blue,
                  child: Text('Login', style: TextStyle(fontSize: )),
                ),*/
                Forgot(),
                Login(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Dont have account?',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Login() {
    return Container(
      height: 48.h,
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        "Login",
        style: TextStyle(
          fontSize: 23.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget Forgot() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 12),
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

  Widget Textfeild(
    TextEditingController controller,
    IconData icon,
    String type,
    FocusNode focusnode,
  ) {
    return Container(
      height: 52.h,

      //decoration: BoxDecoration(border: Border.all()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
          keyboardType: TextInputType.emailAddress,
          controller: controller,
          focusNode: focusnode,
          decoration: InputDecoration(
            hintText: type,
            prefixIcon: Icon(icon),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 15.h,
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
}
