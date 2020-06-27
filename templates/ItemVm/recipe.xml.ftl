<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <instantiate from="root/src/app_package/BlankItem.kt.ftl"
                   to="app/src/main/java/${slashedPackageName(packageName)}/presentation/modules/${slashedPackageName(moduleName)}/${itemName}Item.kt" />

    <instantiate from="root/res/layout/item_blank.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(layoutName)}.xml" />

    <open file="app/src/main/java/${slashedPackageName(packageName)}/presentation/modules/${slashedPackageName(moduleName)}/${itemName}Item.kt" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(layoutName)}.xml" />

</recipe>
