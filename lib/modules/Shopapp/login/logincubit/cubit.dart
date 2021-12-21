import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/Shopapp/login/logincubit/states.dart';

class Logincubit extends Cubit<LoginStates> {
  Logincubit() : super(LoginInitailStates());
  static Logincubit get(context) => BlocProvider.of(context);
}
