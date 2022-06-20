package com.framework.utils;
 
import java.io.*;
import java.nio.charset.Charset;
import java.sql.*;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.ss.formula.functions.T;
import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
 
/*import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;
import org.json.JSONException;
import org.json.JSONObject;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
 */

public class Test {
 
    public static void main(String[] args) {
 
    	
    	RestTemplate restTemplate = new RestTemplate();

    	//Map request = new Map();
    	Map<String, Object> request = new HashMap<>();
    	request.put("amount", 100);
    	request.put("currency", "INR");
    	request.put("receipt", "Receipt no. 1");
    	//restTemplate.h
    	
    	//HttpHeaders headers = new HttpHeaders() 
    	
    	/*{{
	         String auth = "rzp_test_f8H88RD4IRBS5I" + ":" + "rrIJW7KZUq0rnjY33fumIrs3";
	         byte[] encodedAuth = Base64.encodeBase64( 
	            auth.getBytes(Charset.forName("US-ASCII")) );
	         String authHeader = "Basic " + new String( encodedAuth );
	         set( "Authorization", authHeader );
	        
	      }};
	    */  
    	String auth = "rzp_test_f8H88RD4IRBS5I" + ":" + "rrIJW7KZUq0rnjY33fumIrs3";
        byte[] encodedAuth = Base64.encodeBase64( 
           auth.getBytes(Charset.forName("US-ASCII")) );
        String authHeader = "Basic " + new String( encodedAuth );
        //set( "Authorization", authHeader );
	      
	      HttpHeaders headers = new HttpHeaders();
	   // set `content-type` header
	   headers.setContentType(MediaType.APPLICATION_JSON);
	   // set `accept` header
	   headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
	   
	   headers.set( "Authorization", authHeader );
    	
	      HttpEntity<Map<String, Object>> entity = new HttpEntity<>(request, headers);
	      
	      ResponseEntity<JSONObject> response = restTemplate.postForEntity("https://api.razorpay.com/v1/orders", entity, JSONObject.class);
	      System.out.println("foo " + response.getBody().get("id"));
    	//JSONObject foo = restTemplate.postForObject("https://api.razorpay.com/v1/orders", request, JSONObject.class);
	    //  restTemplate.exchange
	     // ("https://api.razorpay.com/v1/orders", HttpMethod.POST, new HttpEntity<T>(header), JSONObject.class);
    	//System.out.println("foo " + foo.toString());
    	
    }
    
   
}