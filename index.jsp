<!DOCTYPE html>
<html>
<head>
<title>Home Page</title>
<link rel="icon" type="image/jpg/png" href="images/Home.jpg">
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	    <link rel="stylesheet" href="userdefine.css">
	    <link rel="stylesheet" href="index.css">
	   	<link rel="stylesheet" href="slide.css">
	      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    </head> 
<body style="margin:0px; background-color:powderblue;">
<%@include file="header.jsp" %>
<div id="sliderbox" style="border:3px solid black; border-style:groove; padding-top:1px;">
<img src="images/chome.jpg" alt="no" width="650" height="200">
<img src="images/coffice.jpg" alt="no" width="650" height="200">
<img src="images/cour1.jpg" alt="no" width="650" height="200">
<img src="images/cour7.jpg" alt="no" width="1000" height="200">
</div>
<div class="container-fluid">
<div class="row">
	<div class="col-md-4 " id="ind1">
    <img src="images/courier3.png" alt="...">
        <h3>Login Credentials</h3>
        <p style="color:blue;"><b>Steps To login</b> </p>
        <ol>
        <li><b>Enter UserName</b></li>
        <li><b>Enter Password</b></li>
        <li><b>Enter Brach Id where you work</b></li>
        <li><b>Click on Login</b></li>
        </ol>
        <p><a href="loginPage.jsp"  class="btn btn-primary" role="button">LOGIN</a></p>
      </div>
	<div class="col-md-4 " id="ind">
     <marquee direction="right"><img src="images/courier3.png" alt="..." ></marquee>
        <h3>Track Consignment Here</h3>
        <p style="color:blue;"><b>Steps To Tracking Shipments</b> </p>
        <ol>
        <li><b>Click On Track Button </b></li>
        <li><b>Enter Shipment Number</b></li>
        <li><b>Click on Get Status Button</b></li>
        </ol>
        <p><a href="trackshipment.jsp" class="btn btn-primary" role="button">Track</a></p>
      </div>
	<div class="col-md-3" id="ind3">
	<ul class="nav nav-stacked" >
  <li role="presentation" class="active"><a href="#aboutus" class="btn btn-primary" role="button">About US</a></li>
  <li role="presentation" class="active"><a href="#services" class="btn btn-primary" role="button">Services</a></li>
  <li role="presentation" class="active"><a href="#terms"class="btn btn-primary" role="button">Terms And Conditions</a></li>
   <li role="presentation" class="active"><a href="#contact"class="btn btn-primary" role="button">Contact US</a></li>
	</ul>
	</div>
</div>
</div><br><br><br><br><br><br><br><br><br><br>
<div id="aboutus" class="container-fluid">
	<h1 align="center" style="color:red; font-size:30px;"><b>-------- About Us ---------</b> </h1>
	<hr>
	<div class="row" style="border:3px solid gray;">
	<div class="col-sm-5">
	<br><br>
	<p align="justify" style="color:black;"><b>
   The Professional Couriers offers a comprehensive range of solutions to <br>the requirements of delivery of Documents/Non-Documents,<br> all types of cargo  high value, critical and urgent shipments all<br> over India and any part of the World.<br> Based on the specific requirements of each individual or <br>corporate the company provides.
	</b></p>
	</div>
<div class="col-sm-5">
 <p align="right"><img src="images/courier4.jpg"></p>
</div>
	</div>
</div><br><br><br><br><br><br><br><br><br><br>
<div id="services" class="container-fluid">
	<h1 align="center" style="color:red; font-size:30px;"><b>-------- Services Provided By Us ---------</b> </h1>
	<hr>
	<div class="row" style="border:3px solid gray;">
	<div class="col-sm-5">
	<br><br>
		<p align="judtify">At DFDS, we believe that safe, secure and timely service is what makes DFDS a leading Express, Distribution & Logistics company in India. DFDS offers a combination of Premium Express Services, Logistics and Warehousing Services and International Express and Cargo Services.

Conforming to our mantra 'Delivering Value', the company offers innovative and superior services worldwide. DFDS also provides a variety of customized solutions, with an eye on its customers' distinct requirements.

In the words of our Chairman and Managing Director Subhasish Chakraborty: "Our position of strength has increased and multiplied our customer base, across individuals and the corporate domain. When we think of tomorrow at DFDS, I believe, that with our growing investments in technology space, our human capital, our innovative product line, our new generation ideas for customer delight, our objectives are more than clear.</p>
	
	</div>
<div class="col-sm-5">
 <p align="right"><img src="images/cour7.jpg" width="300" height="300"></p>
</div>
	</div>
</div><br><br><br><br><br><br><br><br><br><br>
<div id="terms" class="container-fluid">
	<h1 align="center" style="color:red; font-size:30px;"><b>-------- Terms & Conditions ---------</b> </h1>
	<hr>
	<div class="row" style="border:3px solid gray;">
	<div class="col-sm-5">
	<br><br>
<p align="justify">Conditions of Carriage
Applicability the provision set out and referred to in this consignment note shall apply to modes of transport used by DTDC for connection of consignments. They also apply if the mode of transport as described on the face of this consignment note is contrary to the original contract between the parties or performed by one or more modes of transport which may not the defined mode of delivery of the consignment as agreed in this consignment note.</p>
	</div>
<div class="col-sm-5">
 <p align="right"><img src="images/cour5.jpg" width="300" height="300"></p>
</div>
	</div>
</div><br><br><br><br><br><br><br><br><br><br>
<div id="contact" class="container-fluid">
	<h1 align="center" style="color:red; font-size:30px;"><b>-------- Contact Us ---------</b> </h1>
	<hr>
	<div class="row" style="border:3px solid gray;">
	<div class="col-sm-5">
	<h3 align="justify"><b>Head Office Address</b></h3><hr>
	<address>
<b>Dhinchak Fast Delievery Services</b></p>
<p><span class="glyphicon glyphicon-map-marker"></span> &nbsp<b>Bhopal (M.P) India</b></p>
<p><span class="glyphicon glyphicon-arrow-right"></span>&nbsp<b> Pincode No. 462003</b></p>
<p><span class="glyphicon glyphicon-earphone"></span> &nbsp<b>Contact No. 9893114371</b></p>
<p><span class="glyphicon glyphicon-envelope"></span> &nbsp<b>Email Id - Nekramprajapatics@gmail.com</b></p>
	 </address>
	</div>
 <div class="col-sm-5"><br>
  <p align="right"><img src="images/coffice.jpg" width="400" height="200"></p>
 </div>
	</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>