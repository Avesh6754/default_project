class LoginModal{
  final String email;
  final String password;

  LoginModal({required this.email, required this.password});
  factory LoginModal.fromMap(Map m1)
  {
    return LoginModal(email: m1['email'], password: m1['password']);
  }
  Map<String,dynamic> toJson()=>{
    'email':email,
    'password':password
  };
}