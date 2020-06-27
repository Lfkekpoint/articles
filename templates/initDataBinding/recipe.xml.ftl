<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />

    <instantiate from="root/src/app_package/presentation/base/AdditionalFragmentView.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/AdditionalFragmentView.kt" />



    <instantiate from="root/src/app_package/presentation/base/BaseActivity.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/BaseActivity.kt" />



    <instantiate from="root/src/app_package/presentation/base/BaseController.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/BaseController.kt" />



    <instantiate from="root/src/app_package/presentation/base/BaseFragment.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/BaseFragment.kt" />



    <instantiate from="root/src/app_package/presentation/base/BaseRootView.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/BaseRootView.kt" />



    <instantiate from="root/src/app_package/presentation/base/HandleObserver.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/HandleObserver.kt" />



    <instantiate from="root/src/app_package/presentation/base/IBaseView.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/IBaseView.kt" />


   <!--  <merge from="root/res/values/colors.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/colors.xml" />

    <merge from="root/res/values/styles.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/styles.xml" /> -->


<#if initContainerActivity!true>


    <instantiate from="root/src/app_package/presentation/base/container/ContainerActivity.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/container/ContainerActivity.kt" />


</#if>



<#if initMapFragment!true>

    <instantiate from="root/src/app_package/presentation/base/map/BaseMapFragment.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/map/BaseMapFragment.kt" />


    <instantiate from="root/src/app_package/presentation/base/map/BaseMapViewModel.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/map/BaseMapViewModel.kt" />


</#if>



<#if initMvvm!true>

    <instantiate from="root/src/app_package/presentation/base/mvvm/BaseBindableActivity.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/mvvm/BaseBindableActivity.kt" />

    <instantiate from="root/src/app_package/presentation/base/mvvm/BaseBindableFragment.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/mvvm/BaseBindableFragment.kt" />

    <instantiate from="root/src/app_package/presentation/base/mvvm/BaseBindableRootView.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/mvvm/BaseBindableRootView.kt" />

    <instantiate from="root/src/app_package/presentation/base/mvvm/BaseViewModel.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/mvvm/BaseViewModel.kt" />

    <merge from="root/src/app_package/build.gradle.ftl"
             to="app/build.gradle"/>


</#if>


<#if initTabBar!true>

    <instantiate from="root/src/app_package/presentation/base/tabBar/TabBarFragment.kt.ftl"
             to="app/src/main/java/${slashedPackageName(packageName)}/presentation/base/tabBar/TabBarFragment.kt" />


</#if>

</recipe>
