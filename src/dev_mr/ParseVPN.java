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

public class ParseVPN {

  public static class TokenizerMapper 
       extends Mapper<Object, Text, Text, NullWritable>{
    
    private final static NullWritable nullChar = NullWritable.get();
    private Text word = new Text();
	
public static String parseVPN(String line) {
		
		
		int shift = 0;
		String[] tokens = line.split(" ");
		
		if (tokens[1].isEmpty()) {
			shift = 1;
		} 
		
		String date = tokens[0] + " " + tokens[1 + shift];
		String time = tokens[2 + shift];
		String ip = tokens[3 + shift];
		String port = tokens[4 + shift];
		String date2 = tokens[5 + shift];
		String time2 = tokens[6 + shift];
		String event = tokens[8 + shift];
		
		String[] getmsg = line.split(":");
		String message = getmsg[5].trim();
		
		return (date + " " + time + "|" + ip + "|" + port + "|" + date2 + "|" + time2 + "|" + event + "|" +
				message).trim();
		
	
		
	}
      
    public void map(Object key, Text value, Context context
                    ) throws IOException, InterruptedException {
     try {
    	 
    	 
    	 String record = parseVPN(value.toString());
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
    
    job.setJarByClass(ParseVPN.class);
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