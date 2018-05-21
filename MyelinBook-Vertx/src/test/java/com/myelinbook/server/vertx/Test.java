package com.myelinbook.server.vertx;

import io.vertx.core.Handler;
import io.vertx.core.MultiMap;
import io.vertx.core.Vertx;
import io.vertx.core.http.HttpMethod;
import io.vertx.core.http.HttpServer;
import io.vertx.core.http.HttpServerRequest;
import io.vertx.core.http.HttpServerResponse;
import io.vertx.core.json.JsonObject;
import io.vertx.ext.web.Route;
import io.vertx.ext.web.Router;

public class Test {

	public static void main(String[] args) {
		
		Vertx vertx = Vertx.vertx();
		HttpServer httpServer = vertx.createHttpServer();
		Handler<HttpServerRequest> httpHandler = new Handler<HttpServerRequest>() {

			@Override
			public void handle(HttpServerRequest event) {
				HttpServerResponse httpResponse = event.response();
				httpResponse.end("Hello World!");
			}
		};

		Router router = Router.router(vertx);
		Route route = router.route(HttpMethod.POST, "/some/path/");
		
		route.handler(routingContext -> {

			System.out.println("000099999");
			HttpServerRequest request = routingContext.request();
			MultiMap params = request.params();

			String method = params.get("METHOD");
			System.out.println(method);

			request.endHandler(empty -> {

				JsonObject param = new JsonObject();
				params.forEach(entry -> param.put(entry.getKey(), entry.getValue()));

				request.response().putHeader("content-type", "application/json");
				request.response().end("{\"METHOD\": \"" + method + "\"}");

			});

		});
		httpServer.requestHandler(httpHandler).listen(8080);
		
	}
}
