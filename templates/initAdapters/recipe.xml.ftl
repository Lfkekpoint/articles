<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />
    <dependency mavenUrl="com.android.support:recyclerview-v7:${buildApi}.+" />

    <instantiate from="root/src/app_package/IBaseListItem.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/list/IBaseListItem.kt"/>

    <instantiate from="root/src/app_package/IBaseListAdapter.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/list/IBaseListAdapter.kt" />

    <merge from="root/res/values/colors.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/colors.xml" />

    <merge from="root/res/values/styles.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/styles.xml" />

<#if initSimpleAdapter!true>

    <instantiate from="root/src/app_package/SimpleListAdapter.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/list/simple/SimpleListAdapter.kt" />

</#if>

<#if initAdapterVm!true>

    <merge from="root/build.gradle.ftl"
             to="${escapeXmlAttribute(projectOut)}/build.gradle" />

    <instantiate from="root/src/app_package/VmListAdapter.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/list/mvvm/VmListAdapter.kt" />

    <instantiate from="root/src/app_package/VmViewHolder.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/list/mvvm/VmViewHolder.kt" />

    <instantiate from="root/src/app_package/IBaseItemVm.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/list/mvvm/IBaseItemVm.kt" />
</#if>

</recipe>
