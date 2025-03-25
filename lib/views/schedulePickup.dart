import 'package:flutter/material.dart';
import 'package:trash_panda/controllers/pickup_controller.dart';
import 'package:trash_panda/views/history.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePickupScreen extends StatefulWidget {
  @override
  _SchedulePickupScreenState createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
  DateTime? selectedDate;
  DateTime focusedDate = DateTime.now();
  List<String> selectedWasteTypes = [];
  String estimatedWeight = "";
  bool recurringPickup = false;
  bool showErrors = false;

  final List<String> _wasteTypes = ["Plastic", "Metal", "Paper", "Glass"];
  final ScheduleController _scheduleController = ScheduleController();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDate = selectedDay;
      focusedDate = focusedDay;
      showErrors = false; // Hide errors when user selects a date
    });
  }

  Future<void> _schedulePickup() async {
    setState(() {
      showErrors = true; // Show errors if form is incomplete
    });

    if (selectedDate == null || selectedWasteTypes.isEmpty || estimatedWeight.isEmpty) {
      return; // Stop if validation fails
    }

    try {
      final weightValue = double.tryParse(
        estimatedWeight.replaceAll(RegExp(r'[^0-9.]'), ''),
      ) ?? 0.0;

      await _scheduleController.createNewSchedule(
        userId: "1",
        date: selectedDate!.toIso8601String(),
        wasteTypes: selectedWasteTypes,
        estimateWeight: weightValue,
        recurring: recurringPickup,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pickup scheduled successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to schedule pickup: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Schedule Pickup",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            TableCalendar(
              firstDay: DateTime(2000),
              lastDay: DateTime(2101),
              focusedDay: focusedDate,
              selectedDayPredicate: (day) => isSameDay(selectedDate, day),
              onDaySelected: _onDaySelected,
              onPageChanged: (date) {
                setState(() {
                  focusedDate = date;
                });
              },
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 16),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.black),
                weekendStyle: TextStyle(color: Colors.black),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            if (showErrors && selectedDate == null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text("Please select a date.", style: TextStyle(color: Colors.red)),
              ),
            SizedBox(height: 20),

            // Waste Type Section
            _buildSectionTitle("Waste Type"),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: _wasteTypes.map((type) {
                bool isSelected = selectedWasteTypes.contains(type);
                return ChoiceChip(
                  label: Text(type),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedWasteTypes.add(type);
                      } else {
                        selectedWasteTypes.remove(type);
                      }
                      showErrors = false; // Hide errors when user selects waste type
                    });
                  },
                  selectedColor: Colors.green[100],
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.green : Colors.black,
                  ),
                );
              }).toList(),
            ),
            if (showErrors && selectedWasteTypes.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text("Please select at least one waste type.", style: TextStyle(color: Colors.red)),
              ),
            SizedBox(height: 20),

            // Estimate Weight/Volume Section
            _buildSectionTitle("Estimate weight/volume"),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                hintText: "5kg/1bag",
                errorText: showErrors && estimatedWeight.isEmpty ? "Please enter an estimated weight." : null,
              ),
              onChanged: (value) {
                setState(() {
                  estimatedWeight = value;
                  showErrors = false; // Hide errors when user enters weight
                });
              },
            ),
            SizedBox(height: 20),

            // Recurring Pickup Section
            _buildSectionTitle("Recurring Pickup"),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text(""),
              value: recurringPickup,
              onChanged: (value) {
                setState(() {
                  recurringPickup = value;
                });
              },
              activeColor: Colors.green,
              secondary: Icon(Icons.refresh, color: Colors.green),
            ),
            SizedBox(height: 20),

            // History Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ScheduledPickupsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "History",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Schedule Pickup Button
            ElevatedButton(
              onPressed: _schedulePickup,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Schedule Pickup",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}
