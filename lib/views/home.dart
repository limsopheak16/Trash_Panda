import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import "package:trash_panda/views/Recent_all.dart";

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hello, Pheak',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Start your waste to be money',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF186235),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize:
                                MainAxisSize.min, // Keeps items close together
                            children: [
                              // Bell Image (Left Side)
                              Container(
                                width: 25, // Adjust size as needed
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/icons/bell.png', // Bell Image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              SizedBox(
                                  width:
                                      8), // Space between bell and panda image

                              // Panda Image (Right Side)
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(45),
                                  child: Image.asset(
                                    'assets/icons/panda.jpg', // Panda Image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Points Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF80AF81),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Current',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.asset(
                                    'assets/icons/schedule.png',
                                    width: 21,
                                    height: 21,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              '25',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'POINTS',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              '2.50\$',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 100,
                              child: LineChart(
                                LineChartData(
                                  gridData: FlGridData(show: false),
                                  titlesData: FlTitlesData(
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 40,
                                        getTitlesWidget: (value, meta) {
                                          const style = TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          );
                                          String text;
                                          if (value == 1000)
                                            text = '1000';
                                          else if (value == 2000)
                                            text = '2000';
                                          else if (value == 3000)
                                            text = '3000';
                                          else if (value == 4000)
                                            text = '4000';
                                          else
                                            return Container();
                                          return Text(text, style: style);
                                        },
                                      ),
                                    ),
                                    topTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: (value, meta) {
                                          const style = TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          );
                                          String text;
                                          switch (value.toInt()) {
                                            case 0:
                                              text = 'Jan';
                                              break;
                                            case 1:
                                              text = 'Feb';
                                              break;
                                            case 2:
                                              text = 'Mar';
                                              break;
                                            case 3:
                                              text = 'Apr';
                                              break;
                                            case 4:
                                              text = 'Jun';
                                              break;
                                            case 5:
                                              text = 'July';
                                              break;
                                            default:
                                              text = '';
                                          }
                                          return Text(text, style: style);
                                        },
                                      ),
                                    ),
                                  ),
                                  borderData: FlBorderData(show: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: const [
                                        FlSpot(0, 1000),
                                        FlSpot(1, 2200),
                                        FlSpot(2, 1800),
                                        FlSpot(3, 2800),
                                        FlSpot(4, 2000),
                                        FlSpot(5, 3000),
                                      ],
                                      isCurved: true,
                                      color: Colors.white,
                                      barWidth: 2,
                                      isStrokeCapRound: true,
                                      dotData: FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                    ),
                                  ],
                                  minY: 0,
                                  maxY: 4000,
                                  lineTouchData: LineTouchData(enabled: false),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Action Buttons
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Handle pickup schedule tap
                                },
                                child: Container(
                                  width: 205, // Set width
                                  height: 63, // Set height
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF80AF81),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/schedule.png',
                                        width: 21,
                                        height: 21,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'Pickup Schedule',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Handle redeem points tap
                                },
                                child: Container(
                                  width: 205,
                                  height: 63,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF80AF81),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/redeem.png',
                                        width: 21,
                                        height: 21,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'Redeem Points',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Recent Activity
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Recent Activity',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF058B09),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RecentActivities()),
                                );
                              },
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Activity Items
                      _buildActivityItem(
                        icon: Icons.delete_outline,
                        title: 'Plastic Collection',
                        subtitle: '3.5 kg',
                        points: '+7 points',
                        time: '2 hours ago',
                        isPositive: true,
                      ),
                      _buildActivityItem(
                        icon: Icons.delete_outline,
                        title: 'Mental Collection',
                        subtitle: '2.5 kg',
                        points: '+10 points',
                        time: 'Yesterday',
                        isPositive: true,
                      ),
                      _buildActivityItem(
                        icon: Icons.redeem,
                        title: 'Point Redeemed',
                        subtitle: '5.00\$',
                        points: '-25 Points',
                        time: '2 days ago',
                        isPositive: false,
                      ),
                      _buildActivityItem(
                        icon: Icons.redeem,
                        title: 'Point Redeemed',
                        subtitle: '5.00\$',
                        points: '-25 Points',
                        time: '2 days ago',
                        isPositive: false,
                      ),
                      _buildActivityItem(
                        icon: Icons.redeem,
                        title: 'Point Redeemed',
                        subtitle: '5.00\$',
                        points: '-25 Points',
                        time: '2 days ago',
                        isPositive: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Navigation
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 'Home', true),
                  _buildNavItem(Icons.history, 'History', false),
                  _buildNavItem(Icons.people, 'Social', false),
                  _buildNavItem(Icons.person, 'Profile', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String points,
    required String time,
    required bool isPositive,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFECF8ED),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF80AF81),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                points,
                style: TextStyle(
                  color: isPositive ? const Color(0xFF80AF81) : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return GestureDetector(
      onTap: () {
        // Handle navigation tap
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFF80AF81) : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF80AF81) : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
