// widgets/dashboard_pie_chart.dart

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardPieChart extends StatelessWidget {
  final int totalCompleted;
  final int totalPending;
  final int totalOngoing;

  const DashboardPieChart({super.key,
    required this.totalCompleted,
    required this.totalPending,
    required this.totalOngoing,
  });

  @override
  Widget build(BuildContext context) {
    final total = totalCompleted + totalPending + totalOngoing;

    if (total == 0) {
      return Center(child: Text('No tasks available'));
    }

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: PieChart(
            PieChartData(
              sections: _getSections(),
              centerSpaceRadius: 30,
              sectionsSpace: 4,
              pieTouchData: PieTouchData(enabled: true),
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: _buildLegend(),
        ),
      ],
    );
  }

  List<PieChartSectionData> _getSections() {
    final total = totalCompleted + totalPending + totalOngoing;
    final List<PieChartSectionData> sections = [];

    if (totalCompleted > 0) {
      sections.add(
        PieChartSectionData(
          color: Colors.green,
          value: totalCompleted.toDouble(),
          title: '',
          radius: 50,
        ),
      );
    }

    if (totalPending > 0) {
      sections.add(
        PieChartSectionData(
          color: Colors.orange,
          value: totalPending.toDouble(),
          title: '',
          radius: 50,
        ),
      );
    }

    if (totalOngoing > 0) {
      sections.add(
        PieChartSectionData(
          color: Colors.blue,
          value: totalOngoing.toDouble(),
          title: '',
          radius: 50,
        ),
      );
    }

    return sections;
  }

  Widget _buildLegend() {
    final List<Widget> legendItems = [];

    if (totalCompleted > 0) {
      legendItems.add(_buildLegendItem(Colors.green, 'Completed', totalCompleted));
    }
    if (totalPending > 0) {
      legendItems.add(_buildLegendItem(Colors.orange, 'Pending', totalPending));
    }
    if (totalOngoing > 0) {
      legendItems.add(_buildLegendItem(Colors.blue, 'Ongoing', totalOngoing));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: legendItems,
    );
  }

  Widget _buildLegendItem(Color color, String title, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ),
          SizedBox(width: 8),
          Text(
            '$title: $value',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
