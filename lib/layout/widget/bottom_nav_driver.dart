import 'package:bikeke_app/cubit/index_cubit.dart';
import 'package:bikeke_app/design/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBarDriver extends StatelessWidget {
  const BottomNavBarDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IndexCubit>(
      create: (context) => IndexCubit(),
      child: BlocBuilder<IndexCubit, IndexState>(
        builder: (context, state) {
          return Container(
            color: AppColor().backgroundColor(),
            child: SalomonBottomBar(
              currentIndex: state.indexValue,
              selectedItemColor: Colors.black,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              unselectedItemColor: Colors.black.withOpacity(0.5),
              onTap: (index) {
                BlocProvider.of<IndexCubit>(context).changeIndex(index);
              },
              items: [
                SalomonBottomBarItem(
                    icon: Icon(
                      FontAwesomeIcons.house,
                      size: 18,
                    ),
                    title: Text('Home')),
                SalomonBottomBarItem(
                    icon: Icon(
                      FontAwesomeIcons.circleDollarToSlot,
                      size: 18,
                    ),
                    title: Text('Earn')),
                SalomonBottomBarItem(
                    icon: Icon(
                      FontAwesomeIcons.clipboard,
                      size: 18,
                    ),
                    title: Text('Plan')),
                SalomonBottomBarItem(
                    icon: Icon(
                      FontAwesomeIcons.bars,
                      size: 18,
                    ),
                    title: Text('Menu')),
              ],
            ),
          );
        },
      ),
    );
  }
}
