package com.tlabs.posweb.util;



import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.log4j.Logger;
//import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;
//import com.tlabs.posweb.beans.Billing;

/**
 * Created by Sudhakar on 5/31/2017.
 */
public class JSONUtils {
    static  Logger   log = Logger.getLogger(JSONUtils.class);

    public JSONUtils() {
    }

   /* public String getDocumentParameters(String jsonString, String param) throws JSONException {
        String paramVal = null;
        JSONObject jObject = new JSONObject(jsonString);
        try {
            JsonNode rootNode = getJsonTreeNode(jObject);
            JsonNode node = rootNode.findValue(param);
            if (node != null) {
                if (node.isContainerNode())
                    paramVal = node.toString();
                else
                    paramVal = node.asText();
            }
        } catch (Exception e) {
            log.error("Error ::  Input JSON " + jsonString + " :::::: Param to Find " + param +" :: Message " + e.getMessage());
            e.printStackTrace();
            throw new  JSONException(e.getMessage());
        }
        return paramVal;
    }*/

  /*  protected  JsonNode getJsonTreeNode(JSONObject jObject) throws java.io.IOException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readTree(mapper.getFactory().createParser(jObject.toString().getBytes()));
    }*/

    protected  Map getJsonObjectAsMap(String jStr) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(jStr, new TypeReference<LinkedHashMap<String, Object>>() {
        });
        return map;
    }

    protected  String getJsonAsXml(String jStr) throws JSONException {
        JSONObject json = new JSONObject(jStr);
       
        
        return XML.toString(json);
    }
    protected JSONObject getXmlAsJson(String xmlStr) throws JSONException {
        return XML.toJSONObject(xmlStr);
    }

   protected List<Object> filterJsonArray(JSONArray json, String filters) throws JSONException, IOException {
        List<String> keyList = getTokensList(filters, ",");
        List<Object> list = new ArrayList<Object>();
        ObjectMapper mapper = new ObjectMapper();
        Map[] nodes = mapper.readValue(json.toString(), LinkedHashMap[].class);
        for (Map node : nodes) {
            Map newNode = new LinkedHashMap();
            for (String key : keyList) {
                if (node.containsKey(key))
                    newNode.put(key, node.get(key));
            }
            list.add(newNode);
        }
        return list;
    }

   
    protected List<Object> filterJsonArray(JSONArray json, List<String> keyList) throws JSONException, IOException {
        List<Object> list = new ArrayList<Object>();
        ObjectMapper mapper = new ObjectMapper();
        Map[] nodes = mapper.readValue(json.toString(), HashMap[].class);
        for (Map node : nodes) {
            Map newNode = new HashMap();
            for (String key : keyList) {
                if (node.containsKey(key))
                    newNode.put(key, node.get(key));
            }
            list.add(newNode);
        }
        return list;
    }

    private List<String> getTokensList(String input, String delim) {
        StringTokenizer st = new StringTokenizer(input, delim);
        List<String> keyList = new ArrayList<String>();
        while (st.hasMoreElements()) {
            keyList.add((String) st.nextElement());
        }
        return keyList;
    }

}
