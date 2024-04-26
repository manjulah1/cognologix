<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "loginTitle">
        <img class="app-logo" src="${url.resourcesPath}/img/cognologix-logo.svg" alt="logo" />
        <h1 class="app-title">${msg("loginAccountTitle")}</h1>
    <#elseif section = "socialProviders" >
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <a id="social-${p.alias}" class="idp-button" type="button" href="${p.loginUrl}">
                            <#if p.iconClasses?has_content>
                                <img class="idp-logo" src="${url.resourcesPath}/img/${p.alias!}-icon.png" alt="logo" />
                                <span class="idp-label">Login with ${p.displayName!}</span>
                            <#else>
                                <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                            </#if>
                        </a>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
