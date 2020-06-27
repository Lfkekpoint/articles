package ${escapeKotlinIdentifiers(packageName)}.domain.base

import android.widget.Toast
import com.google.android.material.snackbar.Snackbar
import ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.IBaseView
import ${escapeKotlinIdentifiers(packageName)}.presentation.helper.ToastHelper

class Resource<out T>(val data: T?, val errorCode: Int? = null, val errorMessage: String? = null) {

    fun cancelRequest(view: IBaseView) {
        view.dismissSpinnerPopup()

        when (errorCode) {
            401 -> {
                ToastHelper().showToast("Необходимо заново зайти в приложение", Toast.LENGTH_SHORT)
                view.logout()
            }

            ERROR_CODE_UNKNOWN_HOST -> {
                view.showMessage(errorMessage!!)
            }

            else -> view.showMessage(errorMessage ?: "Что то пошло не так")
        }
    }
}