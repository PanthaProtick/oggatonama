import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the URL launcher package

class ClaimBodyPage extends StatefulWidget {
  const ClaimBodyPage({super.key});

  @override
  _ClaimBodyPageState createState() => _ClaimBodyPageState();
}

class _ClaimBodyPageState extends State<ClaimBodyPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? selectedAgeRange = 'All';
  List<String> ageRanges = [
    'All', '0-10', '11-20', '21-30', '31-40', '41-50',
    '51-60', '61-70', '71-80', '81-90', '91+'
  ];

  String? selectedDivision = 'All';
  List<String> divisions = [
    'All', 'Barisal', 'Chattogram', 'Dhaka', 'Khulna',
    'Mymensingh', 'Rajshahi', 'Rangpur', 'Sylhet'
  ];

  bool isAgeInRange(String? ageString, String range) {
    if (ageString == null) return false;
    String numericAge = RegExp(r'\d+').stringMatch(ageString) ?? '';
    if (numericAge.isEmpty) return false;
    int age = int.tryParse(numericAge) ?? -1;
    if (age == -1) return false;

    switch (range) {
      case '0-10': return age >= 0 && age <= 10;
      case '11-20': return age >= 11 && age <= 20;
      case '21-30': return age >= 21 && age <= 30;
      case '31-40': return age >= 31 && age <= 40;
      case '41-50': return age >= 41 && age <= 50;
      case '51-60': return age >= 51 && age <= 60;
      case '61-70': return age >= 61 && age <= 70;
      case '71-80': return age >= 71 && age <= 80;
      case '81-90': return age >= 81 && age <= 90;
      case '91+': return age >= 91;
      default: return true;
    }
  }

  Future<void> _toggleClaimStatus(String docId, bool isClaimed) async {
    await _firestore.collection('reported_bodies').doc(docId).update({'claimed': !isClaimed});
  }

  // Function to launch the phone dialer with the given phone number.
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch dialer')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Claim Reported Bodies")),
      body: Column(
        children: [
          // Division filter
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: selectedDivision,
              decoration: InputDecoration(
                labelText: "Filter by Division",
                border: OutlineInputBorder(),
              ),
              items: divisions.map((division) {
                return DropdownMenuItem(
                  value: division,
                  child: Text(division),
                );
              }).toList(),
              onChanged: (value) {
                setState(() { selectedDivision = value; });
              },
            ),
          ),
          // Age filter
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: selectedAgeRange,
              decoration: InputDecoration(
                labelText: "Filter by Approximate Age",
                border: OutlineInputBorder(),
              ),
              items: ageRanges.map((age) {
                return DropdownMenuItem(
                  value: age,
                  child: Text(age),
                );
              }).toList(),
              onChanged: (value) {
                setState(() { selectedAgeRange = value; });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('reported_bodies').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No reported bodies found."));
                }

                var reports = snapshot.data!.docs.where((doc) {
                  var data = doc.data() as Map<String, dynamic>;
                  String? ageString = data['approximate_age'];
                  String? discoveryLocation = data['discovery_location'];

                  bool isAgeValid = selectedAgeRange == 'All' || isAgeInRange(ageString, selectedAgeRange!);
                  bool isLocationValid = selectedDivision == 'All' ||
                      (discoveryLocation?.contains(selectedDivision!) ?? false);

                  return isAgeValid && isLocationValid;
                }).toList();

                return ListView.builder(
                  itemCount: reports.length,
                  itemBuilder: (context, index) {
                    var report = reports[index];
                    var data = report.data() as Map<String, dynamic>;
                    String docId = report.id;

                    Timestamp? timestamp = data['estimated_death_time'];
                    String formattedDeathTime = 'Unknown';
                    if (timestamp != null) {
                      DateTime dateTime = timestamp.toDate();
                      formattedDeathTime = DateFormat('MMMM d, yyyy h:mm a').format(dateTime);
                    }
                    String reasonOfDeath = data['reason_of_death'] ?? 'Unknown';
                    bool isClaimed = data['claimed'] ?? false;
                    String phoneNumber = data['contact_number'] ?? '';

                    return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Reporter: ${data['reporter_name'] ?? 'Unknown'}",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text("Contact: ${phoneNumber.isNotEmpty ? phoneNumber : 'N/A'}"),
                            Text("Discovery Location: ${data['discovery_location'] ?? 'N/A'}"),
                            Text("Current Location: ${data['current_location'] ?? 'N/A'}"),
                            Text("Height: ${data['height'] ?? 'N/A'}"),
                            Text("Gender: ${data['gender'] ?? 'N/A'}"),
                            Text("Clothing: ${data['clothing'] ?? 'N/A'}"),
                            Text("Approximate Age: ${data['approximate_age'] ?? 'N/A'}"),
                            Text("Details: ${data['details'] ?? 'N/A'}"),
                            SizedBox(height: 5),
                            Text("Estimated Death Time: $formattedDeathTime",
                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text("Reason of Death: $reasonOfDeath",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            // Row containing Claim and Call buttons.
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () => _toggleClaimStatus(docId, isClaimed),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isClaimed ? Colors.green : Colors.red,
                                  ),
                                  child: Text(
                                    isClaimed ? "Claimed" : "Unclaimed",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    if (phoneNumber.isNotEmpty) {
                                      _makePhoneCall(phoneNumber);
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('No contact number available')),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                  ),
                                  child: Text(
                                    "Call",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
