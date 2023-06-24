import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class AnimatedLoginButton extends StatefulWidget {
  final String text;
  const AnimatedLoginButton({Key? key, this.text = 'Login'}) : super(key: key);
  @override
  _AnimatedLoginButtonState createState() => _AnimatedLoginButtonState();
}

class _AnimatedLoginButtonState extends State<AnimatedLoginButton> {
  bool _isLoading = false;
  
  

  void _handleLogin() {
    setState(() {
      _isLoading = true;
    });

    // Simulación de carga durante 5 segundos
    Timer(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? _buildLoadingButton() : _buildLoginButton();
  }

  Widget _buildLoadingButton() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
return GestureDetector(
      onTap: () {
        _handleLogin();
      },
      child: Container(
        alignment: Alignment.center,
        width: width * 0.8,
        height: height * 0.075,
        child: Lottie.asset("assets/animations/loginLoading.json"),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.1),
          ),
          gradient: LinearGradient(
              colors: /* onboardPage
                          ?  */
                  [
                const Color(0xFF8200FF),
                const Color(0xFFFF3264),
              ]
              /*                          : [
                              const Color(0xFFFFFFFF),
                              const Color(0xFFFFFFFF),
                            ], */
              ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        _handleLogin();
      },
      child: Container(
        alignment: Alignment.center,
        width: width * 0.8,
        height: height * 0.075,
        child: Text(
          widget.text,
          style: TextStyle(
            color: Color.fromARGB(255, 253, 253, 253),
            fontWeight: FontWeight.bold,
            fontSize: width * 0.06,
            fontFamily: 'ProductSans',
          ),
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.1),
          ),
          gradient: LinearGradient(
              colors: /* onboardPage
                          ?  */
                  [
                const Color(0xFF8200FF),
                const Color(0xFFFF3264),
              ]
              /*                          : [
                              const Color(0xFFFFFFFF),
                              const Color(0xFFFFFFFF),
                            ], */
              ),
        ),
      ),
    );
  }
}
