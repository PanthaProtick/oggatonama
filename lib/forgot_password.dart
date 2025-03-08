import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oggatonama/Controllers/login_controller.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    final TextEditingController _emailController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1D1616),
          title: Text(
            'Reset Password'
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
          iconTheme: IconThemeData(
            color: Colors.white
          ),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: const Color(0xFF1D1616),
              borderRadius: BorderRadius.circular(18)
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter you Email :',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)
                        ),
                        hintText: 'user@gmail.com',
                        hintStyle: TextStyle(
                          color: Colors.grey
                        ),
                      ),                      
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() => controller.isLoading.value
                            ? CircularProgressIndicator()
                            : SizedBox(
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    controller.resetPassword(_emailController.text);
                                  },
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}