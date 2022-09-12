import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading (bool value){
    _loading = value;
    notifyListeners();
  }
  // signup loading

  bool _signUploading = false;
  bool get signUploading => _signUploading;
  setsignUpLoading (bool value){
    _signUploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushbarErrorMessage('Login Successful', context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){

        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode){
        Utils.flushbarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
  Future<void> signupApi(dynamic data, BuildContext context) async {
    setsignUpLoading(true);
    _myRepo.signupApi(data).then((value) {
      setsignUpLoading(false);
      Utils.flushbarErrorMessage('Signup Successful', context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){

        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode){
        Utils.flushbarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
