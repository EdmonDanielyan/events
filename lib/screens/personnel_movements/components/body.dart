import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/personnel_movements/personnel_movements_cubit.dart';
import 'package:ink_mobile/cubit/personnel_movements/personnel_movements_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/personnel_movements/components/personnel_movement.dart';

class Body extends StatelessWidget {
  final PersonnelMovementsCubit personnelMovementsCubit;
  const Body({Key? key, required this.personnelMovementsCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return BlocBuilder<PersonnelMovementsCubit, PersonnelMovementsState>(
      bloc: personnelMovementsCubit,
      builder: (context, state) {
        switch (state.type) {
          case PersonnelMovementsStateType.LOADED:
            {
              List<Widget> personnelMovements = [];

              state.data?.asMap().forEach((index, movement) {
                PersonnelMovementLabel? label;

                /* Если это не первая должность, показываем что она "Новая" */

                if (state.data!.length >= 2 && index == 0) {
                  label = PersonnelMovementLabel(
                      background: Color(0x502B5E4A),
                      color: Theme.of(context).primaryColor,
                      title: _strings.newPosition.toUpperCase());
                }

                /* Предыдущей должности показываем что она "Старая" */
                if (index == 1) {
                  label = PersonnelMovementLabel(
                      background: Color(0x50D75F50),
                      color: Color(0xFFD75F50),
                      title: _strings.oldPosition.toUpperCase());
                }

                personnelMovements.add(
                  PersonnelMovement(label: label, movement: movement),
                );
              });

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFE5E5E5)),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Text(_strings.staffMovements,
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(keepScrollOffset: false),
                      itemCount: personnelMovements.length,
                      itemBuilder: (BuildContext context, int index) =>
                          personnelMovements[index],
                    ),
                    SizedBox(height: 30)
                  ],
                ),
              );
            }

          case PersonnelMovementsStateType.LOADING:
            {
              personnelMovementsCubit.load();
              return InkPageLoader();
            }

          case PersonnelMovementsStateType.ERROR:
            {
              return ErrorRefreshButton(
                onTap: personnelMovementsCubit.refresh,
                text: state.errorMessage!,
              );
            }

          case PersonnelMovementsStateType.EMPTY:
            {
              return Center(
                child: Text(_strings.noStaffMovements),
              );
            }
        }
      },
    );
  }
}
