import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:workshop_gdg_cali/src/pages/home/entities/pollution_entity.dart';
import 'package:workshop_gdg_cali/src/pages/home/entities/sale_entity.dart';

class ChartLine extends StatelessWidget {
  const ChartLine({
    Key key,
    @required this.seriesLineData,
  }) : super(key: key);

  final List<charts.Series<SaleEntity, int>> seriesLineData;

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
                'Gráfica de lineas de prueba',
                style: TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: charts.LineChart(seriesLineData,
                    defaultRenderer: charts.LineRendererConfig(
                        includeArea: true, stacked: true),
                    animate: true,
                    animationDuration: Duration(seconds: 1),
                    behaviors: [
                      charts.ChartTitle('Years',
                          behaviorPosition:
                          charts.BehaviorPosition.bottom,
                          titleOutsideJustification: charts
                              .OutsideJustification.middleDrawArea),
                      charts.ChartTitle('Sales',
                          behaviorPosition:
                          charts.BehaviorPosition.start,
                          titleOutsideJustification: charts
                              .OutsideJustification.middleDrawArea),
                      charts.ChartTitle(
                        'Departments',
                        behaviorPosition: charts.BehaviorPosition.end,
                        titleOutsideJustification:
                        charts.OutsideJustification.middleDrawArea,
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
