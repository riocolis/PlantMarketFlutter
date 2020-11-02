import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransaction() async {
    ApiReturnValue<List<Transaction>> result =
        await TransactionServices.getTransaction();

    if (result.value != null) {
      emit(TransactionLoaded(transactions: result.value));
    } else {
      emit(TransactionLoadingFailed(result.message));
    }
  }

  Future<bool> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> result =
        await TransactionServices.submitTransaction(transaction);

    if (result.value != null) {
      emit(TransactionLoaded(
          transactions:
              (state as TransactionLoaded).transactions + [result.value]));
      return true;
    } else {
      return false;
    }
  }
}
