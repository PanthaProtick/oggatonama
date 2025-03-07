import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());

    final OutlineInputBorder border = OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: Colors.white60),
      borderRadius: BorderRadius.circular(16),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1D1616),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'Oggatonama',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          Text('Sign up to continue.'),
                          //const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            _buildTextField('First Name', controller.firstNameController, TextInputType.text, border),
                            _buildTextField('Last Name', controller.lastNameController, TextInputType.text, border),
                            _buildTextField('Email', controller.emailController, TextInputType.emailAddress, border),
                            _buildTextField('Password', controller.passwordController, TextInputType.text, border, obscureText: true),
                            _buildTextField('Confirm Password', controller.confirmPasswordController, TextInputType.text, border, obscureText: true),
                            _buildTextField('NID', controller.nidController, TextInputType.number, border),
                            _buildTextField('Phone', controller.phoneController, TextInputType.phone, border),
                            const SizedBox(height: 20),
                            Obx(() => controller.isLoading.value
                                ? const CircularProgressIndicator()
                                : SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF8E1616),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {
                                        controller.register(context);
                                      },
                                      child: const Text(
                                        'Register',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, TextInputType inputType, OutlineInputBorder border, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          focusedBorder: border,
          enabledBorder: border,
          hintText: label,
          hintStyle: const TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
