import 'package:equatable/equatable.dart';

abstract class Category_bloc_event extends Equatable{
  const Category_bloc_event();
}
/* event to category*/
class Category_bloc_event_loading extends Category_bloc_event{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
/*  event to subCategory */
abstract class SubCategory_bloc_event extends Equatable{
  const SubCategory_bloc_event();
}
class SubCategory_bloc_event_loading extends SubCategory_bloc_event{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
/*  event to package */
abstract class Package_bloc_event extends Equatable{
  const Package_bloc_event();
}
class Package_bloc_event_loading extends Package_bloc_event{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}/*  event to lesson */
abstract class Lesson_bloc_event extends Equatable{
  const Lesson_bloc_event();
}
class Lesson_bloc_event_loading extends Lesson_bloc_event{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}/*  event to reminder */
abstract class Reminder_bloc_event extends Equatable{
  const Reminder_bloc_event();
}
class Reminder_bloc_event_loading extends Reminder_bloc_event{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
/*  event to cart */
abstract class Cart_bloc_event extends Equatable{
  const Cart_bloc_event();
}
class Cart_bloc_event_loading extends Cart_bloc_event{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
/*  event to GameAndHomework */
abstract class GameAndHomework_bloc_event extends Equatable{
  const GameAndHomework_bloc_event();
}
class GameAndHomework_bloc_event_loading extends GameAndHomework_bloc_event{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

