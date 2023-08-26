
/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 27-3-2015
 * 
 * Licensed under the Technolabs Software License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.technolabssoftware.com/pages/privacy-policy/
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

package com.tlabs.posweb.beans;


/**
 * 
 * @author Sahitya
 * 
 *	This bean class is used to receive response code and response message from webservices then send to client
 *
 */
public class ResponseHeader
{
    private String responseMessage;

    private String responseCode;

    public String getResponseMessage ()
    {
        return responseMessage;
    }

    public void setResponseMessage (String responseMessage)
    {
        this.responseMessage = responseMessage;
    }

    public String getResponseCode ()
    {
        return responseCode;
    }

    public void setResponseCode (String responseCode)
    {
        this.responseCode = responseCode;
    }

    @Override
    public String toString()
    {
        return "ClassPojo [responseMessage = "+responseMessage+", responseCode = "+responseCode+"]";
    }
}