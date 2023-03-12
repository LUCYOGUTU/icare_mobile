import 'package:flutter/material.dart';
import 'package:icare_mobile/application/api/api_services.dart';
import 'package:icare_mobile/application/core/colors.dart';
import 'package:icare_mobile/application/core/text_styles.dart';
import 'package:icare_mobile/domain/entities/appointment.dart';
import 'package:icare_mobile/domain/entities/doctor.dart';
import 'package:icare_mobile/domain/value_objects/app_strings.dart';
import 'package:icare_mobile/presentation/appointment/widgets/appointment_list_item_widget.dart';
import 'package:icare_mobile/presentation/core/zero_state_widget.dart';

class UpcomingAppointmentsPage extends StatefulWidget {
  const UpcomingAppointmentsPage({super.key});

  @override
  State<UpcomingAppointmentsPage> createState() =>
      _UpcomingAppointmentsPageState();
}

class _UpcomingAppointmentsPageState extends State<UpcomingAppointmentsPage> {
  Future<List<Appointment>>? _appointments;

  @override
  void initState() {
    super.initState();
    _appointments = getUpcomingAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  upcomingAppointmentsString,
                  style: boldSize18Text(AppColors.primaryColor),
                ),
                FutureBuilder(
                  future: _appointments,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.data!.isEmpty) {
                      return ZeroStateWidget(
                        text: 'No upcoming appointments',
                        onPressed: () => Navigator.of(context).pop(),
                      );
                    }

                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        var appointment = snapshot.data![index];

                        Future<List<Doctor>>? _doctors = getDoctors();
                        // traverse list

                        // TODO: implement doctor to output doctor name and profession rather than doctor id
                        return AppointmentListItemWidget(
                          id: appointment.id!,
                          doctorId: appointment.doctor!,
                          doctorFirstName: '${appointment.doctor}',
                          doctorLastName: '${appointment.doctor}',
                          doctorProfession: '${appointment.doctor}',
                          date: DateTime.tryParse(appointment.date!)!,
                          startTime: DateTime.parse(
                              '${appointment.date!} ${appointment.startTime!}'),
                          endTime: DateTime.parse(
                              '${appointment.date!} ${appointment.endTime!}'),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
