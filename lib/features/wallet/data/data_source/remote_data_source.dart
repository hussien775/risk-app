import 'package:dartz/dartz.dart';
import '../../../../core/remote_helper/remote_request.dart';
import '../../../user/data/data_source/local_data_source.dart';
import '../model/deposit_model.dart';
import '../model/wallet_model.dart';
import '../model/withdraw_model.dart';

class WalletRemoteDataSource {
  final UserLocalDataSource userLocalDataSource;

  WalletRemoteDataSource({required this.userLocalDataSource});

  Future<Unit> addWallet(WalletData wallet) async {
    await RemoteRequest.postData(
        path: "create_wallet",
         token:await userLocalDataSource.getCachedUser(),

        //token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmZjZWQ1NzY1ZGQ3NjZiNzM0ZGRjZWQ2ZTAyZWU2ZDM3MjYzMDUzYjZiNDgzM2UyNmU5ZjZmNmQ4ZDZhYjA3ZTgxMGQyMmNmMDhhZWFkNjMiLCJpYXQiOjE3MjgwNDEwNjAuMTM2OTc1LCJuYmYiOjE3MjgwNDEwNjAuMTM2OTc3LCJleHAiOjE3NTk1NzcwNjAuMTMxMjQ3LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.SfilBlo8MPpcnguXnLnd1gofGMXXqQp87Kw_6Bbd69BxUvf-eZ3-m082L-CJIkclDF2Q3_5TYfQewc45dSx4nPrkYucE9CZ_Tny96fQwpn75SN4b8RxQn7f_hZ9IkUJdL9nmv5JJdVSIlObytNcsUNEGj1v_jDw9SLpgtNfCdbfvKgujR42LYol1UvPahLn2PzFbQv5Efv1j-WyAYAqOpZhsJQ6DQl14CIdRRxWhfxSytEgwLXYYeC8Gdb491GJUmdmufeNSUPkfJqBfWjy5IrNW1Xsx86JNd6opyTEfbfX2TeFNWC-AFXmpAt4Lr4lITbaaoz2DiJ4nGxR1FvxDxbcbTFI6pPETgkQ8pB0UwI89qUDRD4Sbyn_vp1ryW-uPrr6fybwfwwEqm_x2sJ3I3xtyfj1xBrmtcA4hKfbbwlgpX6MFoSPOl1J0zwgSfOzXPEDQ5hyznA7uFIJh8xwsIKyl5bLhI-1kagMWEUz4iflGYrvHEvVMqsz3zAkTgdVe1ig7B4Nc7XKPu-cuK6Wo5miA2wQpQWvbcSHOnugrZp0vDOnrYptZZkzdT-FLC-ILSSljt5Yw4GV9dXVKL9KJr3RBQ_VHAEgaUXg-VyDUutKuB4FtC3w-45Nqq94fG47OSHEooKPy3z6CVWNlXzqiKtiyudBTp3PXcKm5LvBojVw",
        data: WalletData(
          riskRatio: wallet.riskRatio,
          name: wallet.name,
          cash: wallet.cash,
          total: wallet.total,
          spare: wallet.spare,
          coin: wallet.coin,
          ratioSpare: wallet.ratioSpare,
          withdrawSumAmount: 0,
          shares: []
        ).toJson());
    return Future.value(unit);
  }

  Future<List<WalletData>> getWalletData() async {
    final response = await RemoteRequest.getData(
        url: "wallet",
          token:await userLocalDataSource.getCachedUser(),
        //token:"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmZjZWQ1NzY1ZGQ3NjZiNzM0ZGRjZWQ2ZTAyZWU2ZDM3MjYzMDUzYjZiNDgzM2UyNmU5ZjZmNmQ4ZDZhYjA3ZTgxMGQyMmNmMDhhZWFkNjMiLCJpYXQiOjE3MjgwNDEwNjAuMTM2OTc1LCJuYmYiOjE3MjgwNDEwNjAuMTM2OTc3LCJleHAiOjE3NTk1NzcwNjAuMTMxMjQ3LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.SfilBlo8MPpcnguXnLnd1gofGMXXqQp87Kw_6Bbd69BxUvf-eZ3-m082L-CJIkclDF2Q3_5TYfQewc45dSx4nPrkYucE9CZ_Tny96fQwpn75SN4b8RxQn7f_hZ9IkUJdL9nmv5JJdVSIlObytNcsUNEGj1v_jDw9SLpgtNfCdbfvKgujR42LYol1UvPahLn2PzFbQv5Efv1j-WyAYAqOpZhsJQ6DQl14CIdRRxWhfxSytEgwLXYYeC8Gdb491GJUmdmufeNSUPkfJqBfWjy5IrNW1Xsx86JNd6opyTEfbfX2TeFNWC-AFXmpAt4Lr4lITbaaoz2DiJ4nGxR1FvxDxbcbTFI6pPETgkQ8pB0UwI89qUDRD4Sbyn_vp1ryW-uPrr6fybwfwwEqm_x2sJ3I3xtyfj1xBrmtcA4hKfbbwlgpX6MFoSPOl1J0zwgSfOzXPEDQ5hyznA7uFIJh8xwsIKyl5bLhI-1kagMWEUz4iflGYrvHEvVMqsz3zAkTgdVe1ig7B4Nc7XKPu-cuK6Wo5miA2wQpQWvbcSHOnugrZp0vDOnrYptZZkzdT-FLC-ILSSljt5Yw4GV9dXVKL9KJr3RBQ_VHAEgaUXg-VyDUutKuB4FtC3w-45Nqq94fG47OSHEooKPy3z6CVWNlXzqiKtiyudBTp3PXcKm5LvBojVw"
    );

    return WalletData.fromJsonList(response.data);
  }

  Future<List<DepositData>> getDepositData(int idWallet) async {
    final response = await RemoteRequest.getData(
        url: "depositRecord?wallet_id=$idWallet",
           token:await userLocalDataSource.getCachedUser()

    //    token:"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmZjZWQ1NzY1ZGQ3NjZiNzM0ZGRjZWQ2ZTAyZWU2ZDM3MjYzMDUzYjZiNDgzM2UyNmU5ZjZmNmQ4ZDZhYjA3ZTgxMGQyMmNmMDhhZWFkNjMiLCJpYXQiOjE3MjgwNDEwNjAuMTM2OTc1LCJuYmYiOjE3MjgwNDEwNjAuMTM2OTc3LCJleHAiOjE3NTk1NzcwNjAuMTMxMjQ3LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.SfilBlo8MPpcnguXnLnd1gofGMXXqQp87Kw_6Bbd69BxUvf-eZ3-m082L-CJIkclDF2Q3_5TYfQewc45dSx4nPrkYucE9CZ_Tny96fQwpn75SN4b8RxQn7f_hZ9IkUJdL9nmv5JJdVSIlObytNcsUNEGj1v_jDw9SLpgtNfCdbfvKgujR42LYol1UvPahLn2PzFbQv5Efv1j-WyAYAqOpZhsJQ6DQl14CIdRRxWhfxSytEgwLXYYeC8Gdb491GJUmdmufeNSUPkfJqBfWjy5IrNW1Xsx86JNd6opyTEfbfX2TeFNWC-AFXmpAt4Lr4lITbaaoz2DiJ4nGxR1FvxDxbcbTFI6pPETgkQ8pB0UwI89qUDRD4Sbyn_vp1ryW-uPrr6fybwfwwEqm_x2sJ3I3xtyfj1xBrmtcA4hKfbbwlgpX6MFoSPOl1J0zwgSfOzXPEDQ5hyznA7uFIJh8xwsIKyl5bLhI-1kagMWEUz4iflGYrvHEvVMqsz3zAkTgdVe1ig7B4Nc7XKPu-cuK6Wo5miA2wQpQWvbcSHOnugrZp0vDOnrYptZZkzdT-FLC-ILSSljt5Yw4GV9dXVKL9KJr3RBQ_VHAEgaUXg-VyDUutKuB4FtC3w-45Nqq94fG47OSHEooKPy3z6CVWNlXzqiKtiyudBTp3PXcKm5LvBojVw"
    );
    return DepositData.fromJsonDepositList(response.data);
  }

  Future<List<WithdrawData>> getWithdrawData(int idWallet) async {
    final response = await RemoteRequest.getData(
        url: "withdrawRecord?wallet_id=$idWallet",
         token:await userLocalDataSource.getCachedUser()

      //  token:"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmZjZWQ1NzY1ZGQ3NjZiNzM0ZGRjZWQ2ZTAyZWU2ZDM3MjYzMDUzYjZiNDgzM2UyNmU5ZjZmNmQ4ZDZhYjA3ZTgxMGQyMmNmMDhhZWFkNjMiLCJpYXQiOjE3MjgwNDEwNjAuMTM2OTc1LCJuYmYiOjE3MjgwNDEwNjAuMTM2OTc3LCJleHAiOjE3NTk1NzcwNjAuMTMxMjQ3LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.SfilBlo8MPpcnguXnLnd1gofGMXXqQp87Kw_6Bbd69BxUvf-eZ3-m082L-CJIkclDF2Q3_5TYfQewc45dSx4nPrkYucE9CZ_Tny96fQwpn75SN4b8RxQn7f_hZ9IkUJdL9nmv5JJdVSIlObytNcsUNEGj1v_jDw9SLpgtNfCdbfvKgujR42LYol1UvPahLn2PzFbQv5Efv1j-WyAYAqOpZhsJQ6DQl14CIdRRxWhfxSytEgwLXYYeC8Gdb491GJUmdmufeNSUPkfJqBfWjy5IrNW1Xsx86JNd6opyTEfbfX2TeFNWC-AFXmpAt4Lr4lITbaaoz2DiJ4nGxR1FvxDxbcbTFI6pPETgkQ8pB0UwI89qUDRD4Sbyn_vp1ryW-uPrr6fybwfwwEqm_x2sJ3I3xtyfj1xBrmtcA4hKfbbwlgpX6MFoSPOl1J0zwgSfOzXPEDQ5hyznA7uFIJh8xwsIKyl5bLhI-1kagMWEUz4iflGYrvHEvVMqsz3zAkTgdVe1ig7B4Nc7XKPu-cuK6Wo5miA2wQpQWvbcSHOnugrZp0vDOnrYptZZkzdT-FLC-ILSSljt5Yw4GV9dXVKL9KJr3RBQ_VHAEgaUXg-VyDUutKuB4FtC3w-45Nqq94fG47OSHEooKPy3z6CVWNlXzqiKtiyudBTp3PXcKm5LvBojVw");
    );
    return WithdrawData.fromJsonWithdrawList(response.data);
  }

  Future<Unit> addDeposit(DepositData deposit) async {
    await RemoteRequest.postData(
        path: "addDeposit",
         token:await userLocalDataSource.getCachedUser(),

       // token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmZjZWQ1NzY1ZGQ3NjZiNzM0ZGRjZWQ2ZTAyZWU2ZDM3MjYzMDUzYjZiNDgzM2UyNmU5ZjZmNmQ4ZDZhYjA3ZTgxMGQyMmNmMDhhZWFkNjMiLCJpYXQiOjE3MjgwNDEwNjAuMTM2OTc1LCJuYmYiOjE3MjgwNDEwNjAuMTM2OTc3LCJleHAiOjE3NTk1NzcwNjAuMTMxMjQ3LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.SfilBlo8MPpcnguXnLnd1gofGMXXqQp87Kw_6Bbd69BxUvf-eZ3-m082L-CJIkclDF2Q3_5TYfQewc45dSx4nPrkYucE9CZ_Tny96fQwpn75SN4b8RxQn7f_hZ9IkUJdL9nmv5JJdVSIlObytNcsUNEGj1v_jDw9SLpgtNfCdbfvKgujR42LYol1UvPahLn2PzFbQv5Efv1j-WyAYAqOpZhsJQ6DQl14CIdRRxWhfxSytEgwLXYYeC8Gdb491GJUmdmufeNSUPkfJqBfWjy5IrNW1Xsx86JNd6opyTEfbfX2TeFNWC-AFXmpAt4Lr4lITbaaoz2DiJ4nGxR1FvxDxbcbTFI6pPETgkQ8pB0UwI89qUDRD4Sbyn_vp1ryW-uPrr6fybwfwwEqm_x2sJ3I3xtyfj1xBrmtcA4hKfbbwlgpX6MFoSPOl1J0zwgSfOzXPEDQ5hyznA7uFIJh8xwsIKyl5bLhI-1kagMWEUz4iflGYrvHEvVMqsz3zAkTgdVe1ig7B4Nc7XKPu-cuK6Wo5miA2wQpQWvbcSHOnugrZp0vDOnrYptZZkzdT-FLC-ILSSljt5Yw4GV9dXVKL9KJr3RBQ_VHAEgaUXg-VyDUutKuB4FtC3w-45Nqq94fG47OSHEooKPy3z6CVWNlXzqiKtiyudBTp3PXcKm5LvBojVw",
        data: DepositData(
                idWallet: deposit.idWallet,
                amount: deposit.amount,
                id: deposit.id)
            .toJson());
    return Future.value(unit);
  }

  Future<Unit> addWithdraw(WithdrawData withdraw) async {
    await RemoteRequest.postData(
        path: "addWithdraw",
          token:await userLocalDataSource.getCachedUser(),

        //token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmZjZWQ1NzY1ZGQ3NjZiNzM0ZGRjZWQ2ZTAyZWU2ZDM3MjYzMDUzYjZiNDgzM2UyNmU5ZjZmNmQ4ZDZhYjA3ZTgxMGQyMmNmMDhhZWFkNjMiLCJpYXQiOjE3MjgwNDEwNjAuMTM2OTc1LCJuYmYiOjE3MjgwNDEwNjAuMTM2OTc3LCJleHAiOjE3NTk1NzcwNjAuMTMxMjQ3LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.SfilBlo8MPpcnguXnLnd1gofGMXXqQp87Kw_6Bbd69BxUvf-eZ3-m082L-CJIkclDF2Q3_5TYfQewc45dSx4nPrkYucE9CZ_Tny96fQwpn75SN4b8RxQn7f_hZ9IkUJdL9nmv5JJdVSIlObytNcsUNEGj1v_jDw9SLpgtNfCdbfvKgujR42LYol1UvPahLn2PzFbQv5Efv1j-WyAYAqOpZhsJQ6DQl14CIdRRxWhfxSytEgwLXYYeC8Gdb491GJUmdmufeNSUPkfJqBfWjy5IrNW1Xsx86JNd6opyTEfbfX2TeFNWC-AFXmpAt4Lr4lITbaaoz2DiJ4nGxR1FvxDxbcbTFI6pPETgkQ8pB0UwI89qUDRD4Sbyn_vp1ryW-uPrr6fybwfwwEqm_x2sJ3I3xtyfj1xBrmtcA4hKfbbwlgpX6MFoSPOl1J0zwgSfOzXPEDQ5hyznA7uFIJh8xwsIKyl5bLhI-1kagMWEUz4iflGYrvHEvVMqsz3zAkTgdVe1ig7B4Nc7XKPu-cuK6Wo5miA2wQpQWvbcSHOnugrZp0vDOnrYptZZkzdT-FLC-ILSSljt5Yw4GV9dXVKL9KJr3RBQ_VHAEgaUXg-VyDUutKuB4FtC3w-45Nqq94fG47OSHEooKPy3z6CVWNlXzqiKtiyudBTp3PXcKm5LvBojVw",
        data: WithdrawData(
                idWallet: withdraw.idWallet,
                amount: withdraw.amount,
                id: withdraw.id,
                report: withdraw.report)
            .toJson());
    return Future.value(unit);
  }
}
