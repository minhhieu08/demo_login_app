import 'package:agribank_app/screens/home_screen.dart';
import 'package:agribank_app/widgets/button_custom.dart';
import 'package:agribank_app/widgets/text_form_input_custom.dart';
import 'package:agribank_app/widgets/text_form_input_password.dart';
import 'package:flutter/material.dart';
import 'package:agribank_app/widgets/image.dart' as image_local;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String branchName = '';
  bool isBranchExist = false;
  String branchId = '';
  bool isFormValid = true;

  void checkBranchNumber() {
    var _branchName = '';
    var _isBranchExist = false;
    if (branchId == 'arg123') {
      _branchName = 'Agribank Chi nhánh Nam Định';
      _isBranchExist = true;
    }
    setState(() {
      branchName = _branchName;
      isBranchExist = _isBranchExist;
    });
  }

  void submitLogin() {
    _formKey.currentState!.validate();
    if (!isFormValid) {
      // Open popup error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Vui lòng nhập mật khẩu'),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
            actions: <Widget>[
              ButtonCustom(
                text: 'Đóng',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    // Open popup success
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 200,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(children: const [
              image_local.Image(
                path: 'assets/images/agribank_logo.png',
                width: 250,
              ),
            ]),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 5,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormInputCustom(
                        label: 'Mã đơn vị',
                        placeholder: 'VD: ARG123',
                        onChanged: (value) {
                          setState(() {
                            branchId = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    Expanded(
                      child: ButtonCustom(
                        text: 'OK',
                        onPressed: () => {checkBranchNumber()},
                      ),
                    ),
                  ],
                ),
                branchName != ''
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              branchName,
                              style: const TextStyle(
                                color: Color(0xFFB10044),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(
                        height: 8,
                      ),
                const SizedBox(
                  height: 16,
                ),
                TextFormInputCustom(
                  label: 'Tên đăng nhập',
                  prefixIcon: Icon(Icons.people),
                  placeholder: 'Nhập tên của bạn',
                  isDisabled: !isBranchExist,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormInputPassword(
                  isDisabled: !isBranchExist,
                  validatorFunc: (value) {
                    bool _isFormValid = true;
                    if (value.trim() == '') {
                      _isFormValid = false;
                    }

                    setState(() {
                      isFormValid = _isFormValid;
                    });
                    return null;
                  },
                ),
                const SizedBox(
                  height: 115,
                ),
                ButtonCustom(
                  text: 'Đăng nhập',
                  isDisabled: !isBranchExist,
                  onPressed: () => {submitLogin()},
                ),
              ],
            ),
          ),
        ));
  }
}
