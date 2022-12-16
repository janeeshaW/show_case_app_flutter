import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../models/grid_services.dart';
import '../resources/Images_repo.dart';
import '../resources/app_colors.dart';
import '../resources/string_values.dart';
import '../resources/styles.dart';

class CustomGridView extends StatelessWidget {
  final List<Services>? servicesList;
  final Function(String) onItemTapped;
  const CustomGridView({Key? key, this.servicesList, required this.onItemTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Services> _servicesList = servicesList ?? [];
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        children: _servicesList.map((item) => renderCard(item, onItemTapped, context)).toList(),
      ),
    );
  }

  Widget renderCard(Services services, Function(String) onPressed, BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed(services.name);
      },
      child: Padding(
        padding: EdgeInsets.all(1.w),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.h),
          ),
          elevation: 3,
          child: Container(
            padding: EdgeInsets.all(1.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image(
                    width: 7.h,
                    height: 7.h,
                    image: AssetImage(getCardImage(services.name)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    services.name,
                    style: Styles.normalTextStyle(8.sp, AppColors.primaryColor),
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  String getCardImage(String name) {
    String url = "";
    switch (name) {
      case StringValues.lblTileImageSlider:
        url = ImagesRepo.windScreen;
        break;
      case StringValues.lblTileCustomPainter:
        url = ImagesRepo.windScreen;
        break;
      case StringValues.lblTileImagePicker:
        url = ImagesRepo.windScreen;
        break;
      case StringValues.lblTileAnimation:
        url = ImagesRepo.windScreen;
        break;
      case StringValues.lblTileBiometric:
        url = ImagesRepo.windScreen;
        break;
      case StringValues.lblTileDrawer:
        url = ImagesRepo.windScreen;
        break;
      case StringValues.lblBottomNavigation:
        url = ImagesRepo.windScreen;
        break;
      case StringValues.lblAnimatedBottomNavigation:
        url = ImagesRepo.windScreen;
        break;
      case StringValues.lblScrollBottomNavigation:
        url = ImagesRepo.windScreen;
        break;
      case StringValues.lblFancyBottomNavigation:
        url = ImagesRepo.windScreen;
        break;
      // case StringValues.lbl_tile_infringements:
      //   url = ImagesRepo.infringements;
      //   break;
      // case StringValues.lbl_tile_fuel_card:
      //   url = ImagesRepo.fuelCard;
      //   break;
      // case StringValues.lbl_tile_registration:
      //   url = ImagesRepo.registration;
      //   break;
      // case StringValues.lbl_tile_replacement_vehicle:
      //   url = ImagesRepo.vehicleReplacement;
      //   break;
      // case StringValues.lbl_tile_telematics:
      //   url = ImagesRepo.telematics;
      //   break;
      // case StringValues.lbl_tile_ruc:
      //   url = ImagesRepo.ruc;
      //   break;
      // case StringValues.lbl_tile_service:
      //   url = ImagesRepo.service;
      //   break;
      // case StringValues.lbl_tile_cof:
      // case StringValues.lbl_tile_wof:
      //   url = ImagesRepo.wof;
      //   break;
      // case StringValues.lbl_tile_tyres:
      //   url = ImagesRepo.tyres;
      //   break;
      // case StringValues.lbl_tile_fbt:
      //   url = ImagesRepo.fbt;
      //   break;
      // case StringValues.lbl_tile_tolls:
      //   url = ImagesRepo.tolls;
      //   break;
      // case StringValues.lbl_tile_24_hour_assistance:
      //   url = ImagesRepo.assistance24Hour;
      //   break;
      // case StringValues.lbl_tile_accident:
      //   url = ImagesRepo.accident;
      //   break;
      // case StringValues.lbl_tile_inspect:
      //   url = ImagesRepo.inspect;
      //   break;
      // case StringValues.lbl_title_loner:
      //   url = ImagesRepo.loner_mobile;
      //   break;
    }
    return url;
  }
}