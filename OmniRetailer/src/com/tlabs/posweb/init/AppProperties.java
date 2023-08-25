
package com.tlabs.posweb.init;


import java.util.Properties;

public final class AppProperties {


    static Properties SERVICE_PROP;
    static Properties APP_MESSAGES_PROP;
    static Properties SOAP_SERVICE_PROP;

    static String getHostName() {
        return SERVICE_PROP.getProperty("services.hostname");
    }

    static String getPort() {
        return SERVICE_PROP.getProperty("services.port");
    }

    public static boolean isSecured() {
        if ("true".endsWith(SERVICE_PROP.getProperty("services.secured")))
            return true;

        return false;
    }

    public static String getTallyUrl() {
        return SERVICE_PROP.getProperty("ext.service.tallyurl");
    }

    public static String getCloudServiceUrlWithContext() {
        if (!isSecured())
            return "http://" + getHostName() + ":" + getPort() + "/" + getContextName();
        else
            return "https://" + getHostName() + ":" + getPort() + "/" + getContextName();
    }

    public static String getContextName() {
        return SERVICE_PROP.getProperty("services.contextname");
    }

    public static Properties getServicesProperties() {
        return SERVICE_PROP;
    }

    static void setServicesProperties(Properties services) {
        AppProperties.SERVICE_PROP = services;
    }

    public static Properties getSOAPServiceProperties() {
        return SOAP_SERVICE_PROP;
    }

    static void setSOAPServiceProperties(Properties soapServiceProperties) {
        AppProperties.SOAP_SERVICE_PROP = soapServiceProperties;
    }

    public static String getRESTFulCloudServiceURL(String serviceUri) {
        return getCloudServiceUrlWithContext() + SERVICE_PROP.getProperty(serviceUri);
    }

    public static String getSOAPCloudServiceURL(String serviceUri) {
        return getCloudServiceUrlWithContext() + SOAP_SERVICE_PROP.getProperty(serviceUri);
    }

    static void setAppMessagesProperties(Properties appMsgProperties) {
        AppProperties.APP_MESSAGES_PROP = appMsgProperties;
    }

    public static String getAppMessageByProperty(String property) {
        return (String) APP_MESSAGES_PROP.getProperty(property);
    }

}
