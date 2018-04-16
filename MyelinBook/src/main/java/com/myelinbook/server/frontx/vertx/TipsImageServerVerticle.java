package com.mediaflow.tips.server.vertx;

import static com.mediaflow.tips.common.Constants.IMG_FLAG_CHECK;
import static com.mediaflow.tips.common.Constants.IMG_FLAG_MAIN;
import static com.mediaflow.tips.common.Constants.IMG_FLAG_PHOTO;
import static com.mediaflow.tips.common.Constants.IMG_FLAG_TAG;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;

import com.google.gson.Gson;
import com.mediaflow.tips.server.dao.domain.TipsImage;
import com.mediaflow.tips.server.dao.domain.TipsProdImgData;
import com.mediaflow.tips.server.dao.domain.TipsShootPhotoImg;
import com.mediaflow.tips.server.dao.service.TipsImageService;
import com.mediaflow.tips.server.message.entity.FileInfo;
import com.mediaflow.tips.server.message.entity.TipsImgData;
import com.mediaflow.tips.server.thumbimg.TipsImageResizer;
import com.mediaflow.tips.utils.OpenStringUtils;

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
 * 테스트 
 * 92 : curl -H "Content-Type: application/json" --data '{"productId":"201802090004","rfid":"rfid11111","fileFlag":"92","fileList":[{"fileName":"test0.jpg","filePath":"/tipsImg/92/20180220101011/","fileFullPath":"tipsImg/92/20180220101011/test0.jpg"},{"fileName":"test1.jpg","filePath":"tipsImg/92/20180220101011/","fileFullPath":"/tipsImg/92/20180220101011/test1.jpg"}]}' http://192.168.0.99:9090/tips/image/add
 * 93 : curl -H "Content-Type: application/json" --data '{"productId":"201802090004","rfid":"rfid11111","fileFlag":"93","fileList":[{"fileName":"test0.jpg","filePath":"/tipsImg/93/20180220101011/","fileFullPath":"tipsImg/93/20180220101011/test0.jpg"},{"fileName":"test1.jpg","filePath":"tipsImg/93/20180220101011/","fileFullPath":"/tipsImg/93/20180220101011/test1.jpg"}]}' http://192.168.0.99:9090/tips/image/add
 *  curl -H "Content-Type: application/json" --data '{"productId":"","rfid":"11","fileFlag":"92","fileList":[{"tipsImgId":"","fileName":"butterfly-1391809_960_720.jpg","filePath":"/tipsImg/92/20180319170201","fileFullPath":"/tipsImg/92/20180319170201/butterfly-1391809_960_720.jpg"}]}' http://192.168.0.99:9090/tips/image/add
 */

public class TipsImageServerVerticle extends AbstractVerticle {
	private static final Logger logger = LoggerFactory.getLogger(TipsImageServerVerticle.class);


    private double thumbImagePercent = 0.1;
    
	private ApplicationContext context;
	private Gson gson;
	private TipsImageService tipsImageService;
	private TipsImageResizer tipsImageResizer;

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
		tipsImageService = (TipsImageService) context.getBean("tipsImageService");
		tipsImageResizer = new TipsImageResizer();
		logger.info("Starting: " + OpenStringUtils.getCurrentTimeFullDisplayHmmss());
		Router router = Router.router(vertx);
		// add a handler which sets the request body on the RoutingContext.
		router.route().handler(BodyHandler.create());
		// expose a POST method endpoint on the URI: /analyze
		//router.post("/analyze").handler(this::analyze);
		router.post("/tips/image/add").handler(this::addTipsImage);
		//router.get("/analyzeget").handler(this::analyzeget);

		vertx.createHttpServer().requestHandler(router::accept).listen(9090);
	}

	public void addTipsImage(RoutingContext context) {
		// the POSTed content is available in context.getBodyAsJson()
		JsonObject body = context.getBodyAsJson();

		logger.info("bodyText: " + body.encode());
		String message = body.encode();

		String productId = body.getString("productId");
		logger.info("productId: " + productId);
		// System.out.println("postedText: "+postedText);
		
		TipsImgData imgData = gson.fromJson(message, TipsImgData.class);
		logger.info("imgData: " + imgData.toString());
		String fileFlag = imgData.getFileFlag();
		String returnJson = tipsMessageProcessing(imgData);
		// a JsonObject wraps a map and it exposes type-aware getters
		logger.info("returnJson: " + returnJson);
		
		context.response().setStatusCode(201).end(returnJson);
	}

	// handle anything POSTed to /analyze
	public void analyze(RoutingContext context) {
		// the POSTed content is available in context.getBodyAsJson()
		
		JsonObject body = context.getBodyAsJson();

		// a JsonObject wraps a map and it exposes type-aware getters
		String postedText = body.getString("text");
		// System.out.println("postedText: "+postedText);
		logger.info("postedText: " + postedText);
		context.response().end("You POSTed JSON which contains a text attribute with the value: " + postedText + "\n");
	}

	// handle anything POSTed to /analyze
	public void analyzeget(RoutingContext context) {
		// the POSTed content is available in context.getBodyAsJson()
		String body = context.request().getParam("test");
		// String body = context.getget("test");

		// System.out.println("postedText: "+postedText);
		logger.info("postedText: " + body);
		context.response().end("You POSTed JSON which contains a text attribute with the value: " + body + "\n");
	}

	@Override
	public void stop() {
		logger.info("Shutting down application");
	}
	
	private String tipsMessageProcessing(TipsImgData imgData) {

		String returnJson = "{}";
//		TipsImgData imgData = (TipsImgData) tinyMsg;
		String fileFlag = imgData.getFileFlag();

		try {
			addTipsImageData(imgData);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		switch (fileFlag) {
		case IMG_FLAG_MAIN: // 91 제품메인이미지.
			logger.info("case PT_CONNECTION " + imgData);

			logger.info("imgData.getFileList().size() : "+imgData.getFileList().size());
			if (imgData.getFileList().size() > 0) {
				FileInfo fileInfo = imgData.getFileList().get(0);
				logger.info("fileInfo : "+fileInfo);
				TipsProdImgData prodImg = new TipsProdImgData();
				prodImg.setProdId(imgData.getProductId());
				prodImg.setRfidTag(imgData.getRfid());
				prodImg.setmImgId(Integer.parseInt(fileInfo.getTipsImgId()));

				logger.info("getProdImg before  : "+prodImg);
				logger.info("tipsImageService before  : "+tipsImageService);
				TipsProdImgData temp = tipsImageService.getProdImg(prodImg);
				logger.info("getProdImg after : "+temp);
				if (temp != null) {
					tipsImageService.modProdImg(prodImg);
				} else {
					//tipsImageService.addProdImg(prodImg);
				}

				logger.info("getProdImg after  : "+OpenStringUtils.getCurrentTimeFullDisplayHmmss());
			}

			String imgData91Json = gson.toJson(imgData);
			logger.info("93 toJson: "+imgData91Json);
			
			returnJson = imgData91Json;
			
			break;

		case IMG_FLAG_CHECK: // 92 검수이미지
			logger.info("My Name is IMG_FLAG_CHECK =" + imgData.toString());
			int index = 0;
			

			String imgData92Json = gson.toJson(imgData);
			logger.info("92 toJson: "+imgData92Json);
			
			returnJson = imgData92Json;
			
			break;

		case IMG_FLAG_TAG: // 93  케어택 이미지.
			logger.info("My Name is IMG_FLAG_TAG =" + imgData.toString());
			int tindex = 0;


			String imgData93Json = gson.toJson(imgData);
			logger.info("93 toJson: "+imgData93Json);
			
			returnJson = imgData93Json;
			break;

		case IMG_FLAG_PHOTO: // 94
			logger.info("My Name is IMG_FLAG_PHOTO =" + imgData.toString());
			if (imgData.getFileList().size() > 0) {
				TipsShootPhotoImg modPhotoImg = new TipsShootPhotoImg();
				modPhotoImg.setProdId(imgData.getProductId());
				tipsImageService.modPhoto(modPhotoImg);
				for (int ii = 0; ii < imgData.getFileList().size(); ii++) {
					FileInfo fileInfo = imgData.getFileList().get(ii);
					TipsShootPhotoImg photoImg = new TipsShootPhotoImg();
					photoImg.setProdId(imgData.getProductId());
					photoImg.setOrder(ii+1);					
					photoImg.setTipsImgId(Integer.parseInt(fileInfo.getTipsImgId()));	
					tipsImageService.addPhoto(photoImg);
				}	
			}			

			String imgData94Json = gson.toJson(imgData);
			logger.info("94 toJson: "+imgData94Json);
			
			returnJson = imgData94Json;
			
			break;
			
		default:
			break;
		}
		
		return returnJson;
	}

	/**
	 * 이미지를 저장 폴더에 생성 및 thumbnail 이미지 생성.
	 * tb_image  테이블에 tipsImage 인서트 처리. 
	 * @param imgData
	 * @throws IOException
	 */
	private void addTipsImageData(TipsImgData imgData) throws IOException {
		for (int ii = 0; ii < imgData.getFileList().size(); ii++) {
			FileInfo fileInfo = imgData.getFileList().get(ii);

			logger.info("### tipsImageFtpPath: " + tipsImageFtpPath);
			File file = new File(tipsImageFtpPath + fileInfo.getFileFullPath());

			logger.info("addTipsImageData file path: " + file.getAbsolutePath());

			String dayPath = OpenStringUtils.getCurrentDay();
			File filePathDt = new File(
					tipsImagePath + File.separator + imgData.getFileFlag() + File.separator + dayPath);
			if (!filePathDt.exists()) {
				filePathDt.mkdirs();
			}

			String extension = FilenameUtils.getExtension(file.getName());
			String newFileNameStr = OpenStringUtils.getRandomUUID();
			String newFileName = newFileNameStr + "." + extension;
			String newFileThumbImgName = newFileNameStr + "-thumb." + extension;
			String newFileThumbImgFullPathName = filePathDt + File.separator + newFileThumbImgName;

			File newFile = new File(filePathDt + File.separator + newFileName);
			FileUtils.moveFile(file, newFile);

			logger.info("addTipsImageData moveFile end..." + newFile.getAbsolutePath());
			TipsImage image = new TipsImage();
			image.setExtension(extension.toLowerCase());
			image.setOriginNm(file.getName());
			image.setNewNm(newFileName);
			image.setPath(filePathDt.getPath());
			image.setPartFlag(imgData.getFileFlag());
			image.setPartDate(dayPath);
			image.setThumbNm(newFileThumbImgName);

			tipsImageResizer.resize(newFile.getAbsolutePath(), newFileThumbImgFullPathName, thumbImagePercent);
			
			int imageId = tipsImageService.add(image);

			logger.info("tipsImageService.add end...imageId : " + image.getImgId());

			fileInfo.setTipsImgId(Integer.toString(image.getImgId()));
			//fileInfo.setTipsImage(image);
		}

	}
}
