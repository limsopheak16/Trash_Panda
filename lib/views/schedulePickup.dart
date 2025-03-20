import 'package:flutter/material.dart';
import 'package:trash_panda/views/rewardScreen.dart';

class SchedulePickup extends StatefulWidget {
  const SchedulePickup({super.key});

  @override
  State<SchedulePickup> createState() => _SchedulePickupState();
}

class _SchedulePickupState extends State<SchedulePickup> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool isRecurring = false;
  String selectedWasteType = "Plastic";
  final TextEditingController weightController = TextEditingController(text: "5kg/1bag");
  
  // Current displayed month and year for the calendar
  DateTime currentDisplayMonth = DateTime(2025, 3);
  
  void _pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  void _previousMonth() {
    setState(() {
      currentDisplayMonth = DateTime(
        currentDisplayMonth.year,
        currentDisplayMonth.month - 1,
      );
    });
  }

  void _nextMonth() {
    setState(() {
      currentDisplayMonth = DateTime(
        currentDisplayMonth.year,
        currentDisplayMonth.month + 1,
      );
    });
  }

  void _showMonthYearPicker() async {
    final DateTime? picked = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return _buildMonthYearPicker();
      },
    );

    if (picked != null) {
      setState(() {
        currentDisplayMonth = picked;
      });
    }
  }

  Widget _buildMonthYearPicker() {
    int selectedYear = currentDisplayMonth.year;
    int selectedMonth = currentDisplayMonth.month;
    
    return AlertDialog(
      title: Text('Select Month and Year'),
      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Year picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    setState(() {
                      selectedYear--;
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {
                    // Show year picker
                    showDialog(
                      context: context,
                      builder: (context) => _buildYearPicker(selectedYear),
                    );
                  },
                  child: Text(
                    '$selectedYear',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    setState(() {
                      selectedYear++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // Month grid
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              children: List.generate(12, (index) {
                final monthNames = [
                  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                ];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(DateTime(selectedYear, index + 1));
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: selectedMonth == index + 1 ? Colors.green.withOpacity(0.2) : null,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectedMonth == index + 1 ? Colors.green : Colors.grey.shade300,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        monthNames[index],
                        style: TextStyle(
                          color: selectedMonth == index + 1 ? Colors.green : null,
                          fontWeight: selectedMonth == index + 1 ? FontWeight.bold : null,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
      ],
    );
  }

  Widget _buildYearPicker(int initialYear) {
    int startYear = initialYear - 5;
    
    return AlertDialog(
      title: Text('Select Year'),
      content: Container(
        width: double.maxFinite,
        height: 300,
        child: ListView.builder(
          itemCount: 11, // 5 years before and after current year
          itemBuilder: (context, index) {
            final year = startYear + index;
            return ListTile(
              title: Center(child: Text('$year')),
              selected: year == initialYear,
              selectedTileColor: Colors.green.withOpacity(0.2),
              onTap: () {
                Navigator.of(context).pop(DateTime(year, currentDisplayMonth.month));
              },
            );
          },
        ),
      ),
    );
  }

  // Generate calendar days
  List<Widget> _buildCalendarDays() {
    final daysInMonth = DateTime(currentDisplayMonth.year, currentDisplayMonth.month + 1, 0).day;
    final firstDayOfMonth = DateTime(currentDisplayMonth.year, currentDisplayMonth.month, 1);
    final dayOfWeek = firstDayOfMonth.weekday % 7; // 0 is Sunday in our display
    
    List<Widget> days = [];
    
    // Add day headers
    final dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    for (var name in dayNames) {
      days.add(
        Container(
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            name,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      );
    }
    
    // Add empty cells for days before the 1st of the month
    for (var i = 0; i < dayOfWeek; i++) {
      days.add(
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),
      );
    }
    
    // Add days of the month
    for (var i = 1; i <= daysInMonth; i++) {
      final currentDate = DateTime(currentDisplayMonth.year, currentDisplayMonth.month, i);
      final isSelected = selectedDate != null && 
                         selectedDate!.year == currentDate.year && 
                         selectedDate!.month == currentDate.month && 
                         selectedDate!.day == currentDate.day;
      
      days.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selectedDate = currentDate;
            });
          },
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              color: isSelected ? Colors.green.withOpacity(0.2) : null,
            ),
            child: Text(
              '$i',
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    }
    
    return days;
  }

  @override
  Widget build(BuildContext context) {
    // Format the month and year for display
    final formattedMonthYear = '${currentDisplayMonth.month}/${currentDisplayMonth.year}';
        
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Schedule Pickup', 
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.green, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Month and Year with navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, size: 16),
                    onPressed: _previousMonth,
                    color: Colors.green,
                  ),
                  GestureDetector(
                    onTap: _showMonthYearPicker,
                    child: Text(
                      formattedMonthYear,
                      style: TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: _nextMonth,
                    color: Colors.green,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Calendar Grid
              GridView.count(
                crossAxisCount: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: _buildCalendarDays(),
              ),
              
              const SizedBox(height: 24),
              
              // Time Section
              Text(
                'Time',
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.green
                ),
              ),
              GestureDetector(
                onTap: _pickTime,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedTime == null ? 'Time not set (all day)' : selectedTime!.format(context),
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      Icon(Icons.access_time_rounded, color: Colors.green),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Waste Type Section
              Text(
                'Waste Type',
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.green
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: ['Plastic', 'Metal', 'Paper', 'Glass'].map((type) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(type),
                      selected: selectedWasteType == type,
                      selectedColor: Colors.green.withOpacity(0.2),
                      labelStyle: TextStyle(
                        color: selectedWasteType == type ? Colors.green : Colors.black,
                      ),
                      onSelected: (selected) {
                        setState(() {
                          selectedWasteType = type;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              
              const SizedBox(height: 24),
              
              // Estimate weight/volume
              Text(
                'Estimate weight/volume',
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.green
                ),
              ),
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Recurring Pickup
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recurring Pickup',
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.green
                    ),
                  ),
                  Switch(
                    value: isRecurring,
                    onChanged: (value) {
                      setState(() {
                        isRecurring = value;
                        
                      });
                    },
                    activeColor: Colors.green,
                    activeTrackColor: Colors.green.withOpacity(0.5),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              
              // History Button
              Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3A6A47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RewardScreen()),
                  );
                },
                child: Text('History', style: TextStyle(color: Colors.white)),
              ),
),
              
              const SizedBox(height: 16),
              
              // Schedule Pickup Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3A6A47),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Schedule Pickup', 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

