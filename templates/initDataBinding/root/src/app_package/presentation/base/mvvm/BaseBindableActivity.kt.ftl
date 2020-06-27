package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.mvvm

import android.app.Activity
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import android.os.Bundle
import ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.BaseActivity
import ${escapeKotlinIdentifiers(packageName)}.presentation.helper.SnackHelper

abstract class BaseBindableActivity : BaseActivity(), BaseBindableRootView {

    override val controller: BaseViewModel? = null

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)

        controller?.let {
            val binding = DataBindingUtil.setContentView<ViewDataBinding>(this as Activity, layoutId)
            binding.setVariable(variableId, it)
            binding.setLifecycleOwner(this)

        } ?: setContentView(layoutId)

        lifecycle.addObserver(controller ?: return)

        controller?.intent = intent
        controller?.create(bundle)
    }

    override fun showMessage(message: String, lengthIfNeed: Int) {
        SnackHelper().show(this, message, lengthIfNeed)
    }

    override fun observeLiveData(liveData: MutableLiveData<*>, observer: Observer<*>) {
        (liveData as MutableLiveData<Any>).observe(this, observer as Observer<Any>)
    }
}


