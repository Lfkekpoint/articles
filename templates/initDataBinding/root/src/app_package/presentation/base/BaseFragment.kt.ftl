package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch

import android.content.Context
import android.os.Build
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import android.view.inputmethod.InputMethodManager
import androidx.fragment.app.Fragment
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import im.raketa.greedyCustomer.presentation.helper.SnackHelper

abstract class BaseFragment : Fragment(), BaseRootView, AdditionalFragmentView {

    open val name: String = this::class.java.canonicalName

    override fun onSaveInstanceState(outState: Bundle) {
        controller?.saveInstanceState(outState)

        super.onSaveInstanceState(outState)

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        lifecycle.addObserver(controller ?: return)

        controller?.arguments = arguments
        controller?.create(savedInstanceState)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(layoutId, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        controller?.fragmentOnViewCreated(view, savedInstanceState)
    }

    override fun hideKeyboardIfNeed() {

        val view = activity?.currentFocus

        if (view != null) {

            val imm = activity?.getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
            imm.hideSoftInputFromWindow(view.windowToken, 0)
        }
    }

    override fun showSpinnerPopup() {
        (activity as BaseActivity?)?.showSpinnerPopup()
    }

    override fun dismissSpinnerPopup() {
        (activity as BaseActivity?)?.dismissSpinnerPopup()
    }

    override fun showMessage(message: String, lengthIfNeed: Int) {
        SnackHelper().show(
                activity = activity,
                text = message,
                duration = lengthIfNeed)
    }

    override fun setSystemBarColor(color: Int) {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {

            val window = activity?.window

            window?.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
            window?.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window?.statusBarColor = color
        }
    }

    override fun observeLiveData(liveData: MutableLiveData<*>, observer: Observer<*>) {
        (liveData as MutableLiveData<Any>).observe(this, observer as Observer<Any>)
    }

    override fun onBackPressed() {
        (activity as BaseActivity).onBackPressed()
    }

    override fun logout() {
        (activity as BaseActivity).logout()
    }
}