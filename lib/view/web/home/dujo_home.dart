// ignore_for_file: sort_child_properties_last
import 'package:dujo_kerala_website/view/web/home/Subscription/college_aided.dart';
import 'package:dujo_kerala_website/view/web/home/navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import 'Subscription/school_aided.dart';
import 'create_school/create_school.dart';
import 'footer/footer.dart';
import 'homep.dart';

class DujoHomePage extends StatefulWidget {
  const DujoHomePage({Key? key}) : super(key: key);

  @override
  State<DujoHomePage> createState() => _DujoHomePageState();
}

class _DujoHomePageState extends State<DujoHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFFE8EAF6),
          title: NavigationBarWidget(screenSize: screenSize),
        ),
        body: SingleChildScrollView(
          child: Container(
            color:
                //Color.fromARGB(255, 57, 171, 57),
                const Color(0XFFE8EAF6),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color.fromARGB(207, 39, 115, 245),
                      Color.fromARGB(255, 0, 7, 100),
                    ])),

                    margin: EdgeInsets.only(
                      left: screenSize.width * 0.4,
                    ),
                    height: screenSize.width * 0.37,
                    // width:  screenSize.width * 1,
                    //  color: const Color(0xFF3949AB),
                    child: Stack(children: [
                      Opacity(
                          opacity: 0.5,
                          child: ClipPath(
                            clipper: WaveClipper(),
                            child: Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 139, 233, 201),
                                Color.fromARGB(255, 1, 221, 184)
                              ])),
                              //color: const Color(0xFF26A69A),
                              height: screenSize.width * 0.27,
                            ),
                          )),
                      ClipPath(
                        clipper: WaveClipper(),
                        child: Container(
                          color: //Color.fromARGB(255, 85, 196, 21),
                              const Color(0XFFE8EAF6),
                          height: screenSize.width * 0.15,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                    ]),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: screenSize.width * 1 / 30),
                        child: Container(
                            height: screenSize.width / 15,
                            width: screenSize.width * 0.15,
                            margin: EdgeInsets.only(
                              left: screenSize.width * .03,
                            ),
                            child: Image.asset(
                              "assets/images/leptdujo.png",
                              height: screenSize.width * 0.1,
                              width: screenSize.width * 0.15,
                            )),
                      ),
                    ],
                  ),
                  Container(
                      width: screenSize.width * 1 / 80,
                      height: screenSize.width * 1 / 20,
                      margin: EdgeInsets.only(
                          left: screenSize.width / 5.4,
                          top: screenSize.width * 1 / 26),
                      child: const VerticalDivider(
                        color: Colors.red,
                        thickness: 2,
                      )),
                  Container(
                    //color: Colors.amber,
                    height: screenSize.width / 9,
                    margin: EdgeInsets.only(
                        top: screenSize.width * 1 / 25,
                        left: screenSize.width * 1 / 5),
                    child: Column(
                      children: [
                        //  SizedBox(height: 10),
                        //  SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeP()));
                          },
                          child: Text(
                            "Colleges",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: screenSize.width * 1 / 70),
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Schools",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: screenSize.width * 1 / 70),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: screenSize.width * 0.35,
                      margin: EdgeInsets.only(
                          left: screenSize.width * .7,
                          top: screenSize.width * .02),
                      child: Image.asset(
                        "assets/images/ann.png",
                        height: 600,
                      )),
                  Container(
                    margin: EdgeInsets.only(
                        left: screenSize.width / 15,
                        top: screenSize.width * 1 / 6),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Logon,",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenSize.width * 1 / 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Feed Your",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenSize.width * 1 / 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " Mind,",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: screenSize.width * 1 / 40,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Change The",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenSize.width * 1 / 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " World!",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: screenSize.width * 1 / 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SchoolProfile();
                          },
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: screenSize.width * 0.1,
                            top: screenSize.width * 0.3),
                        height: screenSize.width * 1 / 35,
                        width: screenSize.width / 8,
                        decoration: BoxDecoration(
                            color: const Color(0xFF224D83),
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child:
                                //Image.asset("assets/images/hybrid.png",height: 100,width: 150,),
                                Text("Create School Profile",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenSize.width * 1 / 80,
                                    ))),
                      )),
                ]),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: Row(children: const [
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                    )),
                  ]),
                ),
                SizedBox(
                  height: screenSize.width * 1 / 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const SchoolAidedSubscription())));
                        },
                        child: Text("DuJo Kerala Schools ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenSize.width / 60,
                                fontWeight: FontWeight.bold)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const CollegeAidedSubscription())));
                        },
                        child: Text("DuJo Kerala Collages ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenSize.width / 60,
                                fontWeight: FontWeight.bold)),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Text("Dujo Customize",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenSize.width / 60,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: Row(children: const [
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                    )),
                  ]),
                ),
                Row(),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width / 40,
                      right: screenSize.width / 40),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenSize.width / 20),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://cdn-icons-png.flaticon.com/512/167/167707.png'))),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Aided Schools",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenSize.width / 98),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenSize.width / 20),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://cdni.iconscout.com/illustration/premium/thumb/school-3862334-3213885.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Un Aided Schools",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenSize.width / 98)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenSize.width / 20),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNxO1jGkBf5i7D6_359paLEYInLGhmQgWgxSvjl47YqaG4-bXtfcMOp6wwyFPgsZ6hYnY&usqp=CAU',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Government Schools",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenSize.width / 98)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width / 40,
                      right: screenSize.width / 40),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenSize.width / 20),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'http://cdn.onlinewebfonts.com/svg/img_233253.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Aided College",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenSize.width / 98)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenSize.width / 20),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'http://cdn.onlinewebfonts.com/svg/img_449204.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Un Aided College",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenSize.width / 98)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenSize.width / 20),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'http://cdn.onlinewebfonts.com/svg/img_533513.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Government College",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenSize.width / 98)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width / 40,
                      right: screenSize.width / 40),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenSize.width / 20),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDUXsZWhKhd8hr2-8jh3Nqve3nFdbZ2djy7g&usqp=CAU',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Engineering",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenSize.width / 98)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenSize.width / 20),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'data:image/jpeg;base64,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Zm82P/E0lKbUGBvzksj+TGfALdrdcqRl8Jc8+DSB7XW911GtJa+TvuIWtjHHvO9py9y9RftGQWvbmbDxtdYkdRs0BPIX/RfdctCU1O1phcRITbqy7F2bG7s8xnb2qN0GIyxhveLhbzxCy1553PcXPcXOO0uJJPMqZ6havuLhUytsB82D9In6XkNysi74WnvK7eI14ngoDW9PN8jbeg4qwURFya6BERERERERERERERERERERERERERERERERFHdO6qU9T2jeOX122z+03Y7z2+KkSLZHK+J28w2K8vY14s4XCqHS+qtbT3Jj66MfSiu42+tH3hyuuDHO07CL7xvHmNoVy6e07DSsxSG7j3WDvO/QeKqvTmmnVMvWuYxpGQwtFwDt7VrldNs+qmnbd7MP5sr9nqLBU1XBFGbNOPDNa7Me82H1v0KyOqcwS4usLDgPK+zYNy0S5eXyAC5IA8VY7l1BW76YQcTcncbm+e3YsRndx9mXwWp15PdaTfeRhHtO3kvha87XWHBo/wDYrIYAllsSTBubiB5ldPRGgaupziiIZ/EfdjOVxidyBXO0VUejyCWNrS8b3tD7jf3tnJWxq1rPFVDD3JgLll73G8tO8eG0KFX1EsDN6NlxxJy7B53txCl0sMUjrOPZx7ffatTQmpMMJD5T1snAizAfBu/mVLERcrNPJM7ekNz70yHYruONkYs0WRERal7RERERERERERERERERERERERERERERERERaukKxsMT5X91jS48gtpR7XtpNBPbgw8hIwn3ArbAwSStYciQO82XiR26xzhoCVVOlNIyTyullN3O9gG4DwC1rrHdLrumtAsBgFzRJOJUj1b1Vmq+3fq4b2LyLk/Ybv8AM5ea6Ws2rlNSugETS5xD7vecTiRhseA5AKwdDhno8PV/N9WzD9nCLKNdITBeA77vHKzVzsW0JZqoNybiLdhz4nw5K1lpmR05IxOGPaFHdBaMiqKlsUzbsLHnIlpBGGxBGzaV61k1IlhBkgcZIhmQe+0chZw8cit7Ull6y/CN/vLQrESrrZaeYbpwsLjTM9x5rFLTMlh+YY3OOqoC69wTuY4PY4tc03BGRB8F60iY+tk6r5vG7BbZhxG1vCy17roc1Vq6tV9Lek07ZT3s2vA3Pbt9osea7KhnRdf0aQ7utI5hrb/EKZriq2JsU72NyBXRwOLo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EREREREREREREREREREREREREREREREREREREREREUO6QtZ4qSERljZJZQQ1jgHNDdhc4HIjOwG/kVUlJouqqGOfHHhp2kYnZNjBJt/Mbnde3gFIelZhdpJjZCWxlkQB4MLiHEeRxKy9YqOOOidHGMLGBgaBuDXCy6inlZQU8IYLukxJ0GI05XsPG6rJmmVzyTg0YdypLSGrc0bDK1rpI2/OPAyYTmLi9wLb9isToq1mjez0R7GMkaLsLWhvWNAzuAM3jbffmdxUg1GYDDICAQX2N94wNyKreGkEGnWxUw7LZhYbmtcLvA8AC6y2yTCuZLTSDFgLg7qGvfbqPEXXiFpiayUHPA9qvFERckrZERERERERERERERERERERERERERERERERERERERERERERERERV/0t6vmenFRG28kN8VtpiPe+6c/LEtuj0wKrRIlvd4a1j/B7HNBv55HmppZRup1dihp52UrMPWHrCwE4cQtfA36OQ2BWcNW10LIZM2uBaeRzB8wVGliPzObqDfuwWlqtXMgpJ5pDZkbnOPJjcvM7FHOivRj56ibSUw7zn4OBe83eR4AHDzPBSXQmgmTUboqlrsD3h5bctJDbW2Z2uFKaWmZGxscbQ1jQA1oFgAOC2TVjYhMxn1PNidA0DIcybg8lrgiJZGTkB4lZ0RFUKaiIiIiIiIiIiIiIiIiIiIiIiIv/2Q==',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Medical",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenSize.width / 98)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: screenSize.width * 1 / 5,
                          width: screenSize.width * 1 / 4,
                          margin: EdgeInsets.all(screenSize.width * 1 / 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenSize.width / 20),
                                child: Container(
                                  height: screenSize.width * 1 / 15,
                                  width: screenSize.width * 1 / 15,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvCHuLFQvs9U7pwAUGOQZoarXvADX3FY2Evg&usqp=CAU',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Others",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenSize.width / 98)),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.white60, width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(45)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xFF26A69A),
                ),
                sizedBoxH10,
                const FooterSection()
              ],
            ),
          ),
        ));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    {
      debugPrint(size.width.toString());
      var path = Path();
      path.lineTo(0, size.height);
      var firstStart = Offset(size.width / 5, size.height);
      //first point
      var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
      //second point
      path.quadraticBezierTo(
          firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
      var secondStart =
          Offset(size.width - (size.width / 3.24), size.height - 105);
      //third
      var secondEnd = Offset(size.width, size.height - 10);
      //fourth
      path.quadraticBezierTo(
          secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
      //
      path.lineTo(size.width, 0);
      path.close();
      return path;
    }
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;

    //throw UnimplementedError();
  }
}

const containerColor = [
  [Color(0xff6448fe), Color(0xff5fc6ff)],
  [Color.fromARGB(255, 212, 150, 145), Color.fromARGB(255, 212, 150, 145)],
  [Color(0xfffe6197), Color(0xffffb463)],
  [Color.fromARGB(255, 30, 196, 30), Color.fromARGB(255, 79, 163, 30)],
  [Color.fromARGB(255, 116, 130, 255), Color.fromARGB(255, 86, 74, 117)],
  [Color.fromARGB(255, 205, 215, 15), Color.fromARGB(255, 224, 173, 22)],
  [Color.fromARGB(255, 208, 104, 105), Color.fromARGB(255, 241, 66, 66)],
  [
    Color(0xFF26A69A),
    Color.fromARGB(255, 148, 223, 216),
  ],
  [
    Color.fromARGB(255, 15, 87, 243),
    Color.fromARGB(255, 100, 46, 228),
  ]
];
