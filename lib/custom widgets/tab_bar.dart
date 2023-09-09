import 'package:flutter/material.dart';

class AppointmentWidget extends StatefulWidget {
  const AppointmentWidget({Key? key}) : super(key: key);

  @override
  _AppointmentWidgetState createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),),
        child: TabBar(indicator: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.blue
        ),
          controller: tabController,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 30),
          tabs: [
           Tab(child: Text("Mon", style: Theme.of(context).textTheme.titleMedium,)),
            Tab(child: Text("Tuesday", style: Theme.of(context).textTheme.titleMedium,)),
            Tab(child: Text("Wednesday", style: Theme.of(context).textTheme.titleMedium,)),
            Tab(child: Text("Thursday", style: Theme.of(context).textTheme.titleMedium,)),
            Tab(child: Text("Friday ", style: Theme.of(context).textTheme.titleMedium,)),




          ],
        ),

        ),
      );
  }

//   final totalSlots = 20;
//
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Wrap(
//           spacing: 20, // Adjust spacing as needed
//           runSpacing: 15, // Adjust run spacing as needed
//           children: List.generate(totalSlots, (index) {
//             final currentTime = TimeOfDay(hour: 22, minute: 0); // Start time
//             final time = currentTime.replacing(
//               hour: (currentTime.hour + index) % 24, // Wrap hours within 0-23 range
//             );
//
//             return GestureDetector(
//               onTap: () {
//                 // Implement slot selection logic here
//                 print('Selected slot: $time');
//               },
//               child: Container(
//                 width: 80, // Adjust width as needed
//                 height: 40, // Adjust height as needed
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryBlue, // Set your desired background color
//                   borderRadius: BorderRadius.circular(8), // Set your desired border radius
//                 ),
//                 child: Center(
//                   child: Text(
//                     time.format(context),
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14, // Adjust font size as needed
//                       color: Colors.white, // Set your desired text color
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }),
//         ),
//       ],
//     ),
//   );
// }
}