import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';


class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: Text('Signup'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: emailFocus,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (val) {
                  Utils.fieldFocusChange(context, emailFocus, passwordFocus);
                },
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: _obsecurePassword.value,
                      focusNode: passwordFocus,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                              !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility)),
                      ),
                    );
                  }),
              SizedBox(
                height: height * .1,
              ),
              RoundButton(
                title: 'Signup',
                loading: authViewModel.signUploading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushbarErrorMessage('Please Enter Email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushbarErrorMessage(
                        'Please Enter Password', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushbarErrorMessage(
                        'Please Enter password up to 6 digit', context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString()
                    };
                    authViewModel.signupApi(data, context);
                    print('api hit');
                  }
                },
              ),
            SizedBox(
              height: height * 0.065,
            ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.home);
                },
                  child: Text("Already Have An Account? Login"))
            ],
          ),
        ));
  }
}
