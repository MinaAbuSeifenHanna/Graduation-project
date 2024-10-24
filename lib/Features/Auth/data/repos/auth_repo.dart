

abstract class AuthRepo {

  Future<String> userLogin({
    required String email,
    required String password,
  });

  Future<String> userRegister({
    required String email,
    required String password,
    required String username,

  });


}
