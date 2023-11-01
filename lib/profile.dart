import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center(
            child: Text("Profile"),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 250,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlue],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.8],
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.red.shade500,
                        minRadius: 35,
                        child: const Icon(
                          Icons.call,
                          size: 30,
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white70,
                        minRadius: 60,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://avatars.githubusercontent.com/u/116133300?v=4'),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red.shade500,
                        minRadius: 35,
                        child: const Icon(
                          Icons.message,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Ahsan Azizan",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Software Engineer",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.lightBlue,
                      child: const ListTile(
                        title: Text(
                          "69",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          "Followers",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: const ListTile(
                        title: Text(
                          "96",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          "Following",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white70),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: const <Widget>[
                  ListTile(
                    title: Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "ahsanaz461@gmail.com",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Github",
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "https://github.com/ahsanzizan",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      "Linkedin",
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "https://linkedin.com/in/ahsan-azizan",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
