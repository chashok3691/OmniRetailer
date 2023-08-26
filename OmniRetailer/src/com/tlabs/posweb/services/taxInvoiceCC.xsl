
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:astv="http://www.gump.com/astv" xmlns:pdf="http://xmlgraphics.apache.org/fop/extensions/pdf" version="1.1">
<xsl:template match="/">
<fo:root>
<!--    defines the layout master    -->
<fo:layout-master-set>
<fo:simple-page-master master-name="PageMaster-Body" page-height="29.7cm" page-width="15cm" margin="1cm">
<fo:region-body margin-left="0cm" margin-right="0cm" margin-top="4cm" margin-bottom="2cm"/>
<fo:region-before extent="0.5cm" region-name="header"/>
<fo:region-after extent="2cm" region-name="footer"/>
<fo:region-start extent="0cm" region-name="start"/>
<fo:region-end extent="0cm" region-name="end"/>
</fo:simple-page-master>
<fo:page-sequence-master master-name="PageMaster">
<fo:repeatable-page-master-reference master-reference="PageMaster-Body" maximum-repeats="50"/>
</fo:page-sequence-master>
</fo:layout-master-set>
<fo:page-sequence master-reference="PageMaster" initial-page-number="1">
<fo:static-content flow-name="header" height="5in" padding-bottom="30pt">
<fo:block text-align="center">
<fo:inline font-size="6pt" color="black" font-family="Courier" font-style="italic" font-weight="600">
<fo:external-graphic src="url('{/astv:ShipmentReceipt/logo}')" content-height="scale-to-fit" height="0.50in" content-width="2.00in" scaling="non-uniform"/>
</fo:inline>
</fo:block>
<!-- <fo:block font-size="20pt" text-align="center" font-family="Courier" >
<xsl:text>Tax Invoice </xsl:text>
</fo:block> -->
</fo:static-content>
<fo:flow flow-name="xsl-region-body">

<fo:block font-size="20pt" text-align="center" font-family="Courier" >
<xsl:text>Tax Invoice </xsl:text>
</fo:block>
<fo:block font-family="Courier" padding-top="20px" padding-bottom="1px">
<xsl:apply-templates select="/astv:ShipmentReceipt/billItems"/>
</fo:block>
<!--

 <fo:block text-align="left" padding-top="30px" padding-bottom="5px" font-size="10pt">
<xsl:text>Purchase Order Approved By</xsl:text>
</fo:block>
<fo:block text-align="left" padding-bottom="5px" font-size="10pt">
<xsl:value-of select="/astv:PurchaseOrder/order_approved_by"/>
</fo:block> 
-->
</fo:flow>
</fo:page-sequence>
</fo:root>
</xsl:template>
<xsl:template xmlns:astv="http://www.gump.com/astv" name="Item_Details" match="/astv:ShipmentReceipt/billItems">
<fo:block padding-bottom="1px">
<fo:table table-layout="fixed" width="90%" border-after-style="solid" border="solid 0.5mm black">
<fo:table-column column-number="1" column-width="60pt" border="solid 0.1mm black"/>
<fo:table-column column-number="2" column-width="180pt" border="solid 0.1mm black"/>
<fo:table-column column-number="3" column-width="50pt" border="solid 0.1mm black"/>
<fo:table-column column-number="4" column-width="50pt" border="solid 0.1mm black"/>
<fo:table-column column-number="5" column-width="80pt" border="solid 0.1mm black"/>
<fo:table-column column-number="6" column-width="60pt" border="solid 0.1mm black"/>
<fo:table-column column-number="7" column-width="45pt" border="solid 0.1mm black"/>
<fo:table-column column-number="8" column-width="45pt" border="solid 0.1mm black"/>
<fo:table-column column-number="9" column-width="45pt" border="solid 0.1mm black"/>
<fo:table-column column-number="10" column-width="45pt" border="solid 0.1mm black"/>
<fo:table-column column-number="11" column-width="45pt" border="solid 0.1mm black"/>
<fo:table-column column-number="12" column-width="80pt" border="solid 0.1mm black"/>
<!-- <fo:table-column column-number="13" column-width="41pt" border="solid 0.1mm black"/>
<fo:table-column column-number="14" column-width="41pt" border="solid 0.1mm black"/>
<fo:table-column column-number="15" column-width="28pt" border="solid 0.1mm black"/>
<fo:table-column column-number="16" column-width="28pt" border="solid 0.1mm black"/>
<fo:table-column column-number="17" column-width="55pt" border="solid 0.1mm black"/> -->



<fo:table-header>

<fo:table-row padding-top="10px">

<fo:table-cell number-columns-spanned="12" border="1px solid #444" text-align="center" padding="15px">
<fo:block text-align="left" padding-top="0mm" font-size="19" font-style="italic">
<xsl:text font-weight="bold" >CELLMAX</xsl:text> 
</fo:block>

<fo:block text-align="left" padding-top="0mm">
<xsl:for-each select="/astv:ShipmentReceipt/locationObj/Itemloc">
<fo:inline font-size="10pt" font-family="Times New Roman" padding-left="2mm">
<xsl:value-of select="/astv:ShipmentReceipt/area"/>
<xsl:text/>
<xsl:value-of select="/astv:ShipmentReceipt/address"/>
<xsl:text/>
<xsl:value-of select="/astv:ShipmentReceipt/locationId"/>
<xsl:text/>
<xsl:value-of select="/astv:ShipmentReceipt/area"/>
</fo:inline>
<xsl:value-of select="/astv:ShipmentReceipt/officePhone"/>
</xsl:for-each>
</fo:block>
<fo:block text-align="left" padding-top="0mm">

<fo:inline font-size="10pt" font-family="Times New Roman"  padding-left="2mm">
<xsl:text font-weight="bold">cell   :</xsl:text>
<xsl:value-of select="/astv:ShipmentReceipt/phone"/>
<xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text font-weight="bold">Email   :</xsl:text>
<xsl:value-of select="/astv:ShipmentReceipt/storeEmail"/>
<xsl:text/>
</fo:inline>

</fo:block>
</fo:table-cell>
</fo:table-row>




<fo:table-row padding-top="10px">
<fo:table-cell number-columns-spanned="8" border="1px solid #444" text-align="center" padding="15px">
<fo:block text-align="left" >
<fo:inline color="#000" font-weight="bold" font-size="11pt">
<xsl:text>Customer </xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>:</xsl:text>
</fo:inline>
<xsl:value-of select="/astv:ShipmentReceipt/customerName"/>
</fo:block>

<fo:block text-align="left" >
<fo:inline color="#000" font-weight="bold" font-size="11pt">
<xsl:text>Mobile Number </xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>:</xsl:text>
</fo:inline>
<xsl:value-of select="/astv:ShipmentReceipt/phoneNumber"/>

</fo:block>



<fo:block text-align="left" padding-top="15px" >
<fo:inline color="#000" font-weight="bold" font-size="11pt">
<xsl:text>GSTN </xsl:text><xsl:text>:</xsl:text>
</fo:inline>
<xsl:value-of select="/astv:ShipmentReceipt/gstIn"/>


<fo:inline color="#000" font-weight="bold"  font-size="11pt">
<xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>State Code </xsl:text><xsl:text>:</xsl:text>
</fo:inline>
<xsl:value-of select="/astv:ShipmentReceipt/poRef"/>


<fo:inline color="#000" font-weight="bold" font-size="11pt" >
<xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>&#160;</xsl:text><xsl:text>POS </xsl:text><xsl:text>:</xsl:text>
</fo:inline>
<xsl:value-of select="/astv:ShipmentReceipt/store_location"/>

</fo:block>

</fo:table-cell>



<fo:table-cell number-columns-spanned="4" border="1px solid #444"  padding="15px" text-align="right">
<fo:block text-align="left" padding-bottom="15px" >
<fo:inline color="#000"  font-weight="bold" font-size="11pt">
<xsl:text>Invoice NO </xsl:text>:
</fo:inline>
<xsl:value-of select="/astv:ShipmentReceipt/billId"/>

</fo:block>
<fo:block text-align="left" >
<fo:inline color="#000" font-weight="bold" font-size="11pt">
<xsl:text>Date </xsl:text>:
</fo:inline>
<xsl:value-of select="/astv:ShipmentReceipt/bill_date"/>

</fo:block>

</fo:table-cell>




</fo:table-row>








<fo:table-row >
<fo:table-cell text-align="left"   padding="5px"  background-color="#eee">
<fo:block font-size="10pt" >
<fo:inline color="#333">
<xsl:text>S.No</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>
<fo:table-cell text-align="left" padding="5px"  background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>Description of Goods or Services</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="left" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>Qty</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="left" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>UOM</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="left" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>Rate</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>
<fo:table-cell text-align="left" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>HSNCode</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="right" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>Total</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>






<fo:table-cell text-align="center" number-columns-spanned="2" border="solid 0.1mm black"  padding="5px"  background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>CGST</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>




<fo:table-cell text-align="center" number-columns-spanned="2" border="solid 0.1mm black"  padding="5px"  background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>SGST</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="center" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>TotalS With GST</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>
</fo:table-row>






<fo:table-row border="2px solid #444">
<fo:table-cell text-align="left" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt" >
<fo:inline color="#333">
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>
<fo:table-cell text-align="left" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>


<fo:table-cell text-align="left" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>


<fo:table-cell text-align="left" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>



<fo:table-cell text-align="center" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>



<fo:table-cell text-align="center" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>


<fo:table-cell text-align="start" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>


<fo:table-cell text-align="start" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>Rate</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>


<fo:table-cell text-align="start" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>Amt</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>


<fo:table-cell text-align="start"   padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>Rate</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="center" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text>Amt</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="center" padding="5px" border="solid 0.1mm black" background-color="#eee">
<fo:block font-size="10pt">
<fo:inline color="#333">
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>


</fo:table-row>


</fo:table-header>
<fo:table-body>
<xsl:for-each select="/astv:ShipmentReceipt/billItems/Item">
<fo:table-row border="1px solid #444">

<fo:table-cell text-align="left" padding="5px" background-color="rgb(255,255,255)">
<fo:block font-size="10pt">
<xsl:number value="position()"/>
</fo:block>
</fo:table-cell>
<fo:table-cell text-align="start" padding="5px" background-color="rgb(255,255,255)">
<fo:block font-size="10pt">
<xsl:value-of select="@item_name"/><xsl:value-of select="@item_name"/>
</fo:block>
</fo:table-cell>
<fo:table-cell text-align="start" padding="8px" background-color="rgb(255,255,255)">
<fo:block font-size="10pt">
<xsl:value-of select="@quantity"/>
<!-- <xsl:text>@quantity</xsl:text> -->
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="start" padding="8px" background-color="rgb(255,255,255)">
<fo:block font-size="10pt">
<xsl:text >PC</xsl:text>
</fo:block>
</fo:table-cell>
<fo:table-cell text-align="start" padding="8px" background-color="rgb(255,255,255)">
<fo:block font-size="10pt">
<xsl:value-of select="@mrp"/>
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="start" padding="8px" background-color="rgb(255,255,255)">
<fo:block font-size="10pt">
<xsl:value-of select="@hsnCode"/>
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="start" padding="8px" background-color="rgb(255,255,255)">
<fo:block font-size="10pt">
<xsl:value-of select="@netCost"/>
</fo:block>
</fo:table-cell>



<fo:table-cell text-align="start" padding="8px" background-color="rgb(255,255,255)">
<fo:block font-size="10pt">
<xsl:value-of select="format-number(@taxRate div 2,'##.###')"/>
</fo:block>
</fo:table-cell>
<fo:table-cell text-align="start" padding="8px" background-color="rgb(255,255,255)">
<fo:block font-size="10pt">
<xsl:value-of select="format-number(@taxCost div 2,'##.###')"/>
</fo:block>
</fo:table-cell>
<fo:table-cell text-align="start" padding="8px" background-color="rgb(255,255,255)">
<fo:block font-size="10pt">
<xsl:value-of select="format-number(@taxRate div 2,'##.###')"/>
<!-- <xsl:value-of select="format-number(@itemPrice,'##.###')-(@cgstValue+@sgstValue)"/> -->
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="start" padding="8px" background-color="rgb(255,255,255)">
<fo:block font-size="10pt">
<xsl:value-of select="format-number(@taxCost div 2,'##.###')"/>
</fo:block>
</fo:table-cell>



<fo:table-cell text-align="start" padding="8px" background-color="rgb(255,255,255)">
<fo:block font-size="10pt">
<xsl:value-of select="format-number(@netCost,'##.###')+format-number(@taxCost div 2,'##.###')"/>
</fo:block>
</fo:table-cell>


</fo:table-row>
</xsl:for-each>
<fo:table-row  padding-top="20px">

<fo:table-cell text-align="center" font-size="12px" font-weight="bold" padding="5px" number-columns-spanned="2" border="1px solid #444" background-color="#eee">
<fo:block font-size="12pt" >
<fo:inline>
<xsl:text >Totals</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>
<!-- <fo:table-cell border="1px solid #444"  text-align="start" padding="5px">
<fo:block font-size="10pt">
<fo:inline>
<xsl:text>Total</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell> -->



<fo:table-cell text-align="start" padding="5px" border="1px solid #444">
<fo:block font-size="10pt">
<xsl:value-of select="/astv:ShipmentReceipt/totalQuantityOfBill"/>
</fo:block>
</fo:table-cell>
<fo:table-cell text-align="start" padding="5px" border="1px solid #444">
<fo:block font-size="10pt">
<xsl:text></xsl:text>
</fo:block>
</fo:table-cell>
<fo:table-cell text-align="start" padding="5px" border="1px solid #444">
<fo:block font-size="10pt">
<xsl:text></xsl:text>
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="start" padding="5px" border="1px solid #444">
<fo:block font-size="10pt">
<xsl:text></xsl:text>
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="start" padding="5px" border="1px solid #444">
<fo:block font-size="10pt">
<xsl:text></xsl:text>
</fo:block>
</fo:table-cell>

<fo:table-cell text-align="start" padding="5px" border="1px solid #444">
<fo:block font-size="10pt">
<!-- <xsl:value-of select="format-number(/astv:ShipmentReceipt/tax div 2,'##0.00###')"/> -->
<xsl:text></xsl:text>
<!-- <xsl:value-of select="/astv:ShipmentReceipt/cgstAmt"/> -->
</fo:block>
</fo:table-cell>

 <xsl:for-each select="/astv:ShipmentReceipt/taxAggregationListByTaxRate/Taxlist">
<fo:table-cell text-align="start" padding="5px" border="1px solid #444">
<fo:block font-size="10pt">
<xsl:value-of select="@totalTax"/>
<xsl:text></xsl:text>
</fo:block>
</fo:table-cell>
</xsl:for-each>

<fo:table-cell text-align="start" padding="5px" border="1px solid #444">
<fo:block font-size="10pt">
<xsl:text></xsl:text>
</fo:block>
</fo:table-cell>

 <xsl:for-each select="/astv:ShipmentReceipt/taxAggregationListByTaxRate/Taxlist">
<fo:table-cell text-align="start" padding="5px" border="1px solid #444">
<fo:block font-size="10pt">
<xsl:value-of select="@totalTax"/>
</fo:block>
</fo:table-cell>
</xsl:for-each>

<fo:table-cell text-align="start" padding="5px" border="1px solid #444">
<fo:block font-size="10pt">
<!-- <xsl:value-of select="/astv:ShipmentReceipt/subTotal"/> -->
<xsl:value-of select="/astv:ShipmentReceipt/subTotal+/astv:ShipmentReceipt/tax"/>
<!-- <xsl:value-of select="/astv:PurchaseOrder/subTotal+/astv:PurchaseOrder/total_tax"></xsl:value-of> -->
</fo:block>
</fo:table-cell>
</fo:table-row>


<fo:table-row padding-top="10px">
<fo:table-cell number-columns-spanned="5" text-align="left" padding="5px">
<fo:block font-size="10pt">
<fo:inline>
<xsl:text>(In Words)</xsl:text>:
</fo:inline>
</fo:block>
</fo:table-cell>
<fo:table-cell number-columns-spanned="3" border="1px solid #444"  padding="5px" text-align="right">
<fo:block font-size="10pt">
<fo:inline>
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>


<fo:table-cell number-columns-spanned="2" border="1px solid #444"  padding="5px" text-align="right">
<fo:block font-size="10pt">
<fo:inline>
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>

<fo:table-cell number-columns-spanned="2" border="1px solid #444"  padding="5px" text-align="right">
<fo:block font-size="10pt">
<fo:inline>
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>
</fo:table-row>



<fo:table-row padding-top="10px">
<fo:table-cell number-columns-spanned="5"  text-align="left" padding="5px">
<fo:block font-size="10pt" font-weight="bold" >
<fo:inline>
<xsl:text>

For Warranty Contact Authorized Service center:

</xsl:text>
</fo:inline>
</fo:block>

<fo:block font-size="10pt" text-align="left" font-weight="bold" >
<fo:inline>
<xsl:text>
Description:
</xsl:text>
</fo:inline>
</fo:block>

<fo:block font-size="10pt">
<fo:inline>
<xsl:text>

We declare that this invoice shows the actual  price of the goods  
</xsl:text>
</fo:inline>
</fo:block>

<fo:block font-size="10pt">
<fo:inline>
<xsl:text>
described and that all particulars are true and correct
 
</xsl:text>
</fo:inline>
</fo:block>

<fo:block font-size="10pt">
<fo:inline>
<xsl:text>
Whether tax is payable on Reverse charge "NO"
</xsl:text>
</fo:inline>
</fo:block>

<fo:block font-size="10pt">
<fo:inline>
<xsl:text>
Goods Once Sold Will  be taken back
</xsl:text>
</fo:inline>
</fo:block>

</fo:table-cell>
<fo:table-cell number-columns-spanned="3" padding="5px" text-align="left">

 <xsl:for-each select="/astv:ShipmentReceipt/billingTransactions/ItemBill">
<fo:block font-size="10pt"  padding-bottom="10px" font-weight="bold">
<fo:inline>
<xsl:value-of select="@modeOfPayment"></xsl:value-of>: <xsl:value-of select="@paidAmount"></xsl:value-of>
</fo:inline>
</fo:block>
</xsl:for-each>
<!-- <fo:block font-size="10pt" padding-bottom="10px" font-weight="bold">
<xsl:for-each select="/astv:ShipmentReceipt/billingTransactions/ItemBill">
<fo:inline>
<xsl:text>Credit Card</xsl:text> : <xsl:value-of select="/astv:ShipmentReceipt/totalPrice"></xsl:value-of>
</fo:inline>
</xsl:for-each>
</fo:block>

<fo:block font-size="10pt" font-weight="bold">
<fo:inline>
<xsl:text>Check</xsl:text>
</fo:inline>
</fo:block> -->

</fo:table-cell>

<fo:table-cell number-columns-spanned="2" font-weight="bold" border="1px solid #444"  text-align="center">
<fo:block font-size="10pt">
<fo:inline>
<xsl:text>Net Amt</xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>

<fo:table-cell number-columns-spanned="2"  border="1px solid #444"   text-align="center">
<fo:block font-size="10pt">
<fo:inline>
<xsl:value-of select="/astv:ShipmentReceipt/subTotal+/astv:ShipmentReceipt/tax"/>
</fo:inline>
</fo:block>
</fo:table-cell>


</fo:table-row>







<fo:table-row padding-top="10px">
<fo:table-cell number-columns-spanned="5" text-align="center" padding="5px">
<fo:block font-size="10pt">
<fo:inline>
<xsl:text/>
</fo:inline>
</fo:block>
</fo:table-cell>
<fo:table-cell number-columns-spanned="3"   padding="5px" text-align="right">
<fo:block font-size="10pt">
<fo:inline>
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>


<fo:table-cell number-columns-spanned="4" padding="10px"    text-align="right">
<fo:block font-size="10pt">
<fo:inline>
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell>
</fo:table-row>




</fo:table-body>
</fo:table>
</fo:block>
<!-- <fo:block font-size="10pt" text-align="left" padding-top="3mm" font-family="Courier">
<fo:table>
<fo:table-column/>
<fo:table-column/>
<fo:table-column column-number="3" column-width="500pt"/>
<fo:table-column column-width="200pt"/>
<fo:table-column column-width="150pt"/>
<fo:table-body>
<fo:table-row>
<fo:table-cell>
<fo:block text-align="left"/>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="left"/>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="left"/>
</fo:table-cell>
<fo:table-cell padding-top="20px">
<fo:block text-align="left">
<fo:block text-align="left" font-size="11"/>
<fo:table>
<fo:table-column column-width="240pt"/>
<fo:table-column column-width="240pt"/>
<fo:table-body>
<fo:table-row>
<fo:table-cell>
<fo:block text-align="left" font-weight="bold">
<xsl:text>Other Tax</xsl:text>
</fo:block>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="left" font-weight="bold">
<xsl:value-of select="/astv:ShipmentReceipt/total_tax"/>
</fo:block>
</fo:table-cell>
</fo:table-row>
<fo:table-row>
<fo:table-cell padding-right="0px">
<fo:block text-align="center" padding-top="3px" padding-bottom="4px" padding="56px" border-after-width="thin" color="#ccc" border-after-style="solid" padding-left="0px">
<fo:inline font-size="4pt" font-family="Courier" font-style="italic" font-weight="1000">
<xsl:text/>
</fo:inline>
</fo:block>
</fo:table-cell>


 <fo:table-cell    padding-top="10px" color="#ccc" padding-bottom="10px" >
<fo:block text-align="center" border-after-width="thin"  border-after-style="solid" padding-left="0px" padding-right="100px">
<fo:inline font-size="4pt" color="#ccc" font-family="Courier" font-style="italic" font-weight="1000">
<xsl:text></xsl:text>
</fo:inline>
</fo:block>
</fo:table-cell> 

</fo:table-row>
<fo:table-row>

<fo:table-cell padding-top="5px">
<fo:block text-align="left" font-weight="bold">
<xsl:value-of select="/astv:ShipmentReceipt/shipping_cost"/>
</fo:block>
</fo:table-cell>
</fo:table-row>
<fo:table-row>
<fo:table-cell>
<fo:block text-align="left">
<xsl:text>Insurance</xsl:text>
</fo:block>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="left">
<xsl:value-of select="/astv:ShipmentReceipt/insurance"/>
</fo:block>
</fo:table-cell>
</fo:table-row>
<fo:table-row>
<fo:table-cell>
<fo:block text-align="left">
<xsl:text>Packing and Forwarding Charges</xsl:text>
</fo:block>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="left">
<xsl:value-of select="/astv:ShipmentReceipt/insurance"/>
</fo:block>
</fo:table-cell>
</fo:table-row>
<fo:table-row>
<fo:table-cell padding-right="0px">
<fo:block text-align="center" padding-top="3px" padding-bottom="4px" padding="56px" border-after-width="thin" color="#ccc" border-after-style="solid" padding-left="0px">
<fo:inline font-size="4pt" color="#ccc" font-family="Courier" font-style="italic" font-weight="1000">
<xsl:text/>
</fo:inline>
</fo:block>
</fo:table-cell>
</fo:table-row>
<fo:table-row>
<fo:table-cell padding-top="15px">
<fo:block text-align="left">
<xsl:text>Total Invoice Value(In figures)</xsl:text>
</fo:block>
</fo:table-cell>
<fo:table-cell padding-top="15px">
<fo:block text-align="left" font-weight="bold">
<xsl:value-of select="/astv:ShipmentReceipt/total_po_value"/>
</fo:block>
</fo:table-cell>
</fo:table-row>
<fo:table-row>
<fo:table-cell>
<fo:block text-align="left">
<xsl:text>Total Invoice Value(In words)</xsl:text>
</fo:block>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="left">
<xsl:text/>
</fo:block>
</fo:table-cell>
</fo:table-row>
<fo:table-row>
<fo:table-cell padding-top="0px">
<fo:block text-align="left" font-weight="bold">
<xsl:value-of select="/astv:ShipmentReceipt/totalPoinWords"/>
</fo:block>
</fo:table-cell>
<fo:table-cell padding-top="0px">
<fo:block text-align="left">
<xsl:text/>
</fo:block>
</fo:table-cell>
</fo:table-row>
<fo:table-row>
<fo:table-cell>
<fo:block text-align="left">
<xsl:text>Amount of Tax subject to Reverse Charges</xsl:text>
</fo:block>
</fo:table-cell>
<fo:table-cell>
<fo:block text-align="left"></fo:block>
</fo:table-cell>
</fo:table-row>
</fo:table-body>
</fo:table>
</fo:block>
</fo:table-cell>
</fo:table-row>
</fo:table-body>
</fo:table>
</fo:block> -->
</xsl:template>
</xsl:stylesheet>
