import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:workshop_gdg_cali/src/pages/home/entities/pollution_entity.dart';
import 'package:workshop_gdg_cali/src/pages/home/entities/task_entity.dart';

class ChartPie extends StatelessWidget {
  const ChartPie({
    Key key,
    @required this.seriesPieData,
  }) : super(key: key);

  final List<charts.Series<TaskEntity, String>> seriesPieData;

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
                'Zonas de cali mas concurridas',
                style: TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.PieChart(seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 1),
                    behaviors: [
                      charts.DatumLegend(
                        outsideJustification:
                        charts.OutsideJustification.endDrawArea,
                        horizontalFirst: false,
                        desiredMaxRows: 2,
                        cellPadding:
                        EdgeInsets.only(right: 4.0, bottom: 4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts
                                .MaterialPalette.purple.shadeDefault,
                            fontFamily: 'Georgia',
                            fontSize: 11),
                      )
                    ],
                    defaultRenderer: charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                              labelPosition:
                              charts.ArcLabelPosition.inside)
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
