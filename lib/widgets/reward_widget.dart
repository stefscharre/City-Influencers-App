import 'package:city_influencers_app/pages/rewarddetail.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
class RewardWidget extends StatelessWidget {


  const RewardWidget(
      {Key? key}) 
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _navigateToRewardDetail() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RewardDetail()),
    );
    
  }
    Color color1 = HexColor("#34B6C6");
    Color color2 = HexColor("#B8B8B8");
    return Padding(
      
      padding: const EdgeInsets.fromLTRB(0,10,0,0),
     child: GestureDetector(
        onTap: (){
          _navigateToRewardDetail();
        },
      child: SizedBox(
          height: 18.h,      
          width: 45.w,

        child: Card(
      shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
          
        child: Column(
          
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                  "Reward" ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: color1),
                ),
            ),
              Text(       
            "A voucher of €10",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold, color: color1),
          ), const Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: Text(
                
                "100 Points"
                ,textAlign: TextAlign.center,
              ),
          ),
          ])
       

        
      )),
    ));
  }
}