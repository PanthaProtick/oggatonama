import 'package:flutter/material.dart';
import 'package:oggatonama/claim_body.dart';
import 'package:oggatonama/drawer.dart';
import 'package:oggatonama/report_body.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final List<String> tileName = [
    'Report a deadbody',
    'Claim a deadbody',
    'Nearest Hospital'
  ];

  final List<String> subtileName = [
    'Information about disinherited deadbody',
    'Get information from our database',
    'Finad the nearest hospital'
  ];

  final List<String> leadingImage = [
    'assets/report_body.png',
    'assets/claim_body.png',
    'assets/hospital.png',
  ];

  void onTap(BuildContext context, int index) {
    switch(index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReportPage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ClaimBodyPage()));
        break;
      case 2:
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ReportPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 207, 207),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 209, 207, 207),
        title: Text('Oggatonama'),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customContainer(),
            Divider(
              color: Colors.black,
              height: 50,
              thickness: 1,
            ),
            Text(
              'Services',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20),
            serviceList()
          ],
        ),
      ),
    );
  }

  Widget customContainer() {
    return Container(
      height: 150,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(24)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                'Report unknown deadbodies !',
                style: TextStyle(
                  color: const Color.fromARGB(255, 209, 207, 207),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(flex: 1, child: Image.asset('assets/deadbody.jpg'))
          ],
        ),
      ),
    );
  }

  Widget serviceList() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
          itemCount: 2,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 100,
              child: ListTile(
                onTap: () {
                  onTap(context, index);
                },
                shape: Border(
                  bottom: BorderSide()
                ),
                  title: Text(tileName[index]),
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                  subtitle: Text(subtileName[index]),
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: Image.asset(
                          leadingImage[index],
                          fit: BoxFit.cover,
                        ).image
                      )
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right
                  ),
                ),
            );
          }),
    );
  }
}
