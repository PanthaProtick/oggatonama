import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> reportBody({
    required String reporterName,
    required String contactNumber,
    required String discoveryLocation,
    required String currentLocation,
    required String height,
    required String gender,
    required String clothing,
    required String details,
    required DateTime deathTime,
    required String reasonOfDeath,
    required String approximateAge,
  }) async {
    try {
      await _db.collection('reported_bodies').add({
        'reporter_name': reporterName,
        'contact_number': contactNumber,
        'discovery_location': discoveryLocation,
        'current_location': currentLocation,
        'height': height,
        'gender': gender,
        'clothing': clothing,
        'details': details,
        'estimated_death_time': deathTime,
        'reason_of_death': reasonOfDeath,
        'timestamp': FieldValue.serverTimestamp(),
        'approximate_age': approximateAge,
      });
    } catch (e) {
      throw Exception("Failed to report: $e");
    }
  }
}

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _formKey = GlobalKey<FormState>();
  final _reporterNameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _currentLocationController = TextEditingController();
  final _clothingController = TextEditingController();
  final _detailsController = TextEditingController();
  final _reasonOfDeathController = TextEditingController();
  DateTime? _selectedDeathTime;
  String _selectedGender = 'Unknown';

  String? _selectedDivision;// = 'Dhaka'; // Default division
  String? _selectedDistrict;

  // Height input variables
  String? _selectedFeet;  // Default value for feet
  String? _selectedInches ;  // Default value for inches
  String? _selectedAge;

  final FirestoreService _firestoreService = FirestoreService();

  // Define divisions and corresponding districts
  final Map<String, List<String>> _districts = {
    'Barisal': ['Barguna', 'Barisal', 'Bhola', 'Jhalokati', 'Patuakhali', 'Pirojpur'],
    'Chattogram': ['Bandarban', 'Brahmanbaria', 'Chandpur', 'Chittagong', 'Comilla', 'Cox’s Bazar', 'Feni', 'Khagrachari', 'Lakshmipur', 'Noakhali', 'Rangamati'],
    'Dhaka': ['Dhaka', 'Faridpur', 'Gazipur', 'Gopalganj', 'Kishoreganj', 'Madaripur', 'Manikganj', 'Munshiganj', 'Narayanganj', 'Narsingdi', 'Rajbari', 'Shariatpur', 'Tangail'],
    'Mymensingh': ['Mymensingh', 'Jamalpur', 'Sherpur', 'Netrokona'],
    'Khulna': ['Bagerhat', 'Chuadanga', 'Jessore', 'Jhenaidah', 'Khulna', 'Kushtia', 'Magura', 'Meherpur', 'Narail', 'Shatkhira'],
    'Rajshahi': ['Bogra', 'Jaipurhat', 'Naogaon', 'Natore', 'Nawabganj', 'Pabna', 'Rajshahi', 'Sirajganj'],
    'Rangpur': ['Rangpur', 'Nilphamari', 'Dinajpur', 'Panchagarh', 'Gaibandha', 'Kurigram', 'Lalmonirhat', 'Thakurgaon'],
    'Sylhet': ['Habiganj', 'Maulvibazar', 'Sunamganj', 'Sylhet'],
  };

  Future<void> _pickDeathTime() async {
    DateTime now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: now,
    );
    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDeathTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  void _submitReport() async {
    if (_formKey.currentState!.validate() && _selectedDeathTime != null) {
      try {
        String height = "${_selectedFeet}'${_selectedInches}\""; // Concatenate feet and inches
        String discoveryLocation = '${_selectedDivision}: ${_selectedDistrict}';
        await _firestoreService.reportBody(
          reporterName: _reporterNameController.text,
          contactNumber: _contactNumberController.text,
          discoveryLocation: discoveryLocation,  // Pass selected division and district
          currentLocation: _currentLocationController.text,
          height: height, // Pass the formatted height string
          gender: _selectedGender,
          clothing: _clothingController.text,
          details: _detailsController.text,
          deathTime: _selectedDeathTime!,
          reasonOfDeath: _reasonOfDeathController.text,
          approximateAge: _selectedAge!,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Report submitted successfully!")),
        );
        _formKey.currentState!.reset();
        setState(() {
          _selectedDeathTime = null;
          _selectedGender = 'Unknown';
          _reasonOfDeathController.clear();
          _selectedFeet = '5';  // Reset feet field
          _selectedInches = '0';  // Reset inches field
          _selectedDistrict = null; // Reset district
          _selectedAge = null;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields including Death Time!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report Found Body")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _reporterNameController,
                decoration: InputDecoration(labelText: "Reporter's Name"),
                validator: (value) => value!.isEmpty ? "Enter reporter's name" : null,
              ),
              TextFormField(
                controller: _contactNumberController,
                decoration: InputDecoration(labelText: "Contact Number"),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? "Enter contact number" : null,
              ),
              DropdownButtonFormField<String>(
                value: _selectedDivision,
                items: _districts.keys
                    .map((division) => DropdownMenuItem(
                  value: division,
                  child: Text(division),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDivision = value!;
                    _selectedDistrict = null;  // Reset district when division changes
                  });
                },
                decoration: InputDecoration(labelText: "Discovery Location (Division)"),
                validator: (value) => value == null ? "Select a division" : null,
              ),
              DropdownButtonFormField<String>(
                value: _selectedDistrict,
                items: _selectedDivision != null
                    ? _districts[_selectedDivision]!
                    .map((district) => DropdownMenuItem(
                  value: district,
                  child: Text(district),
                ))
                    .toList()
                    : [],
                onChanged: (value) => setState(() => _selectedDistrict = value!),
                decoration: InputDecoration(labelText: "Discovery Location (District)"),
                validator: (value) => value == null ? "Select a district" : null,
              ),
              DropdownButtonFormField<String>(
                value: _selectedAge,
                items: [
                  '0-5', '6-10', '11-15', '16-20', '21-25', '26-30',
                  '31-35', '36-40', '41-45', '46-50', '51-55', '56-60', '61-65', '66-70',
                  '71-75', '76-80', '81-85', '86-90', '91-95', '96+'
                ].map((age) => DropdownMenuItem(
                  value: age,
                  child: Text(age),
                )).toList(),
                onChanged: (value) => setState(() => _selectedAge = value!),
                decoration: InputDecoration(labelText: "Approximate Age"),
                validator: (value) => value == null ? "Select an approximate age" : null,
              ),
              TextFormField(
                controller: _currentLocationController,
                decoration: InputDecoration(labelText: "Current Location"),
                validator: (value) => value!.isEmpty ? "Enter your current location" : null,
              ),
              // Height input with label
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text("Height", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedFeet,
                      items: List.generate(8, (index) => (index + 0).toString()) // Feet options from 4 to 11
                          .map((feet) => DropdownMenuItem(
                        value: feet,
                        child: Text('$feet ft'),
                      ))
                          .toList(),
                      onChanged: (value) => setState(() => _selectedFeet = value!),
                      decoration: InputDecoration(labelText: "Feet"),
                      validator: (value) => value == null ? "Select height in feet" : null,
                    ),
                  ),
                  SizedBox(width: 8), // Spacer between feet and inches
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedInches,
                      items: List.generate(12, (index) => index.toString()) // Inches options from 0 to 11
                          .map((inches) => DropdownMenuItem(
                        value: inches,
                        child: Text('$inches in'),
                      ))
                          .toList(),
                      onChanged: (value) => setState(() => _selectedInches = value!),
                      decoration: InputDecoration(labelText: "Inches"),
                      validator: (value) => value == null ? "Select height in inches" : null,
                    ),
                  ),
                ],
              ),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                items: ['Male', 'Female', 'Unknown']
                    .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                ))
                    .toList(),
                onChanged: (value) => setState(() => _selectedGender = value!),
                decoration: InputDecoration(labelText: "Gender"),
              ),
              TextFormField(
                controller: _clothingController,
                decoration: InputDecoration(labelText: "Clothing Details"),
                validator: (value) => value!.isEmpty ? "Enter clothing details" : null,
              ),
              TextFormField(
                controller: _detailsController,
                decoration: InputDecoration(labelText: "Additional Identification Details"),
                maxLines: 3,
              ),
              TextFormField(
                controller: _reasonOfDeathController,
                decoration: InputDecoration(labelText: "Reason of Death"),
                validator: (value) => value!.isEmpty ? "Enter reason of death" : null,
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text(
                  _selectedDeathTime == null
                      ? "Pick Estimated Death Time"
                      : "Death Time: ${_selectedDeathTime!.toLocal()}",
                ),
                trailing: Icon(Icons.access_time),
                onTap: _pickDeathTime,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitReport,
                child: Text("Submit Report"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
