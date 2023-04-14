import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../login/admin/admin_DashBoard/create_Admin/add_new_admin.dart';
import '../login/loginscreen.dart';
import '../widgets/drop_DownList/schoolDropDownList.dart'; 

class NavigationBarWidget extends StatelessWidget {
  TextEditingController schoolIdController = TextEditingController();
  NavigationBarWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;
    final Uri _faceBookUrl = Uri.parse('https://www.facebook.com/profile.php?id=100091062978371');
  final Uri _twitterUrl = Uri.parse('https://twitter.com/LeptonDujo');
  final Uri _instaUrl = Uri.parse('https://www.instagram.com/leptondujo/');
  final Uri _utubeUrl = Uri.parse('https://www.youtube.com/@LEPTONDUJO/featured');
  final Uri _leptonUrl = Uri.parse('http://www.leptoncommunications.com');

  Future<void> _launchFacebookUrl() async {
    if (!await launchUrl(_faceBookUrl)) {
      throw 'Could not launch $_faceBookUrl';
    }
  }

  Future<void> _launchTwitterUrl() async {
    if (!await launchUrl(_twitterUrl)) {
      throw 'Could not launch $_twitterUrl';
    }
  }

  Future<void> _launchyouTubeUrl() async {
    if (!await launchUrl(_utubeUrl)) {
      throw 'Could not launch $_utubeUrl';
    }
  }

  Future<void> _launchInstaUrl() async {
    if (!await launchUrl(_instaUrl)) {
      throw 'Could not launch $_instaUrl';
    }
  }

  Future<void> _launchleptonUrl() async {
    if (!await launchUrl(_leptonUrl)) {
      throw 'Could not launch $_leptonUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
      height: screenSize.width/10,
        child: Row(
          children: [
            Icon(Icons.phone,color: Color.fromARGB(255, 4, 157, 228),size: screenSize.width/50),

            GestureDetector(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddNewAdmin(
                  schoolID: 'MarthCheng13283',
                );
              },));
              },
              child: Text('+04714053483',style: TextStyle(color: Colors.black,fontSize: screenSize.width/98))),
            SizedBox(
              width: screenSize.width/55,
            ),
           
            Icon(Icons.phone_android,color: Colors.black,size: screenSize.width/50),

              Text('9746366651',style: TextStyle(color: Colors.black,fontSize: screenSize.width/98)),
              SizedBox(
              width: screenSize.width/55,
            ),
           
              Icon(Icons.mail_outline,color: Color.fromARGB(255, 255, 0, 0),size: screenSize.width/50),

                Text('info@leptondujo.com',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: screenSize.width/98)),
            SizedBox(
              width: screenSize.width * 0.3,
            ), 
            // GestureDetector( 
            //   onTap: (){
            //     Navigator.push(context, MaterialPageRoute(builder: ((context) =>RequestedSchoolsApproval())));
            //   }, 
              
            //   child: Text(
            //     'Super Admin', style: TextStyle(color: Colors.black),
            //   ),
            // ),
            InkWell(
              hoverColor: const Color(0xFF26A69A),
              onTap: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Enter Your School ID'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[GetSchoolListDropDownButton()],
                          // children: [
                          //   // TextFormField(
                          //   //   controller:schoolIdController,
                          //   // )
                          // ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('ok'),
                          onPressed: () async {
                            await Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen(
                                  schoolID: schoolListValue!["id"],
                                );
                              },
                            ));
                          },
                        ),
                        TextButton(
                          child: const Text('cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: SizedBox(
                height: screenSize.width/50,
                width: screenSize.width/20,
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold,fontSize: screenSize.width/80),
                  ),
                ),
              ),
            ),
            SizedBox(
                width: screenSize.width * 1 /30 ,
              ),
            InkWell(
              onTap: () {
                 _launchFacebookUrl();
              },
              child: CircleAvatar(
                radius: screenSize.width * 1 / 55,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  "assets/images/frdd.png",
                  height: screenSize.width * 1 / 75,
                  width: screenSize.width * 1 / 60,
                ),
              ),
            ),
            // SizedBox(
            //   width: screenSize.width * 1 / 60,
            // ),
            InkWell(
              onTap: () {
                _launchInstaUrl();
              },
              child: CircleAvatar(
                radius: screenSize.width * 1 / 60,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  "assets/images/instag.png",
                  height: screenSize.width * 1 / 50,
                  width: screenSize.width * 1 / 50,
                ),
              ),
            ),
            // SizedBox(
            //   width: screenSize.width * 1 / 60,
            // ),
            InkWell(
              onTap: () {
                 _launchTwitterUrl();
              },
              child: CircleAvatar(
                radius: screenSize.width * 1 / 60,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  "assets/images/twitt.png",
                  height: screenSize.width * 1 / 65,
                  width: screenSize.width * 1 / 65,
                ),
              ),
            ),
            // SizedBox(
            //   width: screenSize.width * 1 / 70,
            // ),
            InkWell(
              onTap: () {
                _launchyouTubeUrl();
              },
              child: CircleAvatar(
                radius: screenSize.width * 1 / 60,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  "assets/images/utube.png",
                  height: screenSize.width * 1 / 62,
                  width: screenSize.width * 1 / 62,
                ),
              ),
            ),
          ],
        ));
  }
}
