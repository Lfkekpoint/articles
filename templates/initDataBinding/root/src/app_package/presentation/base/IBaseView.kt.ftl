package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import com.google.android.material.snackbar.Snackbar

interface IBaseView {
    fun showMessage(message: String, lengthIfNeed: Int = Snackbar.LENGTH_LONG)
    fun observeLiveData(liveData: MutableLiveData<*>, observer: Observer<*>)
    fun onBackPressed()

    fun showSpinnerPopup()
    fun dismissSpinnerPopup()

    fun logout()
}