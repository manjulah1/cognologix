<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
            <img class="app-logo" src="${url.resourcesPath}/img/cognologix-logo.svg" alt="logo" />
        <h1 class="app-title">${msg("loginAccountTitle")}</h1>
        <#if messageHeader??>
    <h1>
     ${messageHeader}
    </h1>
        <#else>
    <h1>
        ${message.summary}
    </h1>

        </#if>
    <#elseif section = "form">
    <div id="kc-info-message">
        <p class="instruction">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}<#sep>, </#items></b></#list><#else></#if></p>
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri?has_content>
                <p><a href="${pageRedirectUri}" >${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            <#elseif actionUri?has_content>
                <p><a href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a></p>
            <#elseif (client.baseUrl)?has_content>
                <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            </#if>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>