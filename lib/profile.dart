import 'package:flutter/material.dart';
import 'package:oggatonama/fetch_userdata.dart';
import 'package:oggatonama/user_class.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthServices _authServices = AuthServices();
  late UserInformation _userInformation;
  bool isFetching = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
        String? uid = _authServices.getCurrentUserUID();
        print("Current User UID: $uid"); // Debug

        if (uid == null) {
            throw Exception("User not logged in");
        }

        UserInformation userData = await _authServices.userInformation(uid);
        print("Fetched User Data: ${userData.toString()}"); // Debug

        setState(() {
            _userInformation = userData;
            isFetching = false;
        });
    } catch (e) {
        print('Fetch Data Error: $e'); // Debug
        setState(() {
            isFetching = false;
        });
    }
}


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
        
      ),
      body: isFetching 
      ? Center(child: CircularProgressIndicator())
      : userInfo()
    );
  }

  Widget userInfo() {
    return Center(
        child: Column(
          children: [
            Icon(
              Icons.account_circle,
              size: 150,
            ),
            Text(
              '${_userInformation.firstName} ${_userInformation.lastName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ), // set name from database
            ),
            SelectableText(
              _userInformation.email
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
                    customRow('Nid:', _userInformation.nid),
                    SizedBox(height: 20),
                    customRow('Phone: ', _userInformation.phone),
                    SizedBox(height: 20),
                    customRow('Body Reported:', '0'),
                    SizedBox(height: 20),
                    customRow('Body Claimed:', '0')
                  ],
                ),
              ),
            )
          ],
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