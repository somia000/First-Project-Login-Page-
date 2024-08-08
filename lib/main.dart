import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

bool isSecured = true;

Map<String, User> users = {
  "somia@gmail.com": User(email: 'somia@gmail.com', password: '1234'),
  "Zain@gmail.com": User(email: 'Zain@gmail.com', password: '123'),
};

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Page",
          style: TextStyle(fontSize: 25),
        ),
        // ignore: prefer_const_constructors
        backgroundColor: Color.fromARGB(255, 255, 114, 94),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 20,
            ),
            //صورة تسجيل الدخول
            Image.asset(
              'assets/login.png',
              width: 325,
              height: 325,
            ),
            // نهاية صورة تسجيل الدخول
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  //ادخل الايميل هنا
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        label: Text("Enter Email"),
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  ),
                  // نهاية الايميل هنا
                  const SizedBox(
                    height: 20,
                  ),
                  //ادخل كلمة المرور هنا
                  TextFormField(
                    controller: passwordController,
                    obscureText: isSecured,
                    decoration: InputDecoration(
                        label: const Text("Enter Password"),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isSecured = !isSecured;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                        border:
                            const OutlineInputBorder(borderSide: BorderSide())),
                  ),
                  // نهاية كلمة المرور هنا
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      User user = users[emailController.text]!;

                      if (user.email == emailController.text &&
                          user.password == passwordController.text) {
                        print("Logged");
                      } else {
                        print("Email or password is wrong");
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromARGB(255, 255, 114, 94),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
