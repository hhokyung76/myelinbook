package com.myelinbook.hcat;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hive.conf.HiveConf;
import org.apache.hadoop.hive.metastore.HiveMetaStore;
import org.apache.hadoop.hive.shims.ShimLoader;
import org.apache.hive.hcatalog.api.HCatAddPartitionDesc;
import org.apache.hive.hcatalog.api.HCatClient;
import org.apache.hive.hcatalog.api.HCatClient.DropDBMode;
import org.apache.hive.hcatalog.api.HCatCreateDBDesc;
import org.apache.hive.hcatalog.api.HCatCreateTableDesc;
import org.apache.hive.hcatalog.api.HCatPartition;
import org.apache.hive.hcatalog.common.HCatConstants;
import org.apache.hive.hcatalog.data.schema.HCatFieldSchema;
import org.apache.hive.hcatalog.data.schema.HCatFieldSchema.Type;
import org.junit.Assert;

import com.facebook.fb303.FacebookBase;
import org.apache.commons.lang.ArrayUtils;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.hive.metastore.HiveMetaStoreClient;
import org.apache.hadoop.hive.metastore.api.MetaException;
import org.apache.hadoop.hive.metastore.api.NoSuchObjectException;
import org.apache.hadoop.hive.metastore.api.Table;
import org.apache.hadoop.hive.ql.metadata.Hive;
import org.apache.hadoop.hive.serde2.typeinfo.PrimitiveTypeInfo;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.WritableComparable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.security.*;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;
import org.apache.hive.hcatalog.common.HCatUtil;
import org.apache.hive.hcatalog.data.HCatRecord;
import org.apache.hive.hcatalog.mapreduce.HCatInputFormat;
import org.apache.thrift.TException;
import org.apache.thrift.meta_data.EnumMetaData;

import java.security.PrivilegedExceptionAction;
import java.util.regex.Pattern;

public class HcatTest {

    private static final String HIVE_METASTORE_SASL_ENABLED = "hive.metastore.sasl.enabled";
    private static final String HIVE_METASTORE_KERBEROS_PRINCIPAL = "hive.metastore.kerberos.principal";
    private static final String HADOOP_RPC_PROTECTION = "hadoop.rpc.protection";
    
	public void createTable(String db, String table) throws Exception {
		HCatClient hcatClient = null; 
	    List<HCatFieldSchema> cols = new ArrayList<HCatFieldSchema>();
	    cols.add(new HCatFieldSchema("userid", Type.INT, "userid"));
	    cols.add(new HCatFieldSchema("viewtime", Type.BIGINT, "view time"));
	    cols.add(new HCatFieldSchema("pageurl", Type.STRING, "page url visited"));
	    cols.add(new HCatFieldSchema("ip", Type.STRING, "IP Address of the User"));

	    // Remove this once NotificationListener is fixed and available in HCat snapshot
	    Map<String, String> tblProps = new HashMap<String, String>();
	    tblProps.put(HCatConstants.HCAT_MSGBUS_TOPIC_NAME, "hcat." + db + "." + table);
	    HCatCreateTableDesc tableDesc = HCatCreateTableDesc.create(db, table, cols).fileFormat("textfile")
	            .tblProps(tblProps ).build();
	    hcatClient.createTable(tableDesc);
	    List<String> tables = hcatClient.listTableNamesByPattern(db, "*");
	    assertTrue(tables.contains(table));
	}
	
	public static void main(String[] args) throws NoSuchObjectException, MetaException, TException, IOException {
		System.setProperty("hadoop.home.dir", "d:\\hadoop\\");

		System.setProperty("HADOOP_USER_NAME", "hdfs");
		System.setProperty("HADOOP_GROUP_NAME", "hive");
		
		System.setProperty("HADOOP_USER_NAME", "hdfs");
		System.setProperty("HADOOP_GROUP_NAME", "hive");
		Configuration conf = new Configuration();
		conf.set("fs.default.name", "hdfs://192.168.0.44:8020");
		
//		Configuration conf = new Configuration();
//		conf.set("fs.defaultFS","hdfs://192.168.0.44:8020"); 
        System.out.println("*********" + conf.get("hive.metastore.execute.setugi"));

//        FileSystem fileSystem = FileSystem.get(URI.create("hdfs://cdh5hakerberosnn.alpinenow.local:8020"), conf);
//        for (FileStatus fs : fileSystem.listStatus(new Path("/"))) {
//            System.err.println(fs.getPath().getName());
//        }
        /*hcatalog example*/
        HiveConf hiveConf = null;
        HCatClient hiveclient = null;
        hiveConf = new HiveConf(conf, HiveConf.class);
        // specified a thrift url
        hiveConf.set(HIVE_METASTORE_SASL_ENABLED, "true");
        //hiveConf.set(HIVE_METASTORE_KERBEROS_PRINCIPAL, "hive/_HOST@"+System.getProperty("java.security.krb5.realm"));
//        String protection = conf.get(HADOOP_RPC_PROTECTION,
//                SaslRpcServer.QualityOfProtection.AUTHENTICATION.name()
//                        .toLowerCase());
//        hiveConf.set(HADOOP_RPC_PROTECTION, protection);
        hiveConf.set("hive.security.metastore.authorization.manager", "org.apache.hadoop.hive.ql.security.authorization.StorageBasedAuthorizationProvider");
        hiveConf.set("hive.security.metastore.authenticator.manager", "org.apache.hadoop.hive.ql.security.HadoopDefaultMetastoreAuthenticator");
        hiveConf.set("hive.metastore.pre.event.listeners", "org.apache.hadoop.hive.ql.security.authorization.AuthorizationPreEventListener");
        hiveConf.set("hive.metastore.execute.setugi", "true");
        HiveMetaStoreClient metaStoreClient  = HCatUtil.getHiveClient(hiveConf);
        Table table = HCatUtil.getTable(metaStoreClient, "default", "sample_07").getTTable();
        System.out.println(table.getCreateTime());

        System.out.println("*********" + hiveConf.get("hive.metastore.execute.setugi"));
        hiveclient = HCatClient.create(hiveConf);
        System.out.println("hive default database:");
        for (String name : hiveclient.listTableNamesByPattern(null, "*")) {
            System.err.println(name);
        }
	}
}
