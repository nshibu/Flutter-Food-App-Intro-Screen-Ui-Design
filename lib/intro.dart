import 'package:flutter/material.dart';

import 'data.dart';

class Intro extends StatefulWidget {
  final List<Food> imgModel;

  Intro({this.imgModel, Key key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _updateIndex(index) {
      setState(() {
        _selectedIndex = index;
      });

      print(index);
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.orange,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: Image.asset(
                        widget.imgModel[_selectedIndex].img,
                        height: MediaQuery.of(context).size.height * 0.48,
                        width: MediaQuery.of(context).size.width * 0.85,
                      ),
                    ),
                    Container(
                      height: 75.0,
                      child: ListView.builder(
                          itemCount: widget.imgModel.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _updateIndex(index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(37.5),
                                    border: Border.all(
                                      width: 2.0,
                                      color: _selectedIndex == index
                                          ? Colors.white
                                          : Colors.red,
                                    )),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(37.5),
                                  child: Image.asset(
                                    widget.imgModel[index].img,
                                    height: 75.0,
                                    width: 75.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      'Order & Let\'s eat \nHelthy Food',
                      style: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      "Ask not what you can do for your country, Ask what's for lunch.",
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                    SizedBox(height: 20.0),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.orange,
                      elevation: 0.0,
                      hoverElevation: 0.0,
                      height: 50.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
