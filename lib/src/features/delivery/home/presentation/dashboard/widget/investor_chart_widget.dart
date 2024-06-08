import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';

class InvestorChartWidget extends StatefulWidget {
  const InvestorChartWidget({
    super.key,
    Color? gradientColor1,
    Color? gradientColor2,
    Color? gradientColor3,
    Color? indicatorStrokeColor,
  })  : gradientColor1 = gradientColor1 ?? AppColors.primaryColor,
        gradientColor2 = gradientColor2 ?? AppColors.secondaryColor,
        gradientColor3 = gradientColor3 ?? AppColors.alertError,
        indicatorStrokeColor = indicatorStrokeColor ?? AppColors.greyBackground;

  final Color gradientColor1;
  final Color gradientColor2;
  final Color gradientColor3;
  final Color indicatorStrokeColor;

  @override
  State<InvestorChartWidget> createState() => _InvestorChartWidgetState();
}

class _InvestorChartWidgetState extends State<InvestorChartWidget> {
  List<Color> gradientColors = [
    AppColors.bgGreyContainer,
    AppColors.primaryColor,
  ];

  List<int> showingTooltipOnSpots = [1, 2, 3, 4, 5, 6];
  String selectedOption = 'Week';

  List<FlSpot> get allSpots => const [
        FlSpot(0, 0),
        FlSpot(1, 2),
        FlSpot(2, 4),
        FlSpot(3, 5),
        FlSpot(4, 8),
        FlSpot(5, 10),
        FlSpot(6, 6),
      ];

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: true,
        shadow: const Shadow(
          blurRadius: 8,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.7)).toList(),
          ),
        ),
        dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: gradientColors,
        ),
        barWidth: 0,
        isStrokeCapRound: true,
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildSelectableItem('Week'),
                buildSelectableItem('Month'),
                buildSelectableItem('Year'),
              ],
            )),
        gapH10,
        AspectRatio(
          aspectRatio: 2.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 10,
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              return LineChart(
                LineChartData(
                  showingTooltipIndicators: showingTooltipOnSpots.map((index) {
                    return ShowingTooltipIndicators([
                      LineBarSpot(
                        tooltipsOnBar,
                        lineBarsData.indexOf(tooltipsOnBar),
                        tooltipsOnBar.spots[index],
                      ),
                    ]);
                  }).toList(),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    handleBuiltInTouches: false,
                    touchCallback:
                        (FlTouchEvent event, LineTouchResponse? response) {
                      if (response == null || response.lineBarSpots == null) {
                        return;
                      }
                      if (event is FlTapUpEvent) {
                        final spotIndex =
                            response.lineBarSpots!.first.spotIndex;
                        setState(() {
                          if (showingTooltipOnSpots.contains(spotIndex)) {
                            showingTooltipOnSpots.remove(spotIndex);
                          } else {
                            showingTooltipOnSpots.add(spotIndex);
                          }
                        });
                      }
                    },
                    mouseCursorResolver:
                        (FlTouchEvent event, LineTouchResponse? response) {
                      if (response == null || response.lineBarSpots == null) {
                        return SystemMouseCursors.basic;
                      }
                      return SystemMouseCursors.click;
                    },
                    getTouchedSpotIndicator:
                        (LineChartBarData barData, List<int> spotIndexes) {
                      return spotIndexes.map((index) {
                        return TouchedSpotIndicatorData(
                          FlLine(
                            strokeWidth: 1,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.primaryColor,
                                AppColors.bgGreen.withOpacity(.5),
                              ],
                            ),
                          ),
                          FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) =>
                                FlDotCirclePainter(
                              radius: 3,
                              color: AppColors.primaryColor,
                              strokeWidth: 0,
                              strokeColor: widget.indicatorStrokeColor,
                            ),
                          ),
                        );
                      }).toList();
                    },
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: AppColors.primaryColor,
                      tooltipPadding: const EdgeInsets.all(2),
                      tooltipRoundedRadius: 8,
                      getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                        return lineBarsSpot.map((lineBarSpot) {
                          return LineTooltipItem(
                            lineBarSpot.y.toString(),
                            const TextStyle(
                              color: Colors.white,
                              fontSize: 6,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: lineBarsData,
                  gridData: const FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    drawHorizontalLine: false,
                    horizontalInterval: 1,
                    verticalInterval: 2,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 18,
                        interval: 1,
                        getTitlesWidget: bottomTitleWidgets,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: leftTitleWidgets,
                        reservedSize: 42,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.lerp(
                        const Border(
                            left: BorderSide(
                              color: AppColors.blackColor,
                            ),
                            bottom: BorderSide(
                              color: AppColors.blackColor,
                            )),
                        const Border(
                            left: BorderSide(color: AppColors.blackColor),
                            bottom: BorderSide(
                              color: AppColors.blackColor,
                            )),
                        2),
                  ),
                  minX: 0,
                  maxX: 7,
                  minY: 0,
                  maxY: 12,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget buildSelectableItem(String option) {
    bool isSelected = selectedOption == option;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
            ),
          ),
        ),
        child: Text(
          option,
          style: TextStyle(
            color: isSelected ? AppColors.primaryColor : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 8,
    );
    Widget text;

    switch (value.toInt()) {
      case 1:
        text = const Text('Mon', style: style);
        break;
      case 2:
        text = const Text('Tue', style: style);
        break;
      case 3:
        text = const Text('Wed', style: style);
        break;
      case 4:
        text = const Text('Thu', style: style);
        break;
      case 5:
        text = const Text('Fri', style: style);
        break;
      case 6:
        text = const Text('Sat', style: style);
        break;
      case 7:
        text = const Text('Sun', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 8,
    );

    return Text(value.toInt().toString(),
        style: style, textAlign: TextAlign.left);
  }
}
