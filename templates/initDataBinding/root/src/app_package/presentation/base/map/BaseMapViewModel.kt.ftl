package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.map

import com.google.android.gms.maps.GoogleMap
import ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.mvvm.BaseViewModel

abstract class BaseMapViewModel : BaseViewModel() {
    open fun onMapReady(map: GoogleMap) {}
}