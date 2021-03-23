import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Planets",
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String chosenPlanet = "Mars";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Planets App")),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(chosenPlanet,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                Image.network(getPlanetImageUrl(), width: 300,),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        child: Text("Mars",
                            style: chosenPlanet == "Mars"
                                ? TextStyle(color: Colors.black)
                                : TextStyle()),
                        style: chosenPlanet == "Mars"
                            ? ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red))
                            : ButtonStyle(),
                        onPressed: () => {
                              setState(() {
                                chosenPlanet = "Mars";
                              })
                            }),
                    OutlinedButton(
                        child: Text("Earth",
                            style: chosenPlanet == "Earth"
                                ? TextStyle(color: Colors.black)
                                : TextStyle()),
                        style: chosenPlanet == "Earth"
                            ? ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red))
                            : ButtonStyle(),
                        onPressed: () => {
                              setState(() {
                                chosenPlanet = "Earth";
                              })
                            }),
                    OutlinedButton(
                        child: Text("Jupiter",
                            style: chosenPlanet == "Jupiter"
                                ? TextStyle(color: Colors.black)
                                : TextStyle()),
                        style: chosenPlanet == "Jupiter"
                            ? ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red))
                            : ButtonStyle(),
                        onPressed: () => {
                              setState(() {
                                chosenPlanet = "Jupiter";
                              })
                            }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  String getPlanetImageUrl() {
    switch (chosenPlanet) {
      case "Mars":
        return "https://pngimg.com/uploads/mars_planet/mars_planet_PNG23.png";
      case "Earth":
        return "https://pngimg.com/uploads/earth/earth_PNG39.png";
      case "Jupiter":
        return "https://lh3.googleusercontent.com/proxy/hqrsN7bmgLeEGPRAP0dHMUYC95dQsLJHXd4pjpyQ3F7SJBuJTl3U9HRB-2J0b0ttgyu_YqeYEorE8xdKIdIUsaDQN-eVk1Htq4rk4GIs3PQ3TErpi8wsHBBU";
    }
    return "";
  }
}
