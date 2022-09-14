import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/barisdua.dart';
import 'package:flutter_basic/pages/form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                BarisSatu(),
                const SizedBox(
                  height: 10,
                ),
                BarisDuaPage(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  width: 800,
                  color: Colors.green,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      bool isGenap = false;
                      if (index % 2 == 0) {
                        isGenap = true;
                      } else {
                        isGenap = false;
                      }
                      return Container(
                        width: 100,
                        height: 80,
                        color: isGenap ? Colors.black : Colors.amber,
                        child: Center(
                          child: Text(
                            index.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
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

class BarisSatu extends StatelessWidget {
  const BarisSatu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 30,
      color: Colors.red,
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 100,
              height: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                color: Color(0xffA569BD),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIg-9ZhS6gRfvtmYoHxlu_28wkvD_x_vx1Assn7-7B&s',
              width: 180,
            ),
          ),
          Flexible(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/kolam.png',
            ),
          )),
        ],
      ),
    );
  }
}
