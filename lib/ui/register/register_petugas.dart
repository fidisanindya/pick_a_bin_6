import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/login/login_petugas.dart';
import 'package:boilerplate/ui/login/login_warga.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/service/auth_service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPetugasPage extends StatefulWidget {
  const RegisterPetugasPage({Key? key}) : super(key: key);

  @override
  State<RegisterPetugasPage> createState() => _RegisterPetugasPageState();
}

class _RegisterPetugasPageState extends State<RegisterPetugasPage> {
  final TextEditingController _namaController = new TextEditingController();
  final TextEditingController _alamatController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _telpController = new TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey();
  final _auth = AuthService();
  bool isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Up',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          //create form with border
          Container(
            padding: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //create email field
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Nama Lengkap",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _namaController,
                      // controller: TextEditingController(text: "Coba"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama Lengkap Harus Diisi';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Alamat",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _alamatController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Alamat Harus Diisi';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.home,
                          color: Colors.green,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "No.Telp",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _telpController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'No. Telp harus diisi';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.green,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email Harus Diisi';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.green,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password Harus Diisi';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.green,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.red,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isHidePassword = !isHidePassword;
                            });
                          },
                          child: Icon(
                            isHidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      obscureText: isHidePassword,
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 325,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () async {
                            final String namaLengkap =
                                _namaController.text.trim();
                            final String alamat = _alamatController.text.trim();
                            final String email = _emailController.text.trim();
                            final String password =
                                _passwordController.text.trim();
                            final String telp = _telpController.text.trim();

                            if (_formKey.currentState!.validate()) {}

                            if (namaLengkap.isEmpty) {
                              print("Nama Lengkap kosong");
                            } else {
                              if (alamat.isEmpty) {
                                print("Alamat kosong");
                              } else {
                                if (email.isEmpty) {
                                  print("Email kosong");
                                } else {
                                  if (telp.isEmpty) {
                                    print("No. Telp kosong");
                                  } else {
                                    if (password.isEmpty) {
                                      print("Password kosong");
                                    } else {
                                      context
                                          .read<AuthService>()
                                          .register(
                                              namaLengkap, email, password)
                                          .then((value) async {
                                        DatabaseReference data =
                                            FirebaseDatabase.instance
                                                .ref("petugas");
                                        data.push().set({
                                          "nama": namaLengkap,
                                          "alamat": alamat,
                                          "email": email,
                                          "telp": telp,
                                          'status': "petugas"
                                        });
                                        Fluttertoast.showToast(
                                            msg: "Registration Successfully",
                                            toastLength: Toast.LENGTH_SHORT);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPetugasPage()));
                                      });
                                    }
                                  }
                                }
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            "Sign Up",
                          )),
                    ),
                    SizedBox(height: 15),
                    Container(
                      //create hyperlink already have an account
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginWargaPage()));
                                  },
                              ),
                            ])),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
