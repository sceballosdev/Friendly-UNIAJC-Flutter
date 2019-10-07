import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workshop_gdg_cali/src/pages/home/entities/pollution_entity.dart';
import 'package:workshop_gdg_cali/src/pages/home/entities/sale_entity.dart';
import 'package:workshop_gdg_cali/src/pages/home/entities/task_entity.dart';
import 'package:workshop_gdg_cali/src/pages/home/widgets/chart_bar.dart';
import 'package:workshop_gdg_cali/src/pages/home/widgets/chart_line.dart';
import 'package:workshop_gdg_cali/src/pages/home/widgets/chart_pie.dart';
import 'package:workshop_gdg_cali/src/pages/styles/colors.dart';
import 'package:workshop_gdg_cali/src/pages/utils/local_storage_service.dart';
import 'package:workshop_gdg_cali/src/pages/utils/locator.dart';
import 'package:workshop_gdg_cali/src/pages/widgets/navigation_drawer.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _localStorageService = locator<LocalStorageService>();

  final List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
    Tab(icon: Icon(FontAwesomeIcons.chartPie)),
    Tab(icon: Icon(FontAwesomeIcons.chartLine)),
  ];

  TabController _tabController;

  List<charts.Series<PollutionEntity, String>> _seriesData;
  List<charts.Series<TaskEntity, String>> _seriesPieData;
  List<charts.Series<SaleEntity, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      PollutionEntity(year: 1980, place: 'USA', quantity: 30),
      PollutionEntity(year: 1980, place: 'Asia', quantity: 40),
      PollutionEntity(year: 1980, place: 'Europe', quantity: 10),
    ];
    var data2 = [
      PollutionEntity(year: 1985, place: 'USA', quantity: 100),
      PollutionEntity(year: 1980, place: 'Asia', quantity: 150),
      PollutionEntity(year: 1985, place: 'Europe', quantity: 80),
    ];
    var data3 = [
      PollutionEntity(year: 1985, place: 'USA', quantity: 200),
      PollutionEntity(year: 1980, place: 'Asia', quantity: 300),
      PollutionEntity(year: 1985, place: 'Europe', quantity: 100),
    ];

    var piedata = [
      TaskEntity(task: 'Work', taskvalue: 35.8, colorval: Color(0xff3366cc)),
      TaskEntity(task: 'Eat', taskvalue: 8.3, colorval: Color(0xff990099)),
      TaskEntity(task: 'Commute', taskvalue: 10.8, colorval: Color(0xff109618)),
      TaskEntity(task: 'TV', taskvalue: 15.6, colorval: Color(0xfffdbe19)),
      TaskEntity(task: 'Sleep', taskvalue: 19.2, colorval: Color(0xffff9900)),
      TaskEntity(task: 'Other', taskvalue: 10.3, colorval: Color(0xffdc3912)),
    ];

    var linesalesdata = [
      SaleEntity(yearval: 0, salesval: 45),
      SaleEntity(yearval: 1, salesval: 56),
      SaleEntity(yearval: 2, salesval: 55),
      SaleEntity(yearval: 3, salesval: 60),
      SaleEntity(yearval: 4, salesval: 61),
      SaleEntity(yearval: 5, salesval: 70),
    ];
    var linesalesdata1 = [
      SaleEntity(yearval: 0, salesval: 35),
      SaleEntity(yearval: 1, salesval: 46),
      SaleEntity(yearval: 2, salesval: 45),
      SaleEntity(yearval: 3, salesval: 50),
      SaleEntity(yearval: 4, salesval: 51),
      SaleEntity(yearval: 5, salesval: 60),
    ];

    var linesalesdata2 = [
      SaleEntity(yearval: 0, salesval: 20),
      SaleEntity(yearval: 1, salesval: 24),
      SaleEntity(yearval: 2, salesval: 25),
      SaleEntity(yearval: 3, salesval: 40),
      SaleEntity(yearval: 4, salesval: 45),
      SaleEntity(yearval: 5, salesval: 60),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (PollutionEntity pollution, _) => pollution.place,
        measureFn: (PollutionEntity pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (PollutionEntity pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (PollutionEntity pollution, _) => pollution.place,
        measureFn: (PollutionEntity pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (PollutionEntity pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (PollutionEntity pollution, _) => pollution.place,
        measureFn: (PollutionEntity pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (PollutionEntity pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (TaskEntity task, _) => task.task,
        measureFn: (TaskEntity task, _) => task.taskvalue,
        colorFn: (TaskEntity task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (TaskEntity row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (SaleEntity sales, _) => sales.yearval,
        measureFn: (SaleEntity sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (SaleEntity sales, _) => sales.yearval,
        measureFn: (SaleEntity sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (SaleEntity sales, _) => sales.yearval,
        measureFn: (SaleEntity sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    _seriesData = List<charts.Series<PollutionEntity, String>>();
    _seriesPieData = List<charts.Series<TaskEntity, String>>();
    _seriesLineData = List<charts.Series<SaleEntity, int>>();
    _generateData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Color(0xff308e1c),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: gradientEnd,
            tabs: myTabs,
          ),
          title: Text('Friendly UNIAJC'),
        ),
        drawer: NavigationDrawer(
            email: _localStorageService.email,
            fullname: _localStorageService.fullname,
            photoURL: _localStorageService.photoURL),
        body: TabBarView(
          controller: _tabController,
          children: [
            ChartBar(seriesData: _seriesData),
            ChartPie(seriesPieData: _seriesPieData),
            ChartLine(seriesLineData: _seriesLineData),
          ],
        ));
  }
}
