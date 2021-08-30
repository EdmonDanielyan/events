import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/personnel_movements/personnel_movements_cubit.dart';
import 'package:ink_mobile/cubit/personnel_movements/personnel_movements_state.dart';
import 'package:ink_mobile/screens/personnel_movements/components/personnel_movement.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key
  }) : super(key: key);

  static const String TITLE = 'Кадровые перемещения';
  static const String OLD_POSITION = 'СТАРАЯ';
  static const String NEW_POSITION = 'НОВАЯ';
  static const String NO_MOVEMENTS = 'Кадровые перемещения отсутствуют';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonnelMovementsCubit, PersonnelMovementsState>(
        builder: (context, state) {
          final PersonnelMovementsCubit personnelMovementCubit =
            BlocProvider.of<PersonnelMovementsCubit>(context);

          switch (state.type) {
            case PersonnelMovementsStateType.LOADED: {
              List<Widget> personnelMovements = [];

              state.data?.asMap().forEach((index, movement) {
                PersonnelMovementLabel? label;

                /* Если это не первая должность, показываем что она "Новая" */

                if (state.data!.length >= 2 && index == 0) {
                  label = PersonnelMovementLabel(
                      background: Color(0x502B5E4A),
                      color: Theme.of(context).primaryColor,
                      title: NEW_POSITION
                  );
                }

                /* Предыдущей должности показываем что она "Старая" */
                if (index == 1) {
                  label = PersonnelMovementLabel(
                      background: Color(0x50D75F50),
                      color: Color(0xFFD75F50),
                      title: OLD_POSITION
                  );
                }

                personnelMovements.add(
                  PersonnelMovement(
                      label: label,
                      movement: movement
                  ),
                );
              });

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Color(0xFFE5E5E5)
                          ),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                            TITLE,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight:
                                FontWeight.bold
                            )
                        ),
                      ),
                    ),
                    Column(
                      children: personnelMovements,
                    ),
                    SizedBox(height: 30)
                  ],
                ),
              );
            }

            case PersonnelMovementsStateType.LOADING: {
              personnelMovementCubit.load();
              return InkPageLoader();
            }

            case PersonnelMovementsStateType.ERROR: {
              return ErrorRefreshButton(
                onTap: personnelMovementCubit.refresh,
                text: state.errorMessage!,
              );
            }

            case PersonnelMovementsStateType.EMPTY: {
              return Center(
                child: Text(NO_MOVEMENTS),
              );
            }
          }
        }
    );
  }
}
