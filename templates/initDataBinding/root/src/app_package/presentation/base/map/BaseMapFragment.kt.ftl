package ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.map

import android.os.Bundle
import android.view.View
import com.google.android.gms.maps.MapView
import com.google.android.gms.maps.MapsInitializer
import ${escapeKotlinIdentifiers(packageName)}.presentation.base.arch.tapBar.TabBarFragment

abstract class BaseMapFragment : TabBarFragment() { // extends TabBarFragment only for this proj

    override val controller: BaseMapViewModel? = null
    abstract val mapView: MapView?

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        mapView?.onCreate(savedInstanceState)

        try {
            MapsInitializer.initialize(activity!!.applicationContext)
        } catch (e: Exception) {
            e.printStackTrace()
        }

        mapView?.getMapAsync {
            controller?.onMapReady(it)
        }

        mapView?.onResume()
    }

    override fun onPause() {
        super.onPause()
        mapView?.onPause()
    }

    override fun onResume() {
        super.onResume()
        mapView?.onResume()
    }

    override fun onDestroy() {
        super.onDestroy()
        mapView?.onDestroy()
    }

    override fun onLowMemory() {
        super.onLowMemory()
        mapView?.onLowMemory()
    }
}