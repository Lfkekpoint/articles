<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto">

    <data>

        <import type="${escapeKotlinIdentifiers(packageName)}.presentation.modules.${moduleName}.${itemName}Item" />

        <variable
            name="vm${itemName}"
            type="${itemName}Item" />
    </data>

    <FrameLayout style="@style/root_layout">

    </FrameLayout>

</layout>