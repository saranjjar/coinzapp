
import 'package:flutter/material.dart';
import '../../Shared/color.dart';
import '../Home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed(Duration(seconds: 2),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors:[
                              Colors.orange,
                              Colors.yellow,
                            ],
                              begin: AlignmentDirectional.topStart,
                                end: AlignmentDirectional.bottomEnd
                            )
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: gyallow,
                              gradient: LinearGradient(colors:[
                                Colors.pinkAccent,
                                Colors.purple,
                              ],
                                  begin: AlignmentDirectional.topStart,
                                  end: AlignmentDirectional.bottomEnd
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors:[
                              Colors.blue,
                              Colors.lightBlueAccent,
                            ],
                                begin: AlignmentDirectional.topStart,
                                end: AlignmentDirectional.bottomEnd
                            )
                        ),
                      ),
                    ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors:[
                                Colors.lightGreen,
                                Colors.greenAccent,
                              ],
                                  begin: AlignmentDirectional.topStart,
                                  end: AlignmentDirectional.bottomEnd
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150,),
                  Text('بلوك \nتشين',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 20,),
                  Image(image: AssetImage('assets/images/Fill 113.png'))
                ],
              ),
            )
          ],
        ),
      ));
  }
}
