import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:city_influencers_app/widgets/shared/hexcolor.dart';
class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    Color color1 = HexColor("#34B6C6");
    Color color2 = HexColor("#4C525C");
    
    return Theme(
           data: Theme.of(context).copyWith(
                 canvasColor: color2, //This will change the drawer background to blue.
                 //other styles
              ),child: Drawer(
        
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        
        child: ListView(
          // Important: Remove any padding from the ListView.
          
          children: [
            SizedBox(
          height: 28.h,
            child:  DrawerHeader(
              decoration: BoxDecoration(
                color: color1,
              ),
              child: const Text('Drawer Header'),
            )),
            ListTile(
              leading:  Icon(Icons.person,color: Colors.white,size: 3.h,),
              title: const Text("Profile",style: TextStyle(fontSize: 24,
                          fontWeight: FontWeight.bold, color: Colors.white)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            const Divider(
            thickness: 1,
            indent: 20,
            endIndent:40,
            color: Colors.white,
          ),
            ListTile(
              leading:  Icon(Icons.shopping_bag_outlined,color: Colors.white,size: 3.h,),
             title: const Text("Campaigns",style: TextStyle(fontSize: 24,
                          fontWeight: FontWeight.bold, color: Colors.white)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            const Divider(
            thickness: 1,
            indent: 20,
            endIndent:40,
            color: Colors.white,
          ),
            ListTile(
              leading:  Icon(Icons.credit_card,color: Colors.white,size: 3.h,),
              title: const Text("Finances",style: TextStyle(fontSize: 24,
                          fontWeight: FontWeight.bold, color: Colors.white)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            const Divider(
            thickness: 1,
            indent: 20,
            endIndent:40,
            color: Colors.white,
          ),
            ListTile(
              leading:  Icon(Icons.shopping_bag_outlined,color: Colors.white,size: 3.h,),
              title: const Text("Privacy policy",style: TextStyle(fontSize: 24,
                          fontWeight: FontWeight.bold, color: Colors.white)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            const Divider(
            thickness: 1,
            indent: 20,
            endIndent:40,
            color: Colors.white,
          ),
            ListTile(
               leading:  Icon(Icons.settings,color: Colors.white,size: 3.h,),
              title: const Text("Settings",style: TextStyle(fontSize: 24,
                          fontWeight: FontWeight.bold, color: Colors.white)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
              ),
      );
  }
}