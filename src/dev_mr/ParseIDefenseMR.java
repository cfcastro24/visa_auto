import java.io.IOException;
import java.util.StringTokenizer;

import java.util.ArrayList;
import java.util.regex.*;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;

public class ParseIDefenseMR {

  public static class TokenizerMapper 
       extends Mapper<Object, Text, Text, NullWritable>{
    
    private final static NullWritable nullChar = NullWritable.get();
    private Text word = new Text();
    
public static String parseIDefense(String line) {
		
		String[] tokens = line.split(",");
		
		
		String type = tokens[0];
		String format = tokens[1];
		String value = tokens[2];
		String role = tokens[3];
		
		// OPTIONAL.
		String sampleMD5 = tokens[4];
		
		String lastObserved = tokens[5];
		
		// OPTIONAL.
		String comment = tokens[6];
		
		// OPTIONAL.
		String refID = tokens[7]; 
		
		return type + "\t" + format + "\t" + value + "\t" + role + "\t" + sampleMD5 + "\t" + 
		lastObserved + "\t" + comment + "\t" + refID;
		
		
		
		}
	}
      
    public void map(Object key, Text value, Context context
                    ) throws IOException, InterruptedException {
     try {
    	 
    	 
    	 String record = parseIDefense(value.toString());
    	 word.set(record);
         context.write(word, nullChar);
         
         
     } catch (Exception e) {
    	 System.out.println(value.toString());
    	 
     }
     
    	

    }
  }
  
  public static void main(String[] args) throws Exception {
    Configuration conf = new Configuration();
    String[] otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();
    if (otherArgs.length != 2) {
      System.exit(2);
    }
    Job job = new Job(conf, "Parser");
    
    //turns of reducer
    job.setNumReduceTasks(0);
    
    job.setJarByClass(ParseIDefenseMR.class);
    job.setMapperClass(TokenizerMapper.class);
    job.setCombinerClass(IntSumReducer.class);
    job.setReducerClass(IntSumReducer.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(IntWritable.class);
    FileInputFormat.addInputPath(job, new Path(otherArgs[0]));
    FileOutputFormat.setOutputPath(job, new Path(otherArgs[1]));
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
}