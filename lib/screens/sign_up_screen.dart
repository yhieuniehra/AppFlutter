import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String userType = 'Guide'; // Giá trị mặc định cho loại người dùng
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 249, 249),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 206, 166, 1),
        elevation: 0,
        toolbarHeight: 150,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/app_logo.png', // Thay bằng đường dẫn logo của bạn
            height: 40,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Màu bóng với độ mờ
                    spreadRadius: 5, // Độ lan của bóng
                    blurRadius: 10, // Độ mờ của bóng
                    offset: Offset(0, 5), // Vị trí đổ bóng (x, y)
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Lựa chọn loại người dùng
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildRadioButton('Traveler'),
                        SizedBox(width: 20),
                        _buildRadioButton('Guide'),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Nhập họ tên
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            controller: _firstNameController,
                            label: 'First Name',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _buildTextField(
                            controller: _lastNameController,
                            label: 'Last Name',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Nhập email
                    _buildTextField(
                      controller: _emailController,
                      label: 'Email',
                    ),
                    SizedBox(height: 20),
                    // Nhập mật khẩu
                    _buildTextField(
                      controller: _passwordController,
                      label: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    // Xác nhận mật khẩu
                    _buildTextField(
                      controller: _confirmPasswordController,
                      label: 'Confirm Password',
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    // Nút đăng ký
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Xử lý đăng ký
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(0, 206, 166, 1),
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Đã có tài khoản? Đăng nhập
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/profile_setup');
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 206, 166, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600]), // Màu chữ cho label
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Góc bo tròn
          borderSide: BorderSide(color: Colors.grey[300]!), // Màu viền khi không được chọn
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), // Góc bo tròn khi được chọn
          borderSide: BorderSide(color: Colors.teal, width: 2), // Màu viền khi được chọn
        ),
        filled: true,
                          fillColor: Colors.grey[100],
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        if (label == 'Email' && !value.contains('@')) {
          return 'Please enter a valid email';
        }
        if (label == 'Password' && value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        if (label == 'Confirm Password' && value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  Widget _buildRadioButton(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: userType,
          onChanged: (newValue) {
            setState(() {
              userType = newValue!;
            });
          },
          activeColor: const Color.fromRGBO(0, 206, 166, 1),
        ),
        Text(value),
      ],
    );
  }
}
