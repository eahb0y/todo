import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/theme/colors/app_colors.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/core/widget/loading/custom_loading.dart';
import 'package:todo/features/add_event/presentation/argument/add_event_argument.dart';
import 'package:todo/features/add_event/presentation/bloc/add_event_bloc.dart';
import 'package:todo/features/add_event/presentation/mixin/add_event_mixin.dart';
import 'package:todo/features/add_event/presentation/page/widget/text_field_widget.dart';
import 'package:todo/generated/l10n.dart';

class AddEventPage extends StatefulWidget {
  final AddEventArgument? argument;

  const AddEventPage({
    super.key,
    required this.argument,
  });

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> with AddEventMixin {
  @override
  void initState() {
    initController();
    if (widget.argument?.event != null) {
      context
          .read<AddEventBloc>()
          .add(GetEventDataCallEvent(eventId: widget.argument?.event?.id ?? 0));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddEventBloc, AddEventState>(
      listener: (context, state) {
        if (state.setValue &&
            ((state.selectedTime?.isNotEmpty ?? false) ||
                (state.event != null))) {
          setControllers(
            state.selectedTime ?? "",
            widget.argument?.event,
          );
        }
      },
      child: BlocBuilder<AddEventBloc, AddEventState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: AppUtils.kPaddingHor16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldWidget(
                    controller: eventName,
                    title: AppLocalization.current.event_name,
                    checkField: (eventName.text.isEmpty && state.onSubmit),
                  ),
                  AppUtils.kBoxHeight16,
                  TextFieldWidget(
                    controller: eventDesc,
                    title: AppLocalization.current.event_desc,
                    textFieldLines: 4,
                    checkField: (eventDesc.text.isEmpty && state.onSubmit),
                  ),
                  AppUtils.kBoxHeight16,
                  TextFieldWidget(
                    controller: eventPlace,
                    title: AppLocalization.current.event_location,
                    icon: Padding(
                      padding: AppUtils.kPaddingAll12,
                      child: SvgPicture.asset(
                        "assets/svg/ic_location.svg",
                      ),
                    ),
                    checkField: (eventPlace.text.isEmpty && state.onSubmit),
                  ),
                  AppUtils.kBoxHeight16,
                  ClipRRect(
                    borderRadius: AppUtils.kBorderRadius8,
                    child: ColoredBox(
                      color: AppColors.textField,
                      child: DropdownButton(
                          icon: Row(
                            children: [
                              AppUtils.kBoxWidth8,
                              SvgPicture.asset(
                                "assets/svg/ic_down.svg",
                                height: 28,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.lightBlue,
                                  BlendMode.srcIn,
                                ),
                              )
                            ],
                          ),
                          padding: AppUtils.kPaddingHor12,
                          borderRadius: AppUtils.kBorderRadius8,
                          value: state.selectedColor,
                          underline: const SizedBox(),
                          items: [
                            for (var color in [
                              0xFFf3d1c7,
                              0xFFf6e2c9,
                              0xFFc8e7f4
                            ])
                              DropdownMenuItem<int>(
                                value: color,
                                child: ColoredBox(
                                  color: Color(color),
                                  child: const SizedBox(
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                          ],
                          onChanged: (Object? color) {
                            context
                                .read<AddEventBloc>()
                                .add(SelectEventColorCallEvent(
                                  color: color,
                                ));
                          }),
                    ),
                  ),
                  AppUtils.kBoxHeight16,
                  TextFieldWidget(
                    onlyRead: true,
                    controller: eventTime,
                    title: AppLocalization.current.event_time,
                    onTap: () async {
                      var result = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (context.mounted) {
                        if (result != null) {
                          String selectedMinute = (result.minute < 9)
                              ? "0${result.minute}"
                              : "${result.minute}";
                          setTime("${result.hour}:$selectedMinute");
                          context.read<AddEventBloc>().add(
                                SelectEventTimeCallEvent(
                                    time: "${result.hour}:$selectedMinute"),
                              );
                        }
                      }
                    },
                    checkField: (eventTime.text.isEmpty && state.onSubmit),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: SafeArea(
                minimum: AppUtils.kPaddingL16R16B16,
                child: ElevatedButton(
                  onPressed: !state.isLoading
                      ? () {
                          context.read<AddEventBloc>().add(OnSubmitCallEvent(
                                eventDesc: eventDesc.text,
                                eventName: eventName.text,
                                eventLocation: eventPlace.text,
                                  date: widget.argument?.date ?? "",
                                  id: widget.argument?.event?.id ?? -1,
                                  isEdit: widget.argument?.isEditEvent ?? false,
                                ),
                              );
                        }
                      : null,
                  child: state.isLoading
                      ? const Center(
                          child: CustomLoadingWidget(),
                        )
                      : Text(AppLocalization.current.add),
                )),
          );
        },
      ),
    );
  }
}
