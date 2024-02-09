import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:get_storage/get_storage.dart';

class Telepon extends StatelessWidget {
  final box = GetStorage();
  final LoginController loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    if (box.read("dataRememberme") != null) {
      loginC.rememberme.value = true;
      loginC.emailC.text = box.read("dataRememberme")["email"];
      loginC.passC.text = box.read("dataRememberme")["pass"];
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey[300],
        title: Text("Log In"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.question_mark_outlined),
            color: Color(0xFFE9552D),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              width: 100,
              height: 100,
              child: Image.asset("assets/images/shopee-logo-3.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    controller: loginC.emailC,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500]),
                        hintText: "Telepon",
                        prefixIcon: Icon(Icons.phone),
                        border: UnderlineInputBorder()),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFE9552D)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        )),
                    onPressed: () => loginC.Login(),
                    child: Text("Lanjut"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        child: Text(
                          "login dengan password",
                          style: TextStyle(color: Colors.blue[400]),
                        ),
                        onTap: () {
                          Get.toNamed("/login");
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: "-------------------------------",
                style: TextStyle(color: Colors.grey[300]),
                children: [
                  TextSpan(
                    text: " Atau ",
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  TextSpan(
                    text: "------------------------------",
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed("/google");
                    },
                    child: ListTile(
                      leading: Icon(Icons.g_translate_outlined),
                      title: Text("Log In dengan Google"),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed("/facebook");
                    },
                    child: ListTile(
                      leading: Icon(Icons.facebook),
                      title: Text("Log In dengan Facebook"),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed("/whatsapp");
                    },
                    child: ListTile(
                      leading: Icon(Icons.wechat_sharp),
                      title: Text("Log In dengan WhatsApp"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 180),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Belum punya akun?",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: " Daftar",
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed("/daftar");
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
