import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:intl/intl.dart';

import '../../../../core/infrastructure/constants/app_sizes.dart';
import '../../../../core/presentation/themes/app_colors.dart';
import '../../../../core/presentation/widgets/common_textfield.dart';
import '../../../../core/presentation/widgets/toats.dart';

class CustomDateRangePickerDialog extends StatefulHookConsumerWidget {
  final Future<void> Function(List<FilterOptional> request, PaginatedRequest params) filterCallback;
  const CustomDateRangePickerDialog({
    super.key,
    required this.filterCallback,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomDateRangePickerDialog();
}

class _CustomDateRangePickerDialog extends ConsumerState<CustomDateRangePickerDialog> {
  DateTime _startDate = DateTime.now().subtract(const Duration(days: 7));
  DateTime _endDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ProgressHUD(
          barrierEnabled: true,
          borderWidth: 0,
          child: Builder(builder: (_) {
            return Dialog(
                child: SingleChildScrollView(
                    child: GestureDetector(
                        onTap: () => FocusScope.of(context).unfocus(),
                        child: Container(
                            decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () => _selectStartDate(context),
                                    child: CommonTextFormField(
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      hintText: context.locale.startDate,
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.text,
                                      isLabelRequired: true,
                                      isEnabled: false,
                                      hasLabel: true,
                                      controller: TextEditingController()..text = "${_startDate.toLocal()}".split(' ')[0],
                                      label: context.locale.startDate,
                                      obscureText: false,
                                    ),
                                  ),
                                  gapH20,
                                  InkWell(
                                    onTap: () => _selectEndDate(context),
                                    child: CommonTextFormField(
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      hintText: context.locale.endDate,
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.text,
                                      isLabelRequired: true,
                                      isEnabled: false,
                                      hasLabel: true,
                                      controller: TextEditingController()..text = "${_endDate.toLocal()}".split(' ')[0],
                                      label: context.locale.endDate,
                                      obscureText: false,
                                    ),
                                  ),
                                  gapH30,
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Close the dialog
                                          },
                                          child: Text(
                                            context.locale.deleteConfirmationCancel,
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: _endDate.isBefore(_startDate)
                                              ? null
                                              : () async {
                                                  if (_endDate.isBefore(_startDate)) {
                                                    return showErrorFlushbar(context, 'Invalids dates');
                                                  }
                                                  final formatter = DateFormat('dd/MM/yyyy');

                                                  final progress = ProgressHUD.of(_);
                                                  progress?.show();
                                                  await widget.filterCallback([
                                                    FilterOptional.fromJson(
                                                      {
                                                        "key": "dateCreate",
                                                        "value": formatter.format(_startDate),
                                                        "value1": formatter.format(_endDate),
                                                        "type": "BETWEEN"
                                                      },
                                                    ),
                                                  ], PaginatedRequest(size: 50)).whenComplete(() {
                                                    Navigator.of(context).pop(true);
                                                    progress?.dismiss();
                                                  });
                                                },
                                          child: Text(
                                            context.locale.submit,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )))));
          })),
    );
  }
}
