package com.myelinbook.server.vertx;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;

import com.google.gson.Gson;
import com.myelinbook.utils.OpenStringUtils;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Future;
import io.vertx.core.MultiMap;
import io.vertx.core.http.HttpMethod;
import io.vertx.core.http.HttpServerResponse;
import io.vertx.core.json.JsonObject;
import io.vertx.ext.web.Router;
import io.vertx.ext.web.RoutingContext;
import io.vertx.ext.web.handler.BodyHandler;

/**
 * curl -H "Content-Type: application/json" --data '{"productId":"201802090004","rfid":"rfid11111","fileFlag":"92","fileList":[{"fileName":"test0.jpg","filePath":"/tipsImg/92/20180220101011/","fileFullPath":"tipsImg/92/20180220101011/test0.jpg"},{"fileName":"test1.jpg","filePath":"tipsImg/92/20180220101011/","fileFullPath":"/tipsImg/92/20180220101011/test1.jpg"}]}' http://192.168.0.99:9090/tips/image/add
 * 
 * @author redskin
 * 
 * ?…Œ?Š¤?Š¸ 
 * 92 : curl -H "Content-Type: application/json" --data '{"productId":"201802090004","rfid":"rfid11111","fileFlag":"92","fileList":[{"fileName":"test0.jpg","filePath":"/tipsImg/92/20180220101011/","fileFullPath":"tipsImg/92/20180220101011/test0.jpg"},{"fileName":"test1.jpg","filePath":"tipsImg/92/20180220101011/","fileFullPath":"/tipsImg/92/20180220101011/test1.jpg"}]}' http://192.168.0.99:9090/tips/image/add
 * 93 : curl -H "Content-Type: application/json" --data '{"productId":"201802090004","rfid":"rfid11111","fileFlag":"93","fileList":[{"fileName":"test0.jpg","filePath":"/tipsImg/93/20180220101011/","fileFullPath":"tipsImg/93/20180220101011/test0.jpg"},{"fileName":"test1.jpg","filePath":"tipsImg/93/20180220101011/","fileFullPath":"/tipsImg/93/20180220101011/test1.jpg"}]}' http://192.168.0.99:9090/tips/image/add
 *  curl -H "Content-Type: application/json" --data '{"productId":"","rfid":"11","fileFlag":"92","fileList":[{"tipsImgId":"","fileName":"butterfly-1391809_960_720.jpg","filePath":"/tipsImg/92/20180319170201","fileFullPath":"/tipsImg/92/20180319170201/butterfly-1391809_960_720.jpg"}]}' http://192.168.0.99:9090/tips/image/add
 */

public class MyelinBookVerticle extends AbstractVerticle {
	private static final Logger logger = LoggerFactory.getLogger(MyelinBookVerticle.class);


    private double thumbImagePercent = 0.1;
    
	private ApplicationContext context;
	private Gson gson;
	private String tipsImageFtpPath;
	private String tipsImagePath;
	
	public void setSpringContext(ApplicationContext argContext, String argTipsImageFtpPath, String argTipsImagePath ) {
		this.context = argContext;
		this.tipsImageFtpPath = argTipsImageFtpPath;
		this.tipsImagePath = argTipsImagePath;
		
	}

	@Override
	public void start(Future<Void> future) {
		gson = new Gson();
		logger.info("Starting: " + OpenStringUtils.getCurrentTimeFullDisplayHmmss());
		Router router = Router.router(vertx);
		// add a handler which sets the request body on the RoutingContext.
		router.route().handler(BodyHandler.create());
		// expose a POST method endpoint on the URI: /analyze
		//router.post("/analyze").handler(this::analyze);
		router.post("/myelinbook/book/content/add").handler(this::addMyelinContent);
		router.get("/myelininfo").handler(this::getMyelinInfo);

		vertx.createHttpServer().requestHandler(router::accept).listen(9090);
	}

	public void addMyelinContent(RoutingContext context) {
		// the POSTed content is available in context.getBodyAsJson()
		JsonObject body = context.getBodyAsJson();

		logger.info("bodyText: " + body.encode());
		String message = body.encode();

		String productId = body.getString("productId");
		logger.info("productId: " + productId);
		// System.out.println("postedText: "+postedText);
		
		String returnJson = "";
		context.response().setStatusCode(201).end(returnJson);
	}

	public void getMyelinInfo(RoutingContext context) {
		// the POSTed content is available in context.getBodyAsJson()
//		JsonObject body = context.getBodyAsJson();
//
//		logger.info("bodyText: " + body.encode());
//		String message = body.encode();
//
//		String productId = body.getString("productId");
//		logger.info("productId: " + productId);
//		// System.out.println("postedText: "+postedText);
		
		String returnJson = "test";
		context.response().setStatusCode(201).end(returnJson);
	}
	
	@Override
	public void stop() {
		logger.info("Shutting down application");
	}
	
}
