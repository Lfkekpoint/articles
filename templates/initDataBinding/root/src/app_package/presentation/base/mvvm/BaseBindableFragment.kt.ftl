package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.mvvm

import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.BaseFragment

abstract class BaseBindableFragment : BaseFragment(), BaseBindableRootView {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {

        val binding: ViewDataBinding = DataBindingUtil.inflate(inflater, layoutId, container, false)

        binding.setLifecycleOwner(this)
        binding.setVariable(variableId
                ?: throw IllegalStateException("Need to define variable if use vm - " + this::class.java.canonicalName), controller)

        return binding.root
    }
}