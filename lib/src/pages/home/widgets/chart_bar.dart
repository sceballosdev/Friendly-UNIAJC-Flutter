import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:workshop_gdg_cali/src/pages/home/entities/pollution_entity.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    Key key,
    @required this.seriesData,
  }) : super(key: key);

  final List<charts.Series<PollutionEntity, String>> seriesData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Usuarios logueados por día de esta semana',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: charts.BarChart(
                  seriesData,
                  animate: true,
                  barGroupingType: charts.BarGroupingType.grouped,
                  //behaviors: [charts.SeriesLegend()],
                  animationDuration: Duration(seconds: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
