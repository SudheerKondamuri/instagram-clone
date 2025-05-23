import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback togglePage;
  const SignupPage({super.key, required this.togglePage});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final bio = TextEditingController();
  final confirmpass = TextEditingController();

  FocusNode email_f = FocusNode();
  FocusNode password_f = FocusNode();
  FocusNode bio_f = FocusNode();
  FocusNode username_f = FocusNode();
  FocusNode confirmpassw_f = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 45.h),
              Center(child: Image.asset('assets/logo.jpg')),
              SizedBox(height: 50.h),
              SizedBox(
                //color: Colors.black,
                height: 60.h,

                child: Center(
                  child: CircleAvatar(
                    radius: 34.r,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: AssetImage('assets/pictures/person.png'),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Textfeild(email, Icons.email_outlined, 'Email', email_f),
              SizedBox(height: 15.h),
              Textfeild(username, Icons.person, 'Username', username_f),
              SizedBox(height: 15.h),
              Textfeild(bio, Icons.abc, 'Bio', bio_f),
              SizedBox(height: 15.h),
              Textfeild(password, Icons.lock, 'Password', password_f),
              SizedBox(height: 15.h),
              Textfeild(
                confirmpass,
                Icons.lock,
                'Confirm your password',
                confirmpassw_f,
              ),
              SizedBox(height: 10.h),
              signIn(),
              SizedBox(height: 10.h),
              logIn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget signIn() {
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
        "Sign in",
        style: TextStyle(
          fontSize: 23.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget logIn() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'I have account',
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(6, 0, 20, 0),
            child: TextButton(
              onPressed: widget.togglePage,
              child: Text(
                'Login',
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
