import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProjectPieChart extends StatelessWidget {
  const ProjectPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
          fit: StackFit
              .loose, // -> Vai ter o minimo de espaço possivel (assim evitando que a stack estique)
          children: [
            PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    color: Theme.of(context).primaryColor,
                    value: 50,
                    title: "50h",
                    titleStyle: const TextStyle(
        
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                    showTitle: true
                  ),
                  PieChartSectionData(
                    color: Theme.of(context).primaryColorLight,
                    value: 150,
                    title: "150h",
                    titleStyle: const TextStyle(
        
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                    showTitle: true
                  ),
              
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "200h",
                style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ]),
    );
  }
}
