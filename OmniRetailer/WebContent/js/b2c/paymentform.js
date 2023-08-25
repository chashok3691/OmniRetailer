		 function validatePaymentGatewayform(id){
			 paymentgateway={}
			 
			 if($("#merchantId").val().trim()==''){
					$("#Error").html("Enter merchantId");
					return;
				}
			 if($("#merchantKey").val().trim()==''){
					$("#Error").html("Enter merchantKey");
					return;
				}
			 if($("#walletMerchantId").val().trim()==''){
					$("#Error").html("Enter walletMerchantId");
					return;
				}
			 if($("#walletMerchantPwd").val().trim()==''){
					$("#Error").html("Enter walletMerchantPwd");
					return;
				}
			 
			 var walletAggregator="";
			   if($("#PayTM1").val()!=""){
				   walletAggregator=$("#PayTM1").val()+",";
			   }
			   else{
				   walletAggregator="empty"+",";
			   }
			    if($("#OLA1").val()!=""){
				   walletAggregator=walletAggregator+$("#OLA1").val()+",";
			    }
			    else{
					   walletAggregator=walletAggregator+"empty"+",";
				   }
			     if($("#MobiQwick1").val()!=""){
				   walletAggregator=walletAggregator+$("#MobiQwick1").val();
			     }
			     else{
			    	 walletAggregator = walletAggregator.substring(0, walletAggregator.length - 1);
			     }
			     
			     paymentgateway.organizationName=$("#selectedPaymentGateway").val();
			     paymentgateway.masterCard= $('#checkboxmaster').prop('checked');
			     paymentgateway.visaCard =$('#checkboxvisa').prop('checked');
			     paymentgateway.amexCard =$('#checkboxamex').prop('checked');
			     paymentgateway.storeCardInfo =$('#checkboxinfo').prop('checked');
			     paymentgateway.onlineMerchantId =$("#merchantId").val();
			     paymentgateway.onlineMerchantPwd= $("#merchantKey").val();
			     paymentgateway.onlineBankingAggregator=$("#selectedWalletAggregator").val();
			     paymentgateway.walletMerchantId= $("#walletMerchantId").val();
			     paymentgateway.walletMerchantPwd= $("#walletMerchantPwd").val();
			     paymentgateway.walletAggregationEnabled = true;
			     paymentgateway.allWalletSupport = true;
			     paymentgateway.onlineBankingEnabled = true;
			     paymentgateway.walletAggregator=walletAggregator;
			     paymentgateway.sno = $("#onlinesno").val();
					contextPath =$("#contextPath").val();
			    
		
					var sno = $("#onlinesno").val();
			if(sno=='')	{
				  paymentgateway.onlineMerchantId =$("#merchantId").val();
				     paymentgateway.onlineMerchantPwd= $("#merchantKey").val();
				     URL = contextPath + "/b2c/savePaymentGateWay.do";
			}	
			
			else{
				  paymentgateway.newMerchantId =$("#merchantId").val();
				  paymentgateway.newMerchantPwd= $("#merchantKey").val();
				 paymentgateway.newWalletMerchantId= $("#walletMerchantId").val();
			     paymentgateway.newWalletMerchantPwd= $("#walletMerchantPwd").val();
				 URL = contextPath + "/b2c/updatePaymentGateWay.do";	
			}
			 var formData = JSON.stringify(paymentgateway);
				console.info(formData);
			 
			 $.ajax({
				 
					type: "POST",
					url : URL,
					contentType: "application/json",
					data : formData,
					
					 beforeSend: function(xhr){                    
				   			$("#loading").css("display","block");
				   			$("#mainDiv").addClass("disabled");
			  	   	},
					success : function(result) {
						$("#right-side").html(result);
						$("#loading").css("display","none");
						$("#mainDiv").removeClass('disabled');
					},
					error : function() {
						 alert("something went wrong");
						 $("#loading").css("display","none");
			 			 $("#mainDiv").removeClass('disabled');
					}
				});
		}
		 
		 function viewEditPaymentGatWay(operation){
			 var contextPath = $("#contextPath").val();
			 URL = contextPath + "/b2c/getPaymentGateWay.do";
			$.ajax({
				type: "GET",
				url : URL,
				data : {
					//newarrivalId : newarrivalId,
					operation : operation
				},
				beforeSend: function(xhr){                    
			   			$("#loading").css("display","block");
			   			$("#mainDiv").addClass("disabled");
			   		  },
				success : function(result) {
					$("#right-side").html(result);
					$("#loading").css("display","none");
					$("#mainDiv").removeClass('disabled');
				},
				error : function() {
					 alert("something went wrong");
					 $("#loading").css("display","none");
					 $("#mainDiv").removeClass('disabled');
				}
			});
		}
