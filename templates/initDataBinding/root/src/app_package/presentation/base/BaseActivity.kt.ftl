package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch

import android.content.Intent
import android.os.Bundle
import android.view.Gravity
import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.PopupWindow
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import ${escapeKotlinIdentifiers(packageName)}.R
import ${escapeKotlinIdentifiers(packageName)}.data.modules.SharedPrefs
import ${escapeKotlinIdentifiers(packageName)}.data.modules.SharedPrefs.TokenData.pushToken
import ${escapeKotlinIdentifiers(packageName)}.presentation.helper.SnackHelper
import ${escapeKotlinIdentifiers(packageName)}.presentation.modules.login.LoginActivity

abstract class BaseActivity : AppCompatActivity(), BaseRootView {

    private var spinnerPopup: PopupWindow? = null

    override fun showMessage(message: String, lengthIfNeed: Int) {
        SnackHelper().show(this, message, lengthIfNeed)
    }

    override fun onSaveInstanceState(outState: Bundle?) {
        super.onSaveInstanceState(outState)

        controller?.saveInstanceState(outState)
    }

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)

        setContentView(layoutId)

        lifecycle.addObserver(controller ?: return)

        controller?.intent = intent
        controller?.create(bundle)
    }

    override fun onNewIntent(intent: Intent?) {
        super.onNewIntent(intent)

        controller?.intent = intent
        controller?.activityOnNewIntent()
    }

    override fun observeLiveData(liveData: MutableLiveData<*>, observer: Observer<*>) {
        (liveData as MutableLiveData<Any>).observe(this, observer as Observer<Any>)
    }

    override fun showSpinnerPopup() {
        if (this.hasWindowFocus()) {
            spinnerPopup?.let { showSpinner() } ?: inflateAndShow()
        }
    }

    private fun showSpinner() {
        val view = findViewById<ViewGroup>(android.R.id.content)
        spinnerPopup?.showAtLocation(view as ViewGroup, Gravity.CENTER, 0, 0)
    }

    private fun inflateAndShow() {
        val view = findViewById<ViewGroup>(android.R.id.content)
        val layout = LayoutInflater.from(this).inflate(R.layout.popup_fulscreen_spinner, view as ViewGroup, false)

        spinnerPopup = PopupWindow(layout, ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT, true)
        spinnerPopup?.isOutsideTouchable = false

        showSpinner()
    }

    override fun dismissSpinnerPopup() {
        spinnerPopup?.dismiss()
    }

    override fun onBackPressed() {

        when (supportFragmentManager.backStackEntryCount) {
            0, 1 -> finish()
            else -> supportFragmentManager.popBackStack()
        }
    }

    override fun onDestroy() {
        super.onDestroy()

        spinnerPopup?.dismiss()
    }

    override fun logout() {

        val tempPushToken = pushToken
        SharedPrefs.clearAllPrefs()

        pushToken = tempPushToken
        val intent = Intent(this, LoginActivity::class.java)
        intent.flags = Intent.FLAG_ACTIVITY_CLEAR_TASK or Intent.FLAG_ACTIVITY_NEW_TASK

        startActivity(intent)
        finish()
    }
}