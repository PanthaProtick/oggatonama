import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 207, 207),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Profile'
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        actions: [
          Icon(Icons.more_vert)
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.account_circle,
              size: 150,
            ),
            Text(
              'Sajid Al Amin',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ), // set name from database
            ),
            SelectableText(
              'sajid@gmail.com'
            ),
            SizedBox(height: 10),
            Container(
              height: 40,
              width: double.infinity,
              padding: EdgeInsets.only(left: 15, top: 8),
              decoration: BoxDecoration(
                color: Colors.grey
              ),
              child: Text(
                'Information'
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customRow('Nid:', '1969276376237'),
                    SizedBox(height: 20),
                    customRow('Phone: ', '01712456732'),
                    SizedBox(height: 20),
                    customRow('Body Reported:', '11'),
                    SizedBox(height: 20),
                    customRow('Body Claimed:', '0')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customRow(String txt1, txt2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                            Text(
                              txt1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                            Text(
                              txt2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            )
                          ],
                        ),
    );
  }
}