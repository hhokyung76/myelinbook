package com.myelinbook.hcat;

import java.util.ArrayList;

import org.apache.hadoop.conf.Configuration;
import org.apache.hive.hcatalog.api.HCatClient;
import org.apache.hive.hcatalog.common.HCatException;
import org.apache.hive.hcatalog.data.schema.HCatFieldSchema;
import org.apache.hive.hcatalog.data.schema.HCatFieldSchema.Type;


public class HCatUpdateExample {

	public static void main(String[] args) throws HCatException {
		// TODO Auto-generated method stub
		//String db = HCatConstants.db;
        //String tableOne = HCatConstants.tableOne;

        System.setProperty("hadoop.home.dir", "d:\\hadoop\\");

		System.setProperty("HADOOP_USER_NAME", "hdfs");
		System.setProperty("HADOOP_GROUP_NAME", "hive");
		
		System.setProperty("HADOOP_USER_NAME", "hdfs");
		System.setProperty("HADOOP_GROUP_NAME", "hive");
		Configuration conf = new Configuration();
		conf.set("fs.default.name", "hdfs://192.168.0.44:8020");
        // create HCatClient
        HCatClient client = HCatClient.create(conf);

        // update table - this will remove old columns
        ArrayList<HCatFieldSchema> cols = new ArrayList<HCatFieldSchema>();
        cols.add(new HCatFieldSchema("id", Type.INT, "id comment"));
        cols.add(new HCatFieldSchema("value", Type.STRING, "value comment"));
        cols.add(new HCatFieldSchema("addr", Type.STRING, "addr comment"));
        client.updateTableSchema("default", "sample_07", cols);

        System.out.println("Updated Hive table");
        client.close();
	}

}
