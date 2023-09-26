import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcare/Core/ColorHelper.dart';
import 'package:vcare/Features/Home%20Tab/View/Pages/home_tab.dart';
import 'package:vcare/Features/Home%20Tab/View/component/doctor_card.dart';
import 'package:vcare/Features/Home%20Tab/ViewModel/view%20more%20cubit/home_cubit.dart';
import 'package:vcare/Features/Home%20Tab/ViewModel/view%20more%20cubit/home_states.dart';
import 'package:vcare/Features/details_screen/view/pages/details_view.dart';

class ViewMore extends StatelessWidget {
  const ViewMore({super.key});
static const String routeName = 'view-more';
  @override
  Widget build(BuildContext context) {
    ViewMoreArgs arrg = ModalRoute.of(context)!.settings.arguments as ViewMoreArgs;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(arrg.specialization,style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: ColorHelper.mainColor,
      ),
      body: BlocProvider(
        create: (context) => ViewMoreCubit()..getData(arrg.id),
        child: BlocConsumer<ViewMoreCubit,ViewMoreState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if(state is ViewMoreLoading){
              return CircularProgressIndicator();
            }
            if(state is ViewMoreErrorState){
              return Text(state.message??"");
            }
            if(state is ViewMoreSuccessState){
              return GridView.builder(

                itemCount: state.homeTabResponse.data?.doctors?.length??0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //crossAxisSpacing: 20,
                    mainAxisExtent: 220
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width*.08,
                        vertical: 8),
                    child: DoctorCard(
                        degree: state.homeTabResponse.data?.doctors?[index].degree??"",
                        doctorName: state.homeTabResponse.data?.doctors?[index].name??""
                        , imagePath: state.homeTabResponse.data?.doctors?[index].photo??"",
                        onTap: (){
                          Navigator.of(context,rootNavigator: true).pushNamed(DetailsPage.routeName,
                            arguments: Arrgs(
                                doctorIndex: index,
                                doctor: state.homeTabResponse.data?.doctors??[])

                          );
                        }
                    ),
                  );
                },);
            }
            else{
              return Container();
            }

          },
        ),
      ),
    );
  }
}
