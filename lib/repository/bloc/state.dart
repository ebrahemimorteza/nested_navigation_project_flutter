
import 'package:equatable/equatable.dart';
import 'package:nashreasar/model/Category_model.dart';
/* state to category*/
abstract class Category_bloc_state extends Equatable{}
//وضعیت های مختلف و برای هر وضعیت یک کلاس

//وضعیت 1
class Category_bloc_state_loading extends Category_bloc_state{
  @override
  // TODO: implement props
  //لیستی از ابجکت ها از نوع پراپس
  //پراپ ها یعنی خصوصیلت یک کلاس
  //کلاس ایکیوتبل هر دفعه میاد نمونه های ساخت  شده از کلاس را بررسی میکنه که تفاوت هارو پیدا کنه اگه تفاوتی بود به یو ای اطلاع بده
  List<Object?> get props => [];

}
class Category_bloc_state_loaded extends Category_bloc_state{
final List<Category_model> category;
Category_bloc_state_loaded(this.category);
  @override
  // TODO: implement props
  List<Object?> get props => [category];

}
class Category_bloc_state_Error extends Category_bloc_state{
  final String error_text;
  Category_bloc_state_Error(this.error_text);

  @override
  // TODO: implement props
  List<Object?> get props => [error_text];

}
/* state to subcategory */
abstract class SubCategory_bloc_state extends Equatable{
}
 class SubCategory_bloc_state_loading extends SubCategory_bloc_state{
  @override
  // TODO: implement props
  List<Object?> get props => [];
 }
//  class SubCategory_bloc_state_loaded extends SubCategory_bloc_state{
//   final List<Sub_category_model> subCategory;
//   SubCategory_bloc_state_loaded(this.subCategory);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [subCategory];
// }
class SubCategory_bloc_state_error extends SubCategory_bloc_state{
  final String error_text;
  SubCategory_bloc_state_error(this.error_text);
  @override
  // TODO: implement props
  List<Object?> get props => [error_text];
}
/* state to package */
abstract class Package_bloc_state extends Equatable{
}
class Package_bloc_state_loading extends Package_bloc_state{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
// class Package_bloc_state_loaded extends Package_bloc_state{
//   final List<Package_model> package;
//   Package_bloc_state_loaded(this.package);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [package];
// }
class Package_bloc_state_error extends Package_bloc_state{
  final String error_text;
  Package_bloc_state_error(this.error_text);
  @override
  // TODO: implement props
  List<Object?> get props => [error_text];
}/* state to lesson */
abstract class Lesson_bloc_state extends Equatable{
}
class Lesson_bloc_state_loading extends Lesson_bloc_state{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
// class Lesson_bloc_state_loaded extends Lesson_bloc_state{
//   final List<Lesson_model> lesson;
//   Lesson_bloc_state_loaded(this.lesson);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [lesson];
// }
class Lesson_bloc_state_error extends Lesson_bloc_state{
  final String error_text;
  Lesson_bloc_state_error(this.error_text);
  @override
  // TODO: implement props
  List<Object?> get props => [error_text];
}/* state to reminder */
abstract class Reminder_bloc_state extends Equatable{
}
class Reminder_bloc_state_loading extends Reminder_bloc_state{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
// class Reminder_bloc_state_loaded extends Reminder_bloc_state{
//   final List<Reminder_model> reminder;
//   Reminder_bloc_state_loaded(this.reminder);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [reminder];
// }
class Reminder_bloc_state_error extends Reminder_bloc_state{
  final String error_text;
  Reminder_bloc_state_error(this.error_text);
  @override
  // TODO: implement props
  List<Object?> get props => [error_text];
}
/* state to cart*/
abstract class Cart_bloc_state extends Equatable{
}
class Cart_bloc_state_loading extends Cart_bloc_state{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
// class Cart_bloc_state_loaded extends Cart_bloc_state{
//
//   final List<Cart_model> cart;
//   Cart_bloc_state_loaded(this.cart);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [cart];
// }
class Cart_bloc_state_error extends Cart_bloc_state{
  final String error_text;
  Cart_bloc_state_error(this.error_text);
  @override
  // TODO: implement props
  List<Object?> get props => [error_text];
}
/* state to cart*/
abstract class GameAndHomework_bloc_state extends Equatable{
}
class GameAndHomework_bloc_state_loading extends GameAndHomework_bloc_state{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
// class GameAndHomework_bloc_state_loaded extends GameAndHomework_bloc_state{
//
//   final List<GameAndHomework_model> cart;
//   GameAndHomework_bloc_state_loaded(this.cart);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [cart];
// }
class GameAndHomework_bloc_state_error extends GameAndHomework_bloc_state{
  final String error_text;
  GameAndHomework_bloc_state_error(this.error_text);
  @override
  // TODO: implement props
  List<Object?> get props => [error_text];
}