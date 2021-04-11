import 'package:flutter/material.dart';
import 'package:streaming_service_app_ui/customicon.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TopPart(),
            BottomPart(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xFFE52020),
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Color(0xFFE52020)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text(
              'Search',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
            ),
            title: Text(
              'Bookmark',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            title: Text(
              'Profile',
            ),
          ),
        ],
      ),
    );
  }
}

class TopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: Mclipper(),
            child: Container(
              height: 370,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0x00000000),
                          const Color(0xD9333333),
                        ],
                        stops: [
                          0.0,
                          0.9,
                        ],
                        begin: FractionalOffset(0, 0),
                        end: FractionalOffset(0, 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 120.0,
                        left: 95.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'WATCH BEFORE EVERYONE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'SF-Pro-Display-Bold',
                            ),
                          ),
                          Text(
                            'The Punisher: Season 2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontFamily: 'SF-Pro-Display-Bold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: -20,
            top: 370,
            child: FractionalTranslation(
              translation: Offset(0, -0.5),
              child: Row(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      color: Color(0xFFE52020),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: RaisedButton(
                      onPressed: () {},
                      color: Color(0xFFE52020),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 80,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Watch Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'SF-Pro-Display-Bold',
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              CustomIcons.back_icon,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  final List<String> images = [
    "assets/images/runaways.jpg",
    "assets/images/avengers.jpg",
    "assets/images/blackpanther.jpg"
  ];

  final List<String> titles = ["Runaways", "Avengers: infinity war", "Black Panther"];

  List<Widget> movies() {
    List<Widget> movieList = new List();

    for (int i = 0; i < 3; i++) {
      var movieItem = Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 12,
        ),
        child: Container(
          height: 220,
          width: 135,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  images[i],
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                  left: 8,
                  right: 8,
                ),
                child: Text(
                  titles[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'SF-Pro-Display-Bold',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  i == 0 ? 'Season 2' : '',
                ),
              ),
            ],
          ),
        ),
      );

      movieList.add(movieItem);
    }

    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      margin: const EdgeInsets.only(left: 65),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Watch now',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'SF-Pro-Display-Bold',
                  ),
                ),
                FlatButton(
                  child: Text(
                    'View more',
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: movies(),
            ),
          ),
        ],
      ),
    );
  }
}

class Mclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 100.0);

    var controlpoint = Offset(35.0, size.height);
    var endpoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
        controlpoint.dx, controlpoint.dy, endpoint.dx, endpoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
