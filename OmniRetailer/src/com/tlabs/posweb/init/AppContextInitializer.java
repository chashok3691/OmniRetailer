package com.tlabs.posweb.init;

import org.apache.log4j.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.util.Properties;


/**
 * Created by Sudhakar on 10-04-2017.
 */
public class AppContextInitializer extends HttpServlet {

    private static final String SERVICES_PROPERTIES = "services.properties";
    private static final String APP_MESSAGES_PROPERTIES = "AppMessages.properties";
   // private static final String COMMON_MESSAGES_PROPERTIES = "commonResources.properties";
    private static Logger log = Logger.getLogger(AppContextInitializer.class);


    public void init(ServletConfig config) throws ServletException {
        Properties servicesProp = new Properties();
        Properties appMessagesProp = new Properties();
        Properties commonProp = new Properties();
        super.init(config);
        //  String xslPath = config.getServletContext().getResource(XSL_FILE_PATH).getPath();
        try {
            /*Load services properties file*/
            servicesProp.load(AppContextInitializer.class.getClassLoader().getResourceAsStream(SERVICES_PROPERTIES));
            AppProperties.setServicesProperties(servicesProp);
             appMessagesProp.load(AppContextInitializer.class.getClassLoader().getResourceAsStream(APP_MESSAGES_PROPERTIES));
            AppProperties.setAppMessagesProperties(appMessagesProp);
            log.info("Cloud service URL ::" + AppProperties.getCloudServiceUrlWithContext());

        } catch (IOException e) {
            log.error("Error initializing host properties for cloud services!!!");
            e.printStackTrace();
        }

        System.out.println("$AppContextInitializer : initialization is done.");
    }

}


