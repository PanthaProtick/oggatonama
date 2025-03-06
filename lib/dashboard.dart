import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oggatonama/report_body.dart'; // Import the Report Body Page
import 'package:oggatonama/accounts.dart'; // Import the Accounts Page
import 'package:oggatonama/claim_body.dart'; // Import the ClaimBodyPage

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
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
                    color: Color(0xFFD84040)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to ClaimBodyPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClaimBodyPage()), // Updated here
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 75),
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
                icon: Icon(Icons.search, color: Color(0xFFD84040)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to Report Body Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReportPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 75),
                    backgroundColor: Color(0xFF8E1616),
                    foregroundColor: Color(0xFFEEEEEE)),
                label: Text(
                  'Register dead body',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                icon: Icon(Icons.pending_actions, color: Color(0xFFEEEEEE)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: ElevatedButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut(); // Sign out

                  // Navigate to Accounts Page and remove Dashboard from stack
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Accounts()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 75),
                    backgroundColor: Color(0xFF8E1616),
                    foregroundColor: Color(0xFFEEEEEE)),
                label: Text(
                  'Sign out',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                icon: Icon(Icons.logout, color: Color(0xFFEEEEEE)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
