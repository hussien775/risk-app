import 'package:dartz/dartz.dart';

import '../../../../core/remote_helper/remote_request.dart';
import '../../../user/data/data_source/local_data_source.dart';
import '../model/pay_sell_data.dart';
import '../model/shares_data.dart';

class SharesRemoteDataSource{
  final UserLocalDataSource userLocalDataSource;

  SharesRemoteDataSource({required this.userLocalDataSource});


  Future<SharesData> getShareData(int idShare) async {
    final response = await RemoteRequest.getData(
        url: "share?share_id=$idShare",
        token:await userLocalDataSource.getCachedUser()
      //token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmZjZWQ1NzY1ZGQ3NjZiNzM0ZGRjZWQ2ZTAyZWU2ZDM3MjYzMDUzYjZiNDgzM2UyNmU5ZjZmNmQ4ZDZhYjA3ZTgxMGQyMmNmMDhhZWFkNjMiLCJpYXQiOjE3MjgwNDEwNjAuMTM2OTc1LCJuYmYiOjE3MjgwNDEwNjAuMTM2OTc3LCJleHAiOjE3NTk1NzcwNjAuMTMxMjQ3LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.SfilBlo8MPpcnguXnLnd1gofGMXXqQp87Kw_6Bbd69BxUvf-eZ3-m082L-CJIkclDF2Q3_5TYfQewc45dSx4nPrkYucE9CZ_Tny96fQwpn75SN4b8RxQn7f_hZ9IkUJdL9nmv5JJdVSIlObytNcsUNEGj1v_jDw9SLpgtNfCdbfvKgujR42LYol1UvPahLn2PzFbQv5Efv1j-WyAYAqOpZhsJQ6DQl14CIdRRxWhfxSytEgwLXYYeC8Gdb491GJUmdmufeNSUPkfJqBfWjy5IrNW1Xsx86JNd6opyTEfbfX2TeFNWC-AFXmpAt4Lr4lITbaaoz2DiJ4nGxR1FvxDxbcbTFI6pPETgkQ8pB0UwI89qUDRD4Sbyn_vp1ryW-uPrr6fybwfwwEqm_x2sJ3I3xtyfj1xBrmtcA4hKfbbwlgpX6MFoSPOl1J0zwgSfOzXPEDQ5hyznA7uFIJh8xwsIKyl5bLhI-1kagMWEUz4iflGYrvHEvVMqsz3zAkTgdVe1ig7B4Nc7XKPu-cuK6Wo5miA2wQpQWvbcSHOnugrZp0vDOnrYptZZkzdT-FLC-ILSSljt5Yw4GV9dXVKL9KJr3RBQ_VHAEgaUXg-VyDUutKuB4FtC3w-45Nqq94fG47OSHEooKPy3z6CVWNlXzqiKtiyudBTp3PXcKm5LvBojVw",

    );

    return SharesData.fromJson(response.data);
  }

  Future<List<PaySellData>> getPayData(int idShare) async {
    final response = await RemoteRequest.postData(
        path: "payRecord",
        token:await userLocalDataSource.getCachedUser(),
       // token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmZjZWQ1NzY1ZGQ3NjZiNzM0ZGRjZWQ2ZTAyZWU2ZDM3MjYzMDUzYjZiNDgzM2UyNmU5ZjZmNmQ4ZDZhYjA3ZTgxMGQyMmNmMDhhZWFkNjMiLCJpYXQiOjE3MjgwNDEwNjAuMTM2OTc1LCJuYmYiOjE3MjgwNDEwNjAuMTM2OTc3LCJleHAiOjE3NTk1NzcwNjAuMTMxMjQ3LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.SfilBlo8MPpcnguXnLnd1gofGMXXqQp87Kw_6Bbd69BxUvf-eZ3-m082L-CJIkclDF2Q3_5TYfQewc45dSx4nPrkYucE9CZ_Tny96fQwpn75SN4b8RxQn7f_hZ9IkUJdL9nmv5JJdVSIlObytNcsUNEGj1v_jDw9SLpgtNfCdbfvKgujR42LYol1UvPahLn2PzFbQv5Efv1j-WyAYAqOpZhsJQ6DQl14CIdRRxWhfxSytEgwLXYYeC8Gdb491GJUmdmufeNSUPkfJqBfWjy5IrNW1Xsx86JNd6opyTEfbfX2TeFNWC-AFXmpAt4Lr4lITbaaoz2DiJ4nGxR1FvxDxbcbTFI6pPETgkQ8pB0UwI89qUDRD4Sbyn_vp1ryW-uPrr6fybwfwwEqm_x2sJ3I3xtyfj1xBrmtcA4hKfbbwlgpX6MFoSPOl1J0zwgSfOzXPEDQ5hyznA7uFIJh8xwsIKyl5bLhI-1kagMWEUz4iflGYrvHEvVMqsz3zAkTgdVe1ig7B4Nc7XKPu-cuK6Wo5miA2wQpQWvbcSHOnugrZp0vDOnrYptZZkzdT-FLC-ILSSljt5Yw4GV9dXVKL9KJr3RBQ_VHAEgaUXg-VyDUutKuB4FtC3w-45Nqq94fG47OSHEooKPy3z6CVWNlXzqiKtiyudBTp3PXcKm5LvBojVw",

        data: {"share_id":idShare}
    );

    return PaySellData.fromJsonPaySellList(response.data);
  }

  Future<List<PaySellData>> getSellData(int idShare) async {
    final response = await RemoteRequest.postData(
        path: "sillRecord",
        token:await userLocalDataSource.getCachedUser(),
       // token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmZjZWQ1NzY1ZGQ3NjZiNzM0ZGRjZWQ2ZTAyZWU2ZDM3MjYzMDUzYjZiNDgzM2UyNmU5ZjZmNmQ4ZDZhYjA3ZTgxMGQyMmNmMDhhZWFkNjMiLCJpYXQiOjE3MjgwNDEwNjAuMTM2OTc1LCJuYmYiOjE3MjgwNDEwNjAuMTM2OTc3LCJleHAiOjE3NTk1NzcwNjAuMTMxMjQ3LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.SfilBlo8MPpcnguXnLnd1gofGMXXqQp87Kw_6Bbd69BxUvf-eZ3-m082L-CJIkclDF2Q3_5TYfQewc45dSx4nPrkYucE9CZ_Tny96fQwpn75SN4b8RxQn7f_hZ9IkUJdL9nmv5JJdVSIlObytNcsUNEGj1v_jDw9SLpgtNfCdbfvKgujR42LYol1UvPahLn2PzFbQv5Efv1j-WyAYAqOpZhsJQ6DQl14CIdRRxWhfxSytEgwLXYYeC8Gdb491GJUmdmufeNSUPkfJqBfWjy5IrNW1Xsx86JNd6opyTEfbfX2TeFNWC-AFXmpAt4Lr4lITbaaoz2DiJ4nGxR1FvxDxbcbTFI6pPETgkQ8pB0UwI89qUDRD4Sbyn_vp1ryW-uPrr6fybwfwwEqm_x2sJ3I3xtyfj1xBrmtcA4hKfbbwlgpX6MFoSPOl1J0zwgSfOzXPEDQ5hyznA7uFIJh8xwsIKyl5bLhI-1kagMWEUz4iflGYrvHEvVMqsz3zAkTgdVe1ig7B4Nc7XKPu-cuK6Wo5miA2wQpQWvbcSHOnugrZp0vDOnrYptZZkzdT-FLC-ILSSljt5Yw4GV9dXVKL9KJr3RBQ_VHAEgaUXg-VyDUutKuB4FtC3w-45Nqq94fG47OSHEooKPy3z6CVWNlXzqiKtiyudBTp3PXcKm5LvBojVw",

        data: {"share_id":idShare}
    );

    return PaySellData.fromJsonPaySellList(response.data);
  }

  Future<Unit> addBuyProcess(PaySellData buy) async {
   final respone= await RemoteRequest.postData(
        path: "addPayRecord",
        token:await userLocalDataSource.getCachedUser(),

        //   token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmZjZWQ1NzY1ZGQ3NjZiNzM0ZGRjZWQ2ZTAyZWU2ZDM3MjYzMDUzYjZiNDgzM2UyNmU5ZjZmNmQ4ZDZhYjA3ZTgxMGQyMmNmMDhhZWFkNjMiLCJpYXQiOjE3MjgwNDEwNjAuMTM2OTc1LCJuYmYiOjE3MjgwNDEwNjAuMTM2OTc3LCJleHAiOjE3NTk1NzcwNjAuMTMxMjQ3LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.SfilBlo8MPpcnguXnLnd1gofGMXXqQp87Kw_6Bbd69BxUvf-eZ3-m082L-CJIkclDF2Q3_5TYfQewc45dSx4nPrkYucE9CZ_Tny96fQwpn75SN4b8RxQn7f_hZ9IkUJdL9nmv5JJdVSIlObytNcsUNEGj1v_jDw9SLpgtNfCdbfvKgujR42LYol1UvPahLn2PzFbQv5Efv1j-WyAYAqOpZhsJQ6DQl14CIdRRxWhfxSytEgwLXYYeC8Gdb491GJUmdmufeNSUPkfJqBfWjy5IrNW1Xsx86JNd6opyTEfbfX2TeFNWC-AFXmpAt4Lr4lITbaaoz2DiJ4nGxR1FvxDxbcbTFI6pPETgkQ8pB0UwI89qUDRD4Sbyn_vp1ryW-uPrr6fybwfwwEqm_x2sJ3I3xtyfj1xBrmtcA4hKfbbwlgpX6MFoSPOl1J0zwgSfOzXPEDQ5hyznA7uFIJh8xwsIKyl5bLhI-1kagMWEUz4iflGYrvHEvVMqsz3zAkTgdVe1ig7B4Nc7XKPu-cuK6Wo5miA2wQpQWvbcSHOnugrZp0vDOnrYptZZkzdT-FLC-ILSSljt5Yw4GV9dXVKL9KJr3RBQ_VHAEgaUXg-VyDUutKuB4FtC3w-45Nqq94fG47OSHEooKPy3z6CVWNlXzqiKtiyudBTp3PXcKm5LvBojVw",
        data: PaySellData(
          count: buy.count,
          idShare: buy.idShare,
          unitAmount: buy.unitAmount,

          dateBuy:buy.dateBuy ,
            )
            .toJson());
   print(respone.data);
    return Future.value(unit);
  }

  Future<Unit> addSaleProcess(PaySellData sale) async {
    await RemoteRequest.postData(
        path: "addSillRecord",
        token:await userLocalDataSource.getCachedUser(),

        //   token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmZjZWQ1NzY1ZGQ3NjZiNzM0ZGRjZWQ2ZTAyZWU2ZDM3MjYzMDUzYjZiNDgzM2UyNmU5ZjZmNmQ4ZDZhYjA3ZTgxMGQyMmNmMDhhZWFkNjMiLCJpYXQiOjE3MjgwNDEwNjAuMTM2OTc1LCJuYmYiOjE3MjgwNDEwNjAuMTM2OTc3LCJleHAiOjE3NTk1NzcwNjAuMTMxMjQ3LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.SfilBlo8MPpcnguXnLnd1gofGMXXqQp87Kw_6Bbd69BxUvf-eZ3-m082L-CJIkclDF2Q3_5TYfQewc45dSx4nPrkYucE9CZ_Tny96fQwpn75SN4b8RxQn7f_hZ9IkUJdL9nmv5JJdVSIlObytNcsUNEGj1v_jDw9SLpgtNfCdbfvKgujR42LYol1UvPahLn2PzFbQv5Efv1j-WyAYAqOpZhsJQ6DQl14CIdRRxWhfxSytEgwLXYYeC8Gdb491GJUmdmufeNSUPkfJqBfWjy5IrNW1Xsx86JNd6opyTEfbfX2TeFNWC-AFXmpAt4Lr4lITbaaoz2DiJ4nGxR1FvxDxbcbTFI6pPETgkQ8pB0UwI89qUDRD4Sbyn_vp1ryW-uPrr6fybwfwwEqm_x2sJ3I3xtyfj1xBrmtcA4hKfbbwlgpX6MFoSPOl1J0zwgSfOzXPEDQ5hyznA7uFIJh8xwsIKyl5bLhI-1kagMWEUz4iflGYrvHEvVMqsz3zAkTgdVe1ig7B4Nc7XKPu-cuK6Wo5miA2wQpQWvbcSHOnugrZp0vDOnrYptZZkzdT-FLC-ILSSljt5Yw4GV9dXVKL9KJr3RBQ_VHAEgaUXg-VyDUutKuB4FtC3w-45Nqq94fG47OSHEooKPy3z6CVWNlXzqiKtiyudBTp3PXcKm5LvBojVw",
        data: PaySellData(
            count: sale.count,
            idShare: sale.idShare,
            unitAmount: sale.unitAmount,
            dateSale:sale.dateSale,
          dateBuy: sale.dateBuy,

        )
            .toJson());
    return Future.value(unit);
  }

  Future<Unit> addSharesProcess(SharesData shareData) async {
    await RemoteRequest.postData(
        path: "addShare",
        token:await userLocalDataSource.getCachedUser(),

        //token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmZjZWQ1NzY1ZGQ3NjZiNzM0ZGRjZWQ2ZTAyZWU2ZDM3MjYzMDUzYjZiNDgzM2UyNmU5ZjZmNmQ4ZDZhYjA3ZTgxMGQyMmNmMDhhZWFkNjMiLCJpYXQiOjE3MjgwNDEwNjAuMTM2OTc1LCJuYmYiOjE3MjgwNDEwNjAuMTM2OTc3LCJleHAiOjE3NTk1NzcwNjAuMTMxMjQ3LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.SfilBlo8MPpcnguXnLnd1gofGMXXqQp87Kw_6Bbd69BxUvf-eZ3-m082L-CJIkclDF2Q3_5TYfQewc45dSx4nPrkYucE9CZ_Tny96fQwpn75SN4b8RxQn7f_hZ9IkUJdL9nmv5JJdVSIlObytNcsUNEGj1v_jDw9SLpgtNfCdbfvKgujR42LYol1UvPahLn2PzFbQv5Efv1j-WyAYAqOpZhsJQ6DQl14CIdRRxWhfxSytEgwLXYYeC8Gdb491GJUmdmufeNSUPkfJqBfWjy5IrNW1Xsx86JNd6opyTEfbfX2TeFNWC-AFXmpAt4Lr4lITbaaoz2DiJ4nGxR1FvxDxbcbTFI6pPETgkQ8pB0UwI89qUDRD4Sbyn_vp1ryW-uPrr6fybwfwwEqm_x2sJ3I3xtyfj1xBrmtcA4hKfbbwlgpX6MFoSPOl1J0zwgSfOzXPEDQ5hyznA7uFIJh8xwsIKyl5bLhI-1kagMWEUz4iflGYrvHEvVMqsz3zAkTgdVe1ig7B4Nc7XKPu-cuK6Wo5miA2wQpQWvbcSHOnugrZp0vDOnrYptZZkzdT-FLC-ILSSljt5Yw4GV9dXVKL9KJr3RBQ_VHAEgaUXg-VyDUutKuB4FtC3w-45Nqq94fG47OSHEooKPy3z6CVWNlXzqiKtiyudBTp3PXcKm5LvBojVw",
        data: SharesData(
          walletId: shareData.walletId,
          name: shareData.name,
          numberOfShareToBuy: shareData.numberOfShareToBuy,
          returnFromRisk: shareData.returnFromRisk,
          riskRatio: shareData.riskRatio,
          stopLossValue:shareData.stopLossValue,
          totalExpectedProfit: shareData.totalExpectedProfit,
          totalExpectedLoss: shareData.totalExpectedLoss,
          stopValueProfit:shareData.stopValueProfit,
          theAmountPaidFromTheCoverageRatio: shareData.theAmountPaidFromTheCoverageRatio,
          //priceOfShare: shareData.priceOfShare,

        )
            .toJson());
    return Future.value(unit);
  }

}