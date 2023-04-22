import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 57,
                  padding: EdgeInsets.only(left: 18),
                  width: 160,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "General",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red)
                      ),
                ),
                SizedBox(
                  width: 200,
                )
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ßborder: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß   border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            SizedBox(
              height: 19,
            ),

            Row(
              children: [
                Container(
                  height: 57,
                  padding: EdgeInsets.only(left: 18),
                  width: double.maxFinite,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Chords",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  decoration: BoxDecoration(
                      //  border: Border.all(color: Colors.white)
                      ),
                ),
                SizedBox(
                  width: 200,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            //Subscription
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Container(
                  height: 57,
                  padding: EdgeInsets.only(left: 18),
                  width: double.maxFinite,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Subscription",
                    style: TextStyle(
                        //ß          color: Colors.white,
                        fontSize: 30),
                  ),
                  decoration: BoxDecoration(
                      //  border: Border.all(color: Colors.white)
                      ),
                ),
                SizedBox(
                  width: 200,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  //ß  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),
          ],
        ),
      ),
    );
  }
}
