import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget{
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF1D1616),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 72),
              child: Text(
                'Oggatonama',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 56,
                    color: Color(0xFFD84040)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: ElevatedButton.icon(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity,75),
                  foregroundColor: Color(0xFF8E1616),
                  backgroundColor: Color(0xFFEEEEEE),
                ),
                label: Text(
                  'Claim/Search dead body',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                icon: Icon(Icons.search,color: Color(0xFFD84040)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: ElevatedButton.icon(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity,75),
                    backgroundColor: Color(0xFF8E1616),
                    foregroundColor: Color(0xFFEEEEEE)
                ),
                label: Text(
                  'Register dead body',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                icon: Icon(Icons.pending_actions,color: Color(0xFFEEEEEE)),
              ),
            ),
          ],
        ),
      ),
    );
  }

}