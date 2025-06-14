import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nashreasar/model/Category_model.dart';
import 'package:nashreasar/repository/jjTools.dart';
import 'package:nashreasar/view/component_screen/MyString.dart';
import 'package:nashreasar/view/component_screen/storage_screen.dart';


class Repository {
  var box = GetStorage();
  //push to model category
  Future<List<Category_model>> getCategory() async {
    List<Category_model> category_list = [];
    // To get data I wrote an extension method bellow

    var params = "do=Category_Product.showCategoryAll&deviceType=phone";
    print(params);
    if (category_list.isEmpty) {
      await JJ().jjAjax(params).then((result) async {
        // print(result.toString());
        print("json");
        print(result);
        final json = jsonDecode(result);
        print(" 2222 ");
        print(json);
        if (json==400) {
          // JJ.jjToast(MyStrings.dr_warning);
        } else {
          for (var element in json) {
            category_list.add(Category_model.fromJson(element));
          }
        }
      });
    }

    return category_list;
  }
}
