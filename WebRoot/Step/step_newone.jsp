<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Variation Search</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="author" content="wei" />
<meta name="keywords" content="" />
<meta name="describe" content="" />
<link type="text/css" rel="stylesheet" href="Css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="Css/bootstrap-table.min.css" />
<link type="text/css" rel="stylesheet" href="Css/main.css" />
<script type="text/javascript" src="Jscript/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="Jscript/jquery.1.11.3.min.js"></script>
<script type="text/javascript" src="Jscript/bootstrap-table.min.js"></script>
<script src="Jscript/data.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
.loading{
	width:230px;
	height:56px;
	position: absolute;
	top:50%;
	left:45%;
	line-height:56px;
	color:#fff;
	padding-left:60px;
	font-size:15px;
	background: #000 url(images/loader.gif) no-repeat 20px 50%;
	opacity: 0.7;
	z-index:9999;
	-moz-border-radius:20px;
	-webkit-border-radius:20px;
	border-radius:20px;
	filter:progid:DXImageTransform.Microsoft.Alpha(opacity=70);
}
</style>

<body>
	<%@ include file="../ListHeader.jsp"%>
	<h3 style="position:relative;left:4.9%;">Variation Search</h3>
	<br>
	<div class="container" style="height:600px;">
		
		<form action="showNewThree" method="post" onsubmit="return check();">
            <div class="col-md-6" style="width:100%">
			<div class="search">
<style>
table, table tr th, table tr td {
    padding: 8px;
}

::-webkit-scrollbar{
    display:none;
}
</style>
          <div class="form-group row" style="border:solid 1px #ddd">
          <input type="radio" name="search" value="first">
           <b><font size="3">Search for Variation by Variation ID:</font><br></b>
          </br>
          <label class="col-sm-2 col-form-label">Variation Name</label>
          <div class="col-sm-10">
                  <div class="col-sm-8 col-lg-8" style="padding-left:0px">
                      <input id="sel5" readonly="readonly" type="text" name="variation" title="eg:chr1.s_883" placeholder="eg:chr1.s_883" class="eg form-control">
              </div>
          </div>
          </br>
          </br>
              <p>&nbsp;&nbsp;&nbsp;&nbsp;Please input a variation ID (eg:chr1.s_883).</p>
              
              <div id="wait">
			</div>
			
              <button class="btn btn-success form-control" text-algin="left" id="next" float="right" style="height:40px; width: 100px; padding: 0px">Search</button>
          </div>
          <hr>
          
          
          <div class="form-group row" style="border:solid 1px #ddd">
          <input type="radio" name="search" value="second">
           <b><font size="3">Search for Variations by Gene:</font><br></b>
          </br>
              <label class="col-sm-2">Gene ID</label>
              <div class="col-sm-4">
                  <input id="sel4" readonly="readonly" type="text" name="gene" title="eg:GRMZM2G059865" placeholder="eg:GRMZM2G059865" class="eg form-control">
              </div>
              </br>
          		</br>
              <p>&nbsp;&nbsp;&nbsp;&nbsp;Please input a Gene ID (eg:GRMZM2G059865).</p>
              <div class="form-group row">
              <label class="eg col-sm-2 col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;Variation Type</label>
              <div class="col-sm-10">
                  <select class="form-control mul2" disabled="disabled" name="feature" id="sel3">
                  <option value="" disabled selected style='display:none;'>Choose One Variation Type</option>
                  <option value="downstream_gene_variant">downstream_gene_variant</option>
				  <option value="upstream_gene_variant">upstream_gene_variant</option>
                  <option value="synonymous_variant">synonymous_variant</option>
                  <option value="missense_variant">missense_variant</option>
                  <option value="3_prime_UTR_variant">3_prime_UTR_variant</option>
                  <option value="intron_variant">intron_variant</option>
                  <option value="splice_region_variant">splice_region_variant</option>
                  <option value="5_prime_UTR_variantt">5_prime_UTR_variantt</option>
                  <option value="stop_lost">stop_lost</option>
                  <option value="start_lost">start_lost</option>
                  <option value="stop_gained">stop_gained</option>
                  <option value="stop_retained_variant">stop_retained_variant</option>
                  <option value="splice_donor_variant">splice_donor_variant</option>
                  <option value="non_coding_transcript_exon_variant">non_coding_transcript_exon_variant</option>
                  <option value="splice_acceptor_variant">splice_acceptor_variant</option>
                  <option value="coding_sequence_variant">coding_sequence_variant</option>
                  <option value="incomplete_terminal_codon_variant">incomplete_terminal_codon_variant</option>
                  <option value="intergenic_variant">intergenic_variant</option>
                  </select>
              </div>
          </div>
          
          <div class="form-group row" style="margin-top: 20px">
              <label class="eg col-sm-2 col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;Variation effect</label>
              <div class="col-sm-10">
                  <select class="form-control mul2" disabled="disabled" name="effect" id="sel1">
                  <option value="" disabled selected style='display:none;'>Choose One Variation effect</option>
				  <option value="MODIFIER">MODIFIER</option>
				  <option value="MODERATE">MODERATE</option>
				  <option value="LOW">LOW</option>
				  <option value="HIGH">HIGH</option>
                  </select>
              </div>
          </div>
          
          <div id="wait">
			</div>
			
          <button class="btn btn-success form-control" text-algin="left" id="next1" float="right" style="height:40px; width: 100px; padding: 0px">Search</button>
          </div>
          <hr>
          
          
          <div class="form-group row" style="border:solid 1px #ddd">
          <input type="radio" name="search" value="third">
           <b><font size="3">Search for Variations in a Region:</font><br></b>
          </br>
              <label class="eg col-sm-2 col-form-label">Chr/Scaffold</label>
              <div class="col-sm-2">
                  <select class="form-control mul3" disabled="disabled" name="chr" id="sel2">
                  			<option value="" disabled selected style='display:none;'>Choose One Chr/Scaffold</option>
							<option value="1">Chr1</option>
							<option value="2">Chr2</option>
							<option value="3">Chr3</option>
							<option value="4">Chr4</option>
							<option value="5">Chr5</option>
							<option value="6">Chr6</option>
							<option value="7">Chr7</option>
							<option value="8">Chr8</option>
							<option value="9">Chr9</option>
							<option value="10">Chr10</option>
                  </select>
              </div>
              <label class="col-sm-1 col-form-label">between</label>
              <div class="col-sm-2">
                  <input type="text" readonly="readonly" class="eg form-control" title="eg:147" placeholder="eg:147" name="start" id="sh1">
              </div>
              <label class="col-sm-1 col-form-label">and</label>
              <div class="col-sm-2">
                  <input type="text" readonly="readonly" class="eg form-control" title="eg:6782830" placeholder="eg:6782830" name="end" id="sh2">
              </div>
              </br>
              
              <div class="form-group row">
              <label class="eg col-sm-2 col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;Variation Type</label>
              <div class="col-sm-10">
                  <select class="form-control mul3" disabled="disabled" name="feature" id="sel3">
                  <option value="" disabled selected style='display:none;'>Choose One Variation Type</option>
                  <option value="downstream_gene_variant">downstream_gene_variant</option>
				  <option value="upstream_gene_variant">upstream_gene_variant</option>
                  <option value="synonymous_variant">synonymous_variant</option>
                  <option value="missense_variant">missense_variant</option>
                  <option value="3_prime_UTR_variant">3_prime_UTR_variant</option>
                  <option value="intron_variant">intron_variant</option>
                  <option value="splice_region_variant">splice_region_variant</option>
                  <option value="5_prime_UTR_variantt">5_prime_UTR_variantt</option>
                  <option value="stop_lost">stop_lost</option>
                  <option value="start_lost">start_lost</option>
                  <option value="stop_gained">stop_gained</option>
                  <option value="stop_retained_variant">stop_retained_variant</option>
                  <option value="splice_donor_variant">splice_donor_variant</option>
                  <option value="non_coding_transcript_exon_variant">non_coding_transcript_exon_variant</option>
                  <option value="splice_acceptor_variant">splice_acceptor_variant</option>
                  <option value="coding_sequence_variant">coding_sequence_variant</option>
                  <option value="incomplete_terminal_codon_variant">incomplete_terminal_codon_variant</option>
                  <option value="intergenic_variant">intergenic_variant</option>
                  </select>
              </div>
          </div>
              
              <div class="form-group row" style="margin-top: 20px">
              <label class="eg col-sm-2 col-form-label">&nbsp;&nbsp;&nbsp;&nbsp;Variation effect</label>
              <div class="col-sm-10">
                  <select class="form-control mul3" disabled="disabled" name="effect" id="sel1">
                  <option value="" disabled selected style='display:none;'>Choose One Variation effect</option>
				  <option value="MODIFIER">MODIFIER</option>
				  <option value="MODERATE">MODERATE</option>
				  <option value="LOW">LOW</option>
				  <option value="HIGH">HIGH</option>
                  </select>
              </div>
          </div>
          
          <div id="wait">
			</div>
			
          <button class="btn btn-success form-control" text-algin="left" id="next2" float="right" style="height:40px; width: 100px; padding: 0px">Search</button>
              
          </div>
          
          </div>
            <br>
            </div>
 	</form>
 	</div>    
	<%@ include file="../ListFooter.jsp"%>
	
<script type="text/javascript">
	$(document).ready(function() {
		$('input:radio[name="search"]').click(function() {
			var val = $('input:radio[name="search"]:checked').val();
			//alert(val);
			if (val == "first") {
				$("#sel5").removeAttr("readonly");
				
				$("#sel4").attr("readonly", "readonly");
				$(".mul2").attr("disabled", true);
				
				$("#sh1").attr("readonly", "readonly");
				$("#sh2").attr("readonly", "readonly");
				$(".mul3").attr("disabled", true);

			} else if(val == "second"){
				$("#sel4").removeAttr("readonly");
				$(".mul2").attr("disabled", false);
				
				$("#sel5").attr("readonly", "readonly");
				
				$("#sh1").attr("readonly", "readonly");
				$("#sh2").attr("readonly", "readonly");
				$(".mul3").attr("disabled", true);
			} else{
				$(".mul3").attr("disabled", false);
				$("#sh1").removeAttr("readonly");
				$("#sh2").removeAttr("readonly");
				
				$("#sel5").attr("readonly", "readonly");
				
				$("#sel4").attr("readonly", "readonly");
				$(".mul2").attr("disabled", true);
				
			}
		});
	});
	
</script>
	
<script type="text/javascript">
		 $(function() {
			$(".eg").tooltip();
		});
		jQuery.fn.bootstrapTable.defaults.data = data;
	
		function check() {
			//if($("#sel1 :selected").val() == ''){$("#sel1").attr("value",'');}
			//if($("#sel2 :selected").val() == ''){$("#sel2").attr("value",'');}
			//if($("#sel3 :selected").val() == ''){$("#sel3").attr("value",'');}
			
			var vari = /^[a-z][a-z0-9_.]{8,20}$/.test($("#sel5").val());
			var gene = /^(?![0-9]+$)(?![A-Z]+$)[0-9A-Z]{12,17}$/.test($("#sel4").val());
			if(vari == ""&&$("#sel5").val()!='') {
				alert("Please input Variation Name Like chr1.s_883!");
				return false;
			}
			if (gene == ""&&$("#sel4").val()!='') {
				alert("Please input Gene ID Like GRMZM2G059865!");
				return false;
			} 
			
			var start = /^\d+$/.test($("#sh1").val());
			var end = /^\d+$/.test($("#sh2").val());
			var variation = $("#sel5").val();
			var chr = $("#sel2").val();
			if ($("#sel1 :selected").val() == ''&&$("#sel2 :selected").val() == ''&&$("#sel3 :selected").val() == ''&&$("#sel4").val() == ''&&$("#sel5").val() == ''&&$("#sh1").val() == ''&&$("#sh2").val() == '') {
				alert("Please select at least one Option!");
				return false;
			}
			if(variation!=""&&chr!=null&&chr!=variation.substring(3,4)) {
				alert("Please input the same chr and variation name!");
				return false;
			}
			if((!start || !end) && $("#sh2").val() != '' && $("#sh1").val() != '') {
					if(!start && !end) {
						alert("Please input the correct start and end,like 147 and 6782830.");
							
					} else if(!start) {
						alert("Please input the correct start,like 147.");
					} else{alert("Please input the correct end,like 6782830.");}
						return false;
					
			} else if (start && end) {
						if ($("#start").val() != ''&&$("#end").val() != ''&&chr == null) {
								alert("Please select one Chr/Scaffold!");
								return false;
						}
                     	if(parseInt($("#sh1").val()) > parseInt($("#sh2").val())){
                         	  alert("Input start or end position error,please input again.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '1' && parseInt($("#sh2").val()) > 300479650) {
                     		alert("Please input a number of end position less than 300479650.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '2' && parseInt($("#sh2").val()) > 237033410) {
                     		alert("Please input a number of end position less than 237033410.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '3' && parseInt($("#sh2").val()) > 229669323) {
                     		alert("Please input a number of end position less than 229669323.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '4' && parseInt($("#sh2").val()) > 237410737) {
                     		alert("Please input a number of end position less than 237410737.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '5' && parseInt($("#sh2").val()) > 215109004) {
                     		alert("Please input a number of end position less than 215109004.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '6' && parseInt($("#sh2").val()) > 168172808) {
                     		alert("Please input a number of end position less than 168172808.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '7' && parseInt($("#sh2").val()) > 176393750) {
                     		alert("Please input a number of end position less than 176393750.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '8' && parseInt($("#sh2").val()) > 172234845) {
                     		alert("Please input a number of end position less than 172234845.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '9' && parseInt($("#sh2").val()) > 154216405) {
                     		alert("Please input a number of end position less than 154216405.");
                          	 return false;
                     	}
                     	else if($("#sel2").val() == '10' && parseInt($("#sh2").val()) > 146087335) {
                     		alert("Please input a number of end position less than 146087335.");
                          	 return false;
                     	}
						var str = $("<div id='loading' class='loading'>Loading pages...</div>");
						$('#wait').append(str);
						$("#next1").attr("disabled",true);
						$("#next").attr("disabled",true);
						$("#next2").attr("disabled",true);
						$(".form-group").attr("disabled",true);
						return true;
			} else if($("#sh1").val() == '' && $("#sh2").val() != ''){
    					alert(("Please input start position!"));
    					return false;
    		} else if($("#sh2").val() == '' && $("#sh1").val() != ''){
    					alert(("Please input end position!"));
    					return false;
    		}/* else {
						alert("Please input start and end position!");
						return false;
			}*/
			var str = $("<div id='loading' class='loading'>Please Waiting .....</div>");
			$('#wait').append(str);
			$("#next1").attr("disabled",true);
			$("#next").attr("disabled",true);
			$("#next2").attr("disabled",true);
			$(".form-group").attr("disabled",true);
			return true;
		};
	</script>
</body>
</html>