import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lenzcamera/screens/forgot_password_screen.dart';
import 'package:lenzcamera/screens/home_screen.dart';




class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Center(
                  child: Container(
                    width: 220,
                    child: Image(
                      image: AssetImage("assets/images/logo_lenzcamera.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email Or Mobile Number",
                  style: TextStyle(
                      color: Color(0xff747474), fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffb0b0b0)),
                ),
                labelText: " ",
              )),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                      color: Color(0xff747474), fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffb0b0b0)),
                ),
                labelText: " ",
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: Icon(
                      Icons.visibility,
                      color: Color(0xff6e6e6c),
                    ),
                    onPressed: () {},
                  ),
                ),
              )),
              SizedBox(height: 30),
              Container(
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffec3436),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) =>
                       HomeScreen()));
          
                  },
                  child: Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
              SizedBox(height: 40),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                  },
                  child: Center(
                      child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Color(0xff454545),
                        fontWeight: FontWeight.w800,
                        fontSize: 14),
                  ))),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: [
                    Text(
                      "Dont't have an account? ",
                      style: TextStyle(fontSize: 14, color: Color(0xff757575)),
                    ),
                    SizedBox(),
                    TextButton(
                      onPressed: () {},
                      child: Text("Register Now",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16, fontWeight: FontWeight.normal,
                            color: Color(0xffc5484c)),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (index){},
          selectedItemColor: Color(0xffdb4454),
          unselectedItemColor: Color(0xff8e8e8e),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: "Home",
            ),
    
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined,
                    size: 25),
                label: "Categories"),
    
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,
                  size: 30),
              label: "Cart",
            ),
    
            BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  size: 30),
              label: "Search",
            ),
    
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,
                  size: 30),
              label: "Profile",
            ),
          ],
    
        ),
      ),
    );
  }
}
