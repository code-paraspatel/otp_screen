import 'package:flutter/material.dart';
import 'package:otp_screen/input_text_feild_widget.dart';


class MyOtpScreen extends StatefulWidget {
  const MyOtpScreen({super.key});

  @override
  State<MyOtpScreen> createState() => _MyOtpScreenState();
}

class _MyOtpScreenState extends State<MyOtpScreen> {

  TextEditingController firstc=TextEditingController();
  TextEditingController secC=TextEditingController();
  TextEditingController thirdC=TextEditingController();
  TextEditingController fourC=TextEditingController();

String? otp;

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height*0.1,
            ),
            Text('Verify Screen',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.blue.shade600,
                 fontSize: height*0.05,
              ),),
            SizedBox(
              height: height*0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InputField(controller:firstc,autoFocus: true,),
                InputField(controller:secC,autoFocus: false,),
                InputField(controller:thirdC,autoFocus: false,),
                InputField(controller:fourC,autoFocus: false,),
              ],
            ),
            SizedBox(
              height: height*0.1,
            ),
            Text( otp ?? 'Please Enter Otp',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.blue),),
            SizedBox(
              height: height*0.08,
            ),
            Container(
              width: width*0.7,
              height: height*0.055,
              decoration: const BoxDecoration(
                color: Colors.blue
              ),
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.zero,
                  )
                ),
                  onPressed: () {
                   setState(() {
                     if(firstc.text.isNotEmpty && secC.text.isNotEmpty && thirdC.text.isNotEmpty && fourC.text.isNotEmpty){
                       otp= firstc.text.toString()+secC.text.toString()+thirdC.text.toString()+fourC.text.toString();
                     }else{
                       otp='Enter correct OTP';
                     }
                   });
                  },
                  child: const Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18),)),
            )
          ],
        ),
      ),
    );
  }
}
