import 'package:flutter/material.dart';
import 'package:ticket_reselling/screens/city_selection_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isCheckboxChecked = false;
  bool _isFormValid = false;

  bool _isPasswordVisible = false; // Visibility state for "Create Password"
  bool _isConfirmPasswordVisible = false; // Visibility state for "Confirm Password"

  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  // Method to validate the form
  void _validateForm() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    setState(() {
      // Email validation
      if (email.isEmpty) {
        _emailError = "Email is required.";
      } else if (!RegExp(r"^[^@]+@[^@]+\.[^@]+$").hasMatch(email)) {
        _emailError = "Enter a valid email.";
      } else {
        _emailError = null;
      }

      // Password validation
      if (password.isEmpty) {
        _passwordError = "Password is required.";
      } else if (password.length < 6) {
        _passwordError = "Password must be at least 6 characters.";
      } else {
        _passwordError = null;
      }

      // Confirm Password validation
      if (confirmPassword.isEmpty) {
        _confirmPasswordError = "Please confirm your password.";
      } else if (password != confirmPassword) {
        _confirmPasswordError = "Passwords do not match.";
      } else {
        _confirmPasswordError = null;
      }

      // Enable the "Create account" button only if all fields are valid and the checkbox is checked
      _isFormValid = _emailError == null &&
          _passwordError == null &&
          _confirmPasswordError == null &&
          _isCheckboxChecked;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/start_screen_bg.png'), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100), // Space from the top

                  // "Sign Up" Heading
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Subheading
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Enter your details below & free sign up',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Main Container
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
                      padding: const EdgeInsets.all(20), // Inner padding
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Email Field
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Your Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorText: _emailError, // Display email error
                            ),
                            onChanged: (_) => _validateForm(),
                          ),
                          const SizedBox(height: 20),

                          // Create Password Field
                          TextField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible, // Toggle visibility
                            decoration: InputDecoration(
                              labelText: 'Create Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              errorText: _passwordError, // Display password error
                            ),
                            onChanged: (_) => _validateForm(),
                          ),
                          const SizedBox(height: 20),

                          // Confirm Password Field
                          TextField(
                            controller: _confirmPasswordController,
                            obscureText: !_isConfirmPasswordVisible, // Toggle visibility
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isConfirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isConfirmPasswordVisible =
                                        !_isConfirmPasswordVisible;
                                  });
                                },
                              ),
                              errorText:
                                  _confirmPasswordError, // Display confirm password error
                            ),
                            onChanged: (_) => _validateForm(),
                          ),
                          const SizedBox(height: 20),

                          // Terms and Conditions Checkbox
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: _isCheckboxChecked,
                                onChanged: (value) {
                                  setState(() {
                                    _isCheckboxChecked = value!;
                                  });
                                  _validateForm();
                                },
                              ),
                              const Expanded(
                                child: Text(
                                  'By creating an account you have to agree with our terms & conditions.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Create Account Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _isFormValid
                                  ? () {
                                      // Navigate to City Selection Page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CitySelectionPage(),
                                        ),
                                      );
                                    }
                                  : null, // Disable button if the form is invalid
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _isFormValid
                                    ? Colors.purple
                                    : Colors
                                        .grey, // Button color changes based on validity
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: const Text(
                                'Create account',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
