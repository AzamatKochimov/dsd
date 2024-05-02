import 'package:flutter_riverpod/flutter_riverpod.dart';

final attachmentIdsProvider = StateNotifierProvider<AttachmentNotifier, List<int>>((ref) => AttachmentNotifier());

class AttachmentNotifier extends StateNotifier<List<int>>{
  AttachmentNotifier() : super([]);

  void addAttachmentId(int id){
    state = [...state, id];
  }
}