package com.tlabs.posweb.util;
import java.io.File;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
public class DOMoperations {

	File fXmlFile = null;	
	DocumentBuilderFactory dbFactory = null;
	DocumentBuilder dBuilder = null;
	Document doc = null;
	DOMoperations dom=null;
	File file=null;
	@SuppressWarnings("rawtypes")
	List atrrList=null;

	/** @author kesav
	 * This method is used for creating xml file and also it will check the dynamic folder and file creation */
/*public Document getDocumentObject(String folderPath,String xmlFileName,String rootElementName,String[] childs){
	 boolean flag=false;
	 File fXmlFile;
	 File fXmlFileLoc=null;
	 Node rootElement=null;
	 Node subChild;
	try{	
		   fXmlFile = new File(folderPath+File.separator+xmlFileName+Utilities.getMessage("XML_EXTENSION"));	    
		   if(!fXmlFile.exists()){
			    File fXmlFileMain=new File(folderPath);
			    if(!fXmlFileMain.exists()){
			    fXmlFileMain.mkdirs();
			    fXmlFileLoc = new File(folderPath+File.separator+xmlFileName+Utilities.getMessage("XML_EXTENSION"));
			    	if(!fXmlFileLoc.exists()){
			    		 flag=fXmlFileLoc.createNewFile();
			   }}else{
				   fXmlFileLoc= new File(folderPath+File.separator+xmlFileName+Utilities.getMessage("XML_EXTENSION"));
	    		   if(!fXmlFileLoc.exists()){
	    			   flag=fXmlFileLoc.createNewFile();
	    		   }
			    	  File folderFiles=new File(folderName);
			    	  if(folderFiles.exists()){
			    	  subfiles=folderFiles.listFiles(); 
			    	  for(File file:subfiles){
			    		      if(file.isDirectory()){
			    		    	  if(file.getName().equals(customerID)){
			    		    		  fXmlFileLoc= new File(file+File.separator+xmlFileName+Utilities.getMessage("XML_EXTENSION"));
			    		    		   if(!fXmlFileLoc.exists()){
			    		    			   flag=fXmlFileLoc.createNewFile();
			    		    		   }
			    		    	  }
			    		}}}}
			    	fXmlFile=fXmlFileLoc;
		   			}
		   		if(flag){
			   		     DocumentBuilderFactory dbFactory =
				         DocumentBuilderFactory.newInstance();
				         DocumentBuilder dBuilder = 
				         dbFactory.newDocumentBuilder();
				         Document doc = dBuilder.newDocument();
				         if(rootElementName!=null&&!rootElementName.equals("")){
				         rootElement = doc.createElement(rootElementName);
				         doc.appendChild(rootElement);
				         }
				         if(childs!=null){
				     		for(String currentChild:childs){
				     			 subChild=doc.createElement(currentChild);
				     			 rootElement.appendChild(subChild);
				     		}}
				         Element customTag = doc.createElement(Constants.CUSTOM_SETTINGS);
				         rootElement.appendChild(customTag);
				         Element templateTag = doc.createElement(Constants.TEMPLATES);
				         rootElement.appendChild(templateTag);
				         TransformerFactory transformerFactory = TransformerFactory.newInstance();
				     	 Transformer transformer = transformerFactory.newTransformer();
				     	 Properties outFormat = new Properties();
				     	 outFormat.setProperty(OutputKeys.INDENT, "yes");
				     	 outFormat.setProperty(OutputKeys.METHOD, "xml");
				     	 outFormat.setProperty(OutputKeys.VERSION, "1.0");
				     	 outFormat.setProperty(OutputKeys.ENCODING, "UTF-8");
				     	 transformer.setOutputProperties(outFormat);
				     	 DOMSource domSource = new DOMSource(doc);
				      	 StreamResult result = new StreamResult(fXmlFile.getPath());
				     	 transformer.transform(domSource, result);
				      }
		   dbFactory = DocumentBuilderFactory.newInstance();
		   dBuilder = dbFactory.newDocumentBuilder();
		   doc = dBuilder.parse(fXmlFile);
		   
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return doc;

}*/

	public Document getDocumentObject(String folderPath,String xmlFileName,String rootElementName,String[] childs){
		 boolean flag=false;
		 File fXmlFile;
		 File fXmlFileLoc=null;
		 Node rootElement=null;
		 Node subChild;
		 try{	
			   fXmlFile = new File(folderPath+File.separator+xmlFileName+Utilities.getResponseCode("XML_EXTENSION"));	    
			   //System.out.println(folderPath+" Folder Path");
			   //System.out.println(fXmlFile.getAbsolutePath()+" Absolute Path");
			   if(!fXmlFile.exists()){
				    File fXmlFileMain=new File(folderPath);
				    //System.out.println(fXmlFileMain.getAbsolutePath()+"  File Mail Absolute Path");
				    if(!fXmlFileMain.exists()){
				    	boolean flag_sample=fXmlFileMain.mkdirs();
				    	//System.out.println("Success: "+flag_sample);
				    	fXmlFileLoc = new File(folderPath+File.separator+xmlFileName+Utilities.getResponseCode("XML_EXTENSION"));
				    	//System.out.println(fXmlFileLoc.getAbsolutePath()+"  File Location Absolute Path");
				    	if(!fXmlFileLoc.exists()){
				    		flag=fXmlFileLoc.createNewFile();
				    	}
				    }else{
				    	fXmlFileLoc= new File(folderPath+File.separator+xmlFileName+Utilities.getResponseCode("XML_EXTENSION"));
				    	//System.out.println("Already thereeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
				    	if(!fXmlFileLoc.exists()){
				    		flag=fXmlFileLoc.createNewFile();
				    	}
				    	/* File folderFiles=new File(folderName);
				    	  if(folderFiles.exists()){
				    	  subfiles=folderFiles.listFiles(); 
				    	  for(File file:subfiles){
				    		      if(file.isDirectory()){
				    		    	  if(file.getName().equals(customerID)){
				    		    		  fXmlFileLoc= new File(file+File.separator+xmlFileName+Utilities.getMessage("XML_EXTENSION"));
				    		    		   if(!fXmlFileLoc.exists()){
				    		    			   flag=fXmlFileLoc.createNewFile();
				    		    		   }
				    		    	  }
				    		}}}*/
				    }
				    fXmlFile=fXmlFileLoc;
			   }
			   		if(flag){
			   			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			   			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			   			Document doc = dBuilder.newDocument();
			   			if(rootElementName!=null&&!rootElementName.equals("")){
			   			rootElement = doc.createElement(rootElementName);
			   			doc.appendChild(rootElement);
			   		}
			   		if(childs!=null){
			   			for(String currentChild:childs){
			   				subChild=doc.createElement(currentChild);
			   				rootElement.appendChild(subChild);
				     	}
			   		}
			   		/* Element customTag = doc.createElement(Constants.CUSTOM_SETTINGS);
				         rootElement.appendChild(customTag);
				         Element templateTag = doc.createElement(Constants.TEMPLATES);
				         rootElement.appendChild(templateTag);*/
				         TransformerFactory transformerFactory = TransformerFactory.newInstance();
				     	 Transformer transformer = transformerFactory.newTransformer();
				     	 Properties outFormat = new Properties();
				     	 outFormat.setProperty(OutputKeys.INDENT, "yes");
				     	 outFormat.setProperty(OutputKeys.METHOD, "xml");
				     	 outFormat.setProperty(OutputKeys.VERSION, "1.0");
				     	 outFormat.setProperty(OutputKeys.ENCODING, "UTF-8");
				     	 transformer.setOutputProperties(outFormat);
				     	 DOMSource domSource = new DOMSource(doc);
				      	 StreamResult result = new StreamResult(fXmlFile.getPath());
				     	 transformer.transform(domSource, result);
			   }
			   dbFactory = DocumentBuilderFactory.newInstance();
			   dBuilder = dbFactory.newDocumentBuilder();
			   doc = dBuilder.parse(fXmlFile);
			   		
		 }catch(Exception exception){
		 	exception.printStackTrace();
		 }	
		 return doc;
	}	
/**
 * the new createXml with  4 params written by kesav *//*

public Document  createXml(String rootElement,String targetPath, String fileName,String[] childs) {
 
	try{
 	File fXmlFile = new File(targetPath+File.separator+fileName+Utilities.getMessage("XML_EXTENSION"));
	if (!fileName.endsWith(Utilities.getMessage("XML_EXTENSION"))) fileName += Utilities.getMessage("XML_EXTENSION");
	
	if(!targetPath.endsWith("")) targetPath += File.separator;
	Element subChild;
	Document doc = ResourceManager.createXmlAndGetDocument(targetPath ,  fileName);
	Element rootEle ;
	if (rootElement != null && rootElement != "") {
		rootEle = doc.createElement(rootElement);
	}else{
		rootEle = doc.createElement("dummy_element");
	}
	doc.appendChild(rootEle);
	if(childs.length>0){
	for(String currentChild:childs){
		 subChild=doc.createElement(currentChild);
		 rootEle.appendChild(subChild);
	}}
	
	ResourceManager.commit();
	  dbFactory = DocumentBuilderFactory.newInstance();
	   dBuilder = dbFactory.newDocumentBuilder();
	   doc = dBuilder.parse(fXmlFile);
	}catch(Exception e){
		//System.out.println(e);
	}
	return doc;
}
*/
public Document getDocumentObject(File fXmlfile){
	try{
		   dbFactory = DocumentBuilderFactory.newInstance();
		   dBuilder = dbFactory.newDocumentBuilder();
		   doc = dBuilder.parse(fXmlFile);
		}catch(Exception e){
			e.printStackTrace();
	}
	return doc;
}
public boolean transformer(Document doc,File fXmlFile){
	boolean flag=false;
	try{
	TransformerFactory transformerFactory = TransformerFactory.newInstance();
	Transformer transformer = transformerFactory.newTransformer();
	Properties outFormat = new Properties();
	outFormat.setProperty(OutputKeys.INDENT, "yes");
	outFormat.setProperty(OutputKeys.METHOD, "xml");
	outFormat.setProperty(OutputKeys.VERSION, "1.0");
	outFormat.setProperty(OutputKeys.ENCODING, "UTF-8");
	transformer.setOutputProperties(outFormat);
	DOMSource domSource = new DOMSource(doc);
	StreamResult result = new StreamResult(fXmlFile.getPath());
	transformer.transform(domSource, result);
	fXmlFile = null;
	doc = null;
	flag=true;
	}catch(Exception exception){
		exception.printStackTrace();
	}
	return flag;
}
/**
 * @author chennakesav.a
 * 
 * This method is used for appending child and adding one attribute to child*/
public boolean appendChildToNode(Document doc,String rootTagName,String childEle,String childTextContent,String attribute,String attrVal,File fXmlFile){
	boolean flag=false;
	dom=new DOMoperations();
	NodeList currentNode=doc.getElementsByTagName(rootTagName);
	if(currentNode.getLength()>0&&currentNode.getLength()==1){
	for(int i=0; i<currentNode.getLength(); i++){
		Node node=currentNode.item(i);
	    if(node.getNodeName().equals(rootTagName)){
		Element child=doc.createElement(childEle);
		if(childTextContent!=null&&!childTextContent.equals("")){
			child.setTextContent(childTextContent);
		}
		if((attribute!=null&&!attribute.equals(""))&&(attrVal!=null&&!attrVal.equals(""))){
			child.setAttribute(attribute, attrVal);
		  }
		node.appendChild(child);
		
		flag=true;
	 }}
	 dom.transformer(doc,fXmlFile);
	 }else{
		flag=false;
	 }
	return flag;
}
/**
 *@author chennakesav.a
 *This method is used for appeneding the child node to  Parent node */
public boolean appendChildToNode(Document doc,String rootTagName,String childEle,String attribute,String attrVal,File fXmlFile){
	boolean flag=false;
	dom=new DOMoperations();
	NodeList currentNode=doc.getElementsByTagName(rootTagName);
	if(currentNode.getLength()>0&&currentNode.getLength()==1){
	for(int i=0; i<currentNode.getLength(); i++){
		Node node=currentNode.item(i);
	    if(node.getNodeName().equals(rootTagName)){
		Element child=doc.createElement(childEle);
		if((attribute!=null&&!attribute.equals(""))&&(attrVal!=null&&!attrVal.equals(""))){
			child.setAttribute(attribute, attrVal);
		  }
		node.appendChild(child);
		
		flag=true;
	 }
	    
	}
	 dom.transformer(doc,fXmlFile);
	 }else{
		flag=false;
	 }
	return flag;
}
/**
 * @author chennakesav.a
 * this method is used for adding attributes to element that to specific tag in specific parentTag with reference of id*/
public boolean addAttributesToSpecificElement(Document doc, String attrName,String attrValue, String element,File fXmlFile,String machedItem,String parentTag){
	boolean flag=false;
	dom =new DOMoperations();
	if(element!=null){
		NodeList node=doc.getElementsByTagName(parentTag);
		for(int i=0; i<node.getLength(); i++){	 
				Node curNode=node.item(i);
				NodeList nodesList=curNode.getChildNodes();
				for(int j=0; j<nodesList.getLength(); j++){
					if(nodesList.item(j).getNodeName().equals(element)){
						Node subChild=nodesList.item(j);
						Element subEle=(Element) subChild;
						NamedNodeMap attrList=subChild.getAttributes();
						 for(int k=0; k<attrList.getLength(); k++){
							 if(attrList.item(k).getNodeValue().equals(machedItem)){
								 subEle.setAttribute(attrName, attrValue);
								 dom.transformer(doc, fXmlFile);
							 }
						 }
					}
				}
			 flag=true; 
		}
	}
	return flag;
}
/**
 * @author chennakesav.a
 * This method is useful while u tring to add child Element to specific parent tag
 * NOTE: IF you know the parent reference Then you can this method
 * */
public boolean addChildNodeTOSpecificElment(Document doc,String parentTag,String parentAttrName,String parentAttrvalue,
											String childElment,String childTextContent,String childattName,
											String childattrVal,File fXmlFile){
	boolean flag=false;
	if(parentTag!=null){
		dom=new DOMoperations();
		NodeList nodes=doc.getElementsByTagName(parentTag);
		for(int i=0; i<nodes.getLength(); i++){
			if(nodes.item(i).getNodeType()==Node.ELEMENT_NODE){
				Element currEle=(Element) nodes.item(i);
				NamedNodeMap currAttrs=currEle.getAttributes();
				if(currAttrs.getNamedItem(parentAttrName).getNodeValue().equalsIgnoreCase((parentAttrvalue))){
							if(childElment!=null&& !childElment.equals("")){
							 Element ele=doc.createElement(childElment);
							 if(childTextContent!=null){
							 ele.setTextContent(childTextContent);
							 }else if(childattName!=null&&!childattName.equals("")){
								 ele.setAttribute(childattName, childattrVal);
							 }
							 currEle.appendChild(ele);
							 dom.transformer(doc, fXmlFile);
							 flag=true;
							}
					}}}} 
	return flag;
}
/*public boolean addAttributesToElementUnderSpecificParent(Document doc,Node parentTag,String TagName,String attrName,String attrVal){
	boolean flag=false;
	dom =new DOMoperations();
	if(parentTag!=null){
		NodeList childNodes=parentTag.getChildNodes();
		for(int i=0; i<childNodes.getLength(); i++){
				Node node=childNodes.item(i);
			//	node.get
		}
	}
	return flag;
}*/
 
/**
 * @author chennakesav.a
 * this method is used for updating the child text content elements*/
 
public boolean updateNodeTextContent(Document doc,String updatedTagName,String textContent,File fXmlFile,Node parentTagName){
	boolean flag=false;
	dom =new DOMoperations();
	if(updatedTagName!=null){
		NodeList nodeList=parentTagName.getChildNodes();
		for(int i=0; i<nodeList.getLength(); i++){
			if(nodeList.item(i).getNodeName().equals(updatedTagName)){
				Node updatedNode=nodeList.item(i);
				Element updatedEle=(Element) updatedNode;
				updatedEle.setTextContent(textContent);
			}}
		dom.transformer(doc, fXmlFile);
		flag=true;
	}else{
		flag=false;
		}
	return flag;
}
/**
 * @author chennakesav.a
 * This method is used for updating attribute of specfic tag name --- It is updating all tags with given specified tag name*//*
public boolean updateAttribute(Document doc,String updatedTagName,GenericSettings serviceObj,File fXmlFile){
	boolean flag=false;
	dom =new DOMoperations();
	if(updatedTagName!=null){
		NodeList nodes=doc.getElementsByTagName(updatedTagName);
		for(int i=0; i<nodes.getLength(); i++){
			if(nodes.item(i).getNodeName().equals(updatedTagName)){
				Node currNode=nodes.item(i);
				Element currEle=(Element) currNode;
				NamedNodeMap attributes=currEle.getAttributes();
			if(attributes.getNamedItem(Utilities.getMessage("TYPE")).getNodeValue().equals(serviceObj.getType())){
				  currEle.getAttributeNode( Utilities.getMessage("TYPE")).setValue(serviceObj.getType());
				  currEle.getAttributeNode( Utilities.getMessage("STATUS")).setValue(serviceObj.getStatus());
				  currEle.getAttributeNode( Utilities.getMessage("VALUE")).setValue(serviceObj.getValue());
			}}}
		dom.transformer(doc, fXmlFile);
		flag=true;
	}
	return flag;
}*/
/**
 * @author chennakesav.a
 * This method is used for updating attributes of an given tagName under specified parent Element*//*
public boolean updateAttributeUnderSpecificParentTag(Document doc,Element parentEle,String TagName,GenericSettings serviceObj,File fXmlFile){
	dom=new DOMoperations();
	boolean flag=false;
	if(parentEle!=null){
		NodeList childNodes=parentEle.getChildNodes();
		for(int i=0; i<childNodes.getLength(); i++){
			if(childNodes.item(i).getNodeName().equals(TagName)){
				Node currNode=childNodes.item(i);
				Element currEle=(Element) currNode;
				NamedNodeMap attributes=currEle.getAttributes();
			if(attributes.getNamedItem(Utilities.getMessage("TEMPLATE_ID")).getNodeValue().equals(serviceObj.getTemplateID())){
				  //currEle.getAttributeNode( Utilities.getMessage("TYPE")).setValue(serviceObj.getType());
				  currEle.getAttributeNode( Utilities.getMessage("STATUS")).setValue(serviceObj.getStatus());
				  currEle.getAttributeNode( Utilities.getMessage("VALUE")).setValue(serviceObj.getValue());
				}}}
		dom.transformer(doc, fXmlFile);
		}return flag;
}*/
 /**
  * @author chennakesav.a
  * This method is used for getting specific element information it involves childs and attributes list*/

@SuppressWarnings({ "rawtypes", "unchecked" })
public List getElementInfo(Element element){
	Map  childsList=null;
	dom=new DOMoperations();
	List  elementInfo=null;
	if(element!=null){
		childsList=new LinkedHashMap(); 
		elementInfo=new ArrayList();
		NodeList nodes=element.getChildNodes();
		if(nodes.getLength()>0){
		for(int i=0; i<nodes.getLength(); i++){
			if(nodes.item(i).getNodeType()== Node.ELEMENT_NODE){
			Node currNode=nodes.item(i);
			 childsList.put(currNode.getNodeName(), currNode.getTextContent()); 
			//elementInfo.add(currNode.getTextContent());
			if(currNode.hasAttributes()){
				 NamedNodeMap attributes=currNode.getAttributes();
				 elementInfo.add(dom.getALLAttributes(attributes));
				}}}
		
		if(!childsList.isEmpty()){
			 elementInfo.add(childsList);	 
		}}}
	return elementInfo;
	}
@SuppressWarnings({ "rawtypes", "unchecked"})
public List getAllElementsWithGivenTagName(String tagName,Document doc){
	List elementsInfo=null;
	Map elementObj=null;
	List tempObj=null;
	String tempStr=null;
	if(tagName!=null){
		dom=new DOMoperations();
		elementsInfo=new ArrayList();
		elementObj=new LinkedHashMap();
		NodeList nodes=doc.getElementsByTagName(tagName);
		for(int i=0; i<nodes.getLength(); i++){
			Node node=nodes.item(i);
			if(node.hasAttributes()){
				NamedNodeMap attrList=node.getAttributes();
				for(int j=0; j<attrList.getLength(); j++){
					tempStr=attrList.item(j).getNodeValue();
				}}
			if(node.hasChildNodes()){
			Element element=(Element) node;
			tempObj=dom.getElementInfo(element);
			}
			elementObj.put(tempStr, tempObj);
			}
		elementsInfo.add(elementObj);
		}
 
	return elementsInfo;
}
@SuppressWarnings({ "rawtypes", "unchecked"})
public List getSpecificElementInfo(Element element,String attrName ,String attrVal){
	List elementInfo=null;
	Map<String,List> elementMapObj=null;
	List tempObj=null;
	if(element!=null){
		elementMapObj=new LinkedHashMap();
		dom=new DOMoperations();
		elementInfo=new ArrayList();
		if(element.hasAttributes()){
			NamedNodeMap attrList=element.getAttributes();
			if(attrList.getNamedItem(attrName).getNodeValue().equalsIgnoreCase(attrVal)){
				if(element.hasChildNodes()){
					tempObj=dom.getElementInfo(element);
				}
				elementMapObj.put(attrList.getNamedItem(attrName).getNodeValue(),tempObj);
				elementInfo.add(elementMapObj);
			}
		}
	}
	return elementInfo;
}
/**
 * @author chennakesav.a
 * This method is used for retriving the all atrribites of specified nodeMap*/
 
@SuppressWarnings({ "unchecked", "rawtypes" })
public List getALLAttributes(NamedNodeMap nodeMap){
	Map attrMap=null;
	atrrList=new ArrayList();
	if(nodeMap!=null){
		attrMap=new LinkedHashMap();
		for(int i=0; i<nodeMap.getLength(); i++){
			attrMap.put(nodeMap.item(i).getNodeName(), nodeMap.item(i).getNodeValue());
		}
		 
		//System.out.println("string"+atrrList.toString());
	}
	return atrrList;
}
/**
 * @author chennakesav.a
 * This method is used for getting total count  of child elements under specified parent element*/
public int getElementCount(Node node,String tagName){
	int size=0;
	if(node!=null){
		NodeList childNodes=node.getChildNodes();
		for(int i=0; i<childNodes.getLength(); i++){
			if(childNodes.item(i).getNodeName().equals(tagName)){
				size=size+1;
			}
		}
	}
	return size;
}
/**
 * @author chennakesav.a
 * This method is used for deleting the specificChilds under specified parent Node*/
public boolean removeChildElementsOfSpecifiedParentElemet(Node parentTag,String tagName,Document doc,File fXmlFile){
	boolean flag=false;
	if(parentTag!=null){
		dom=new DOMoperations();
		NodeList childNodes=parentTag.getChildNodes();
		for(int i=0; i<childNodes.getLength(); i++){
			if(childNodes.item(i).getNodeName().equals(tagName)){
				Node node=childNodes.item(i);
				parentTag.removeChild(node);
			}
				flag=true;
				dom.transformer(doc, fXmlFile);
			}}
	return flag;
}

/**
 * @author chennakesav.a
 * This is used for checking status of an template tag and giving response as per user confirmation message
 * This method is for perticular this project only
 * */
/*public Element  checkTemplateStatus(String parentTag,Document doc,String msg){
	Element ele=null;
	if(parentTag!=null){
		NodeList nodes=doc.getElementsByTagName(parentTag);
		for(int i=0; i<nodes.getLength(); i++){
			Element currele=(Element) nodes.item(i);
			NamedNodeMap currEleAttr=currele.getAttributes();
			if(currEleAttr.getNamedItem(Utilities.getMessage("STATUS")).getNodeValue().equals(Utilities.getMessage("STATUS_ACTIVE"))){
				if(msg==null||msg.equals("")){
					return currele;
				}else{ 
					if(Utilities.getMessage("YES").equalsIgnoreCase(msg)){
					currEleAttr.getNamedItem(Utilities.getMessage("STATUS")).setNodeValue(Utilities.getMessage("STATUS_INACTIVE"));
					}else if((Utilities.getMessage("NO").equalsIgnoreCase(msg))){
						return currele;
					  }else{
						  return currele;
					  }
				 }	
			}
		}
	}
	return ele;
}*/
/**
 * @author chennakesav.a
 * This method is used for checking given attribute exist with given value*/
public Element checkAttributeValueExist(Element parentTag,String attrValue,String attrName){
	Element searchElment=null;
	if(parentTag!=null){
		NodeList  childNodes=parentTag.getChildNodes();
		for(int i=0; i<childNodes.getLength(); i++){
			if(childNodes.item(i).getNodeType()==Node.ELEMENT_NODE){
				Node node=childNodes.item(i);
				NamedNodeMap attributes=node.getAttributes();
				 if(attributes.getNamedItem(attrName).getNodeValue().equalsIgnoreCase(attrValue)){
					 searchElment=(Element) node;
				 }
			}
		}		
	}
	return searchElment;
}
 
 
}


