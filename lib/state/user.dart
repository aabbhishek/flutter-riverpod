import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testriver/provider/api_handle.dart';

final UserListModelProvider = StateNotifierProvider((ref) => UserProvider([]));
