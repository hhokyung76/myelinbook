package com.myelinbook.server.vertx;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.Future;

public class MyVerticle extends AbstractVerticle {

    @Override
    public void start(Future<Void> startFuture) {
        System.out.println("MyVerticle started!");
        vertx.createHttpServer()
        .requestHandler(r -> r.response().end("Welcome to Vert.x Intro")
        )
        .listen(config().getInteger("http.port", 9090), 
          result -> {
            if (result.succeeded()) {
            	startFuture.complete();
            } else {
            	startFuture.fail(result.cause());
            }
        });
    }

    @Override
    public void stop(Future stopFuture) throws Exception {
        System.out.println("MyVerticle stopped!");
    }

}