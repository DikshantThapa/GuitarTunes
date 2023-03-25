import 'package:flutter/material.dart';
import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';

class Metronome extends StatefulWidget {


  const Metronome({super.key});

  @override
  State<Metronome> createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {

 bool ispauseicon=false;
  int counter=60;
  bool isplaying = false;
  AssetsAudioPlayer player = AssetsAudioPlayer();
  @override
  void initState(){    
    super.initState();
  }

  void incrementcounter(){
    setState(() {      
      counter++;
    });
  }
    void decrementcounter(){
      setState(() {
        counter--;
    });    
  }
    playbeep(){   
      late double time;
      setState(() {
         time = 60/counter;  
      });     
      Timer.periodic( Duration(milliseconds:(time*1000).toInt()), (timer) {
        if(!isplaying){
        timer.cancel();
      }
      player.open(Audio("/assets/sounds/beep1.mp3"));    
      });
    }

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(

      ),
      body:Center(       
        child:Column( 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
               
          children: [
           Expanded(
            flex:20,
            child:  SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [

                   Center(
                     child: SizedBox(
                      height: 150,
                      width: 150,
                      child: TextButton.icon(onPressed: decrementcounter, 
                        icon: Icon(Icons.minimize,

                        size: 80,
                        ),                                                           
                        label: Text(""),
                      ),
                     ),
                   ),

                   SizedBox(
                    height: double.infinity,
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Expanded(
                      flex: 80,
                      child:Text('$counter', 
                      style: TextStyle(fontSize: 70), 
                      ),
                    ),

                    Expanded(
                      flex:20,
                      child:Text("BPM",
                      style: TextStyle(fontSize: 20),
                      ),
                    )
                   ]),
                
                  ),

                   Center(
                     child: SizedBox(             
                      height: 150,
                      width: 150,                        
                        child: TextButton.icon(onPressed: incrementcounter, 
                        icon: Icon(Icons.add,
                        size: 70,
                        ),                                                           
                        label: Text(""),
                        ),
                      ),
                   ),
              ]
              ),
            ),
           ),

           Expanded(
            flex:50,
            child:  Container(             
              width: 300,
              height: 300,                                    
                child: Card(
                  shape: CircleBorder(),
                  elevation: 50,
                  shadowColor: Colors.black,
                  child: SizedBox(
                    child: ElevatedButton(onPressed:(){},                    
                    style:ElevatedButton.styleFrom(
                      enableFeedback: false,
                      backgroundColor: Colors.transparent,
                      shape:CircleBorder(),
                    ), 
                    child: Text("Tap")
                    ),
                  ),                  
                ),
            ),
            ),

           Expanded(
            flex:30,
            child:  Container(            
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    flex: 50,
                    child: TextButton(onPressed:(){
                      playbeep();
                      setState(() {                     
                      ispauseicon =!ispauseicon;
                      isplaying=!isplaying;
                      });
                    },
                     child:Icon((ispauseicon)?Icons.pause:Icons.play_arrow, 
                     size: 50,),
                     )                    
                  ),

                  Expanded(
                    flex: 50,
                    child: Container(
                      width: 300,
                      child: ListView(
                        padding: EdgeInsets.all(30),
                      scrollDirection:Axis.horizontal,
                      children: [
                        TextButton(onPressed:(){},
                         child: Text("5/7"),),
                    
                        TextButton(onPressed:(){},
                         child: Text("5/1"),),
                    
                          TextButton(onPressed:(){},
                         child: Text("5/9"),),
                    
                          TextButton(onPressed:(){},
                         child: Text("5/8"),),
                         
                          TextButton(onPressed:(){},
                         child: Text("5/7"),),
                    
                          TextButton(onPressed:(){},
                         child: Text("5/6"),)   
                      ],                      
                      ),
                    )                  
                  ),

                ],
              ),

            ),
            )
          ],
        ) 
      )
    );
  }
}








