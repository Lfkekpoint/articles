package ${escapeKotlinIdentifiers(packageName)}.data.base

import android.content.Context
import android.content.SharedPreferences
import ${escapeKotlinIdentifiers(packageName)}.presentation.base.Const
import ${escapeKotlinIdentifiers(packageName)}.presentation.base.application.appLifeClasses.AppState

open class BasePrefs {

    private val mPrefs: SharedPreferences by lazy {
        initPrefs()
    }

    private fun initPrefs(): SharedPreferences {
        return AppState.appContext.getSharedPreferences(getPrefsAppKey(), Context.MODE_PRIVATE)
    }

    open protected fun getPrefsAppKey(): String {
        return Const.APP_KEY
    }

    protected fun put(key: String, value: String) {
        mPrefs.edit().putString(key, value)
                .apply()
    }

    protected fun put(key: String, value: Boolean) {
        mPrefs.edit().putBoolean(key, value)
                .apply()
    }

    protected fun put(key: String, value: Int) {
        mPrefs.edit().putInt(key, value)
                .apply()
    }

    protected fun put(key: String, value: Long) {
        mPrefs.edit().putLong(key, value)
                .apply()
    }

    protected fun put(key: String, value: Set<String>) {
        mPrefs.edit().putStringSet(key, value)
                .apply()
    }

    protected fun put(key: String, value: Double) {
        mPrefs.edit().putLong(key, value.toRawBits())
                .apply()
    }

    protected fun getString(key: String, value: String = ""): String? {
        return mPrefs.getString(key, value)
    }

    protected fun getDouble(key: String): Double {
        return Double.fromBits(mPrefs.getLong(key, Const.UNDEFINED_LONG))
    }

    protected fun getBoolean(key: String, value: Boolean = Const.UNDEFINED_BOOL): Boolean {
        return mPrefs.getBoolean(key, value)
    }

    protected fun getLong(key: String, value: Long = Const.UNDEFINED_LONG): Long {
        return mPrefs.getLong(key, value)
    }

    protected fun getInt(key: String, value: Int): Int {
        return mPrefs.getInt(key, value)
    }

    protected fun getStringSet(key: String): MutableSet<String>? {
        return mPrefs.getStringSet(key, setOf(Const.UNDEFINED_STRING))
    }

    protected fun remove(key: String) {
        mPrefs.edit().remove(key).apply()
    }

    fun clearAllPrefs() {
        mPrefs.edit().clear().apply()
    }
}