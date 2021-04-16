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
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return portraitContainer();
        } else {
          return landscapeContainer(context);
        }
      }),
    ));
  }

  Widget portraitContainer() {
    return Center(
      child: Container(
        height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(chosenPlanet,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            Image.network(
              getPlanetImageUrl(),
              height: 300,
              width: 300,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child:
                OutlinedButton(
                    child: Text("Mars",
                        style: chosenPlanet == "Mars"
                            ? TextStyle(color: Colors.black)
                            : TextStyle()),
                    style: portraitButtonStyle(chosenPlanet == "Mars"),
                    onPressed: () => {
                          setState(() {
                            chosenPlanet = "Mars";
                          })
                        })),
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child:
                OutlinedButton(
                    child: Text("Earth",
                        style: chosenPlanet == "Earth"
                            ? TextStyle(color: Colors.black)
                            : TextStyle()),
                    style: portraitButtonStyle(chosenPlanet == "Earth"),
                    onPressed: () => {
                          setState(() {
                            chosenPlanet = "Earth";
                          })
                        })),
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child:
                OutlinedButton(
                    child: Text("Jupiter",
                        style: chosenPlanet == "Jupiter"
                            ? TextStyle(color: Colors.black)
                            : TextStyle()),
                    style: portraitButtonStyle(chosenPlanet == "Jupiter"),
                    onPressed: () => {
                          setState(() {
                            chosenPlanet = "Jupiter";
                          })
                        })),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget landscapeContainer(context) {
    return Center(
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(getPlanetImageUrl(),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.height * 0.5),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(chosenPlanet,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.1,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    child:
                  OutlinedButton(
                      child: Text("Mars",
                          style: chosenPlanet == "Mars"
                              ? TextStyle(color: Colors.black)
                              : TextStyle()),
                      style: landscapeButtonStyle(chosenPlanet == "Mars"),
                      onPressed: () => {
                            setState(() {
                              chosenPlanet = "Mars";
                            })
                          })),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    child:
                  OutlinedButton(
                      child: Text("Earth",
                          style: chosenPlanet == "Earth"
                              ? TextStyle(color: Colors.black)
                              : TextStyle()),
                      style: landscapeButtonStyle(chosenPlanet == "Earth"),
                      onPressed: () => {
                            setState(() {
                              chosenPlanet = "Earth";
                            })
                          })),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    child:
                  OutlinedButton(
                      child: Text("Jupiter",
                          style: chosenPlanet == "Jupiter"
                              ? TextStyle(color: Colors.black)
                              : TextStyle()),
                      style: landscapeButtonStyle(chosenPlanet == "Jupiter"),
                      onPressed: () => {
                            setState(() {
                              chosenPlanet = "Jupiter";
                            })
                          })),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }

  ButtonStyle portraitButtonStyle(bool isChosen) {
    return isChosen
        ? ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            minimumSize: MaterialStateProperty.all<Size>(
                Size(MediaQuery.of(context).size.width * .2, 50)))
        : ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
                Size(MediaQuery.of(context).size.width * .2, 50)));
  }

  ButtonStyle landscapeButtonStyle(bool isChosen) {
    return isChosen
        ? ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            minimumSize: MaterialStateProperty.all<Size>(
                Size(MediaQuery.of(context).size.width * .2, 80)))
        : ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
                Size(MediaQuery.of(context).size.width * .2, 80)));
  }

  String getPlanetImageUrl() {
    switch (chosenPlanet) {
      case "Mars":
        return "https://cdn.pixabay.com/photo/2011/12/13/14/30/mars-11012_960_720.jpg";
      case "Earth":
        return "https://cdn.pixabay.com/photo/2016/04/02/21/01/earth-1303628_960_720.png";
      case "Jupiter":
        return "https://cdn.pixabay.com/photo/2020/02/22/08/15/space-4869815_960_720.jpg";
    }
    return "";
  }
}
