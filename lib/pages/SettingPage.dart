import 'dart:ffi';

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
  bool toggled = false;
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title: const Text(
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
                  padding: const EdgeInsets.only(left: 18),
                  width: 160,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                      //border: Border.all(color: Colors.red)
                      ),
                  child: const Text(
                    "General",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                const SizedBox(
                  width: 200,
                )
              ],
            ),

            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
              child: const Text(
                "Language",
                style: TextStyle(color: Colors.white60, fontSize: 25),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 8),
              height: 60,
              alignment: Alignment.center,
              width: 600,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
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
                  border: Border.all(color: Colors.white),
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
                  border: Border.all(color: Colors.white),
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
                  border: Border.all(color: Colors.white),
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
                  border: Border.all(color: Colors.white),
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
                  border: Border.all(color: Colors.white),
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
                  width: 160,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Chords",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  decoration: BoxDecoration(
                      /* border: 
                      Border.all(color: Colors.white) */
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
                  border: Border.all(color: Colors.white),
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
                  border: Border.all(color: Colors.white),
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
                  width: 200,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Subscription",
                    style: TextStyle(
                        //ß          color: Colors.white,
                        fontSize: 30),
                  ),
                  decoration: BoxDecoration(
                      //border: Border.all(color: Colors.white)
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
                  border: Border.all(color: Colors.white),
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
                  border: Border.all(color: Colors.white),
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
                  border: Border.all(color: Colors.white),
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
                  border: Border.all(color: Colors.white),
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
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
            ),

            /*   SwitchListTile(value: toggled,
             onChanged: (bool value){
              setState(()=>toggled = value);
             },title: Text("Recieve Notification",style: TextStyle(fontSize: 25),),activeColor: Colors.green.shade400
            ,) */
          ],
        ),
      ),
    );
  }
}
