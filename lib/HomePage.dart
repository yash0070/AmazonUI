import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [AppBar(), PrimeToggleBar(), Result()],
      ),
    );
  }
}

class AppBar extends StatefulWidget {
  const AppBar({Key? key}) : super(key: key);

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff88d7de), Color(0xffa8e4cc)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      height: 200,
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(
              height: 60,
              child: Row(
                children: [
                  SizedBox(width: 8.0),
                  Icon(Icons.arrow_back),
                  SizedBox(width: 8.0),
                  Expanded(child: SearchBar()),
                  SizedBox(
                    width: 8.0,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 8.0,
                  ),
                  Icon(Icons.place_outlined),
                  SizedBox(width: 10.0),
                  Text(
                    "Deliver to Yash - 301411",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Search Bar

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4.0,
            spreadRadius: 4.0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Icon(
              Icons.camera_alt_outlined,
              color: Colors.grey,
            ),
            SizedBox(width: 10.0),
            Icon(Icons.mic)
          ],
        ),
      ),
    );
  }
}

class PrimeToggleBar extends StatefulWidget {
  const PrimeToggleBar({Key? key}) : super(key: key);

  @override
  State<PrimeToggleBar> createState() => _PrimeToggleBarState();
}

class _PrimeToggleBarState extends State<PrimeToggleBar> {
  bool _primeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Image.asset(
            "images/prime.png",
            height: 30.0,
          ),
          Switch(
            value: _primeEnabled,
            onChanged: (value) => setState(() => _primeEnabled = value),
          ),
          Expanded(
            child: SizedBox(),
          ),
          DropdownButton<String>(
            items: <String>['A', 'B', 'C', 'D', 'E'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
            hint: Text(
              "filters",
              style: TextStyle(
                color: Color(0xff59918f),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "RESULTS",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _Item(
                      image: 'images/dot4.png',
                      title:
                          "Echo Dot (4th generation) | Smart speaker with Alexa | White",
                      amount: "29,99€",
                    ),
                    SizedBox(height: 8.0),
                    _Item(
                      image: "images/dot3.png",
                      title:
                          "Echo Dot (3rd Gen) - Smart speaker with Alexa - Charcoal Fabric",
                      amount: "21,99€",
                    ),
                    const SizedBox(height: 8.0),
                    _Item(
                      image: "images/show5.png",
                      title:
                          "Echo Show 5 (1st Gen) - Smart speaker with Alexa - Charcoal Fabric",
                      amount: "29,99€",
                    ),
                    const SizedBox(height: 8.0),
                    _Item(
                      image: "images/show8.png",
                      title:
                          "Echo Show 8 (1st Gen) - Smart speaker with Alexa - Charcoal Fabric",
                      amount: "29,99€",
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  _Item({required this.image, required this.title, required this.amount});

  final String image;
  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            flex: 5,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 240, 186, 87),
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 240, 186, 87),
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 240, 186, 87),
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 240, 186, 87),
                          size: 20,
                        ),
                        Icon(
                          Icons.star_half,
                          color: Color.fromARGB(255, 240, 186, 87),
                          size: 20,
                        ),
                        Text(
                          "43,200",
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: 150.0,
                    color: Color(0xffb22e1e),
                    child: Center(
                      child: Text(
                        "Limited time deal",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    amount,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Get it friday , Sep 3",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
