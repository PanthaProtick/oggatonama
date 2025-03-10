import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controllers/login_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    final OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        style: BorderStyle.solid,
        color: Colors.white60,
      ),
      borderRadius: BorderRadius.circular(16),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1D1616),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
              child: Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                    color: const Color(0xFFD84040)),
              ),
            ),
            Column(children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Enter phone number or email address',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xFFEEEEEE)),
                          ),
                        ),
                      ),
                      TextField(
                        controller: controller.emailOrPhoneController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: border,
                          enabledBorder: border,
                          hintText: 'Phone Number or Email Address',
                          hintStyle: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      )
                    ],
                  ))
            ]),
            Column(children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Enter password',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xFFEEEEEE)),
                          ),
                        ),
                      ),
                      TextField(
                        controller: controller.passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: border,
                          enabledBorder: border,
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      )
                    ],
                  ))
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
              child: Obx(() => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton.icon(
                onPressed: () async{
                  controller.login(context);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 75),
                    backgroundColor: const Color(0xFF8E1616),
                    foregroundColor: const Color(0xFFEEEEEE)),
                label: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                icon: const Icon(Icons.login_outlined,
                    color: Color(0xFFEEEEEE)),
              )),
            ),
          ],
        ),
      ),
    );
  }
}