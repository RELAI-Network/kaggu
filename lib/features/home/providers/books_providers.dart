import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaggu/core/features/local_storage/providers/app_local_setting_provider.dart';
import 'package:kaggu/core/features/local_storage/providers/local_storage_provider.dart';

import '../models/local_book_model.dart';

final booksProvider =
    ChangeNotifierProvider<AppLocalSettingProvider<List<LocalBookModel>>>(
  (ref) => AppLocalSettingProvider(
    ref.watch(localStorageProvider),
    defaultValue: <LocalBookModel>[],
    fromStorage: (json) {
      final map = jsonDecode(json) as List<dynamic>;

      return map
          .map(
            (e) => LocalBookModel.fromMap(
              (e is String ? jsonDecode(e) : e) as Map<String, dynamic>,
            ),
          )
          .toList();
    },
    localKey: '___books___',
    toStorage: jsonEncode,
  ),
);
