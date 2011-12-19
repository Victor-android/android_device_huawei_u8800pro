package com.ideos.x5settings;

import java.io.BufferedReader;
import java.io.FileReader;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

public class Sound extends Activity{
	private Button applyButton;
	private SeekBar seekBar;
	private TextView seekBarValue;
	
	public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.sound);
        
        applyButton = (Button) findViewById(R.id.button1);
        seekBar = (SeekBar) findViewById(R.id.seekBar1);
        seekBarValue = (TextView) findViewById(R.id.textView2);
        
        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
      	  public void onProgressChanged(SeekBar seekBar, int progress,boolean fromUser) {
      	    seekBarValue.setText(String.valueOf(progress));
      	   }
      	   
      	   public void onStartTrackingTouch(SeekBar seekBar) {
      	   }

      	   public void onStopTrackingTouch(SeekBar seekBar) {
      	   }
       });
	
        
        applyButton.setOnClickListener(new View.OnClickListener() {
    		public void onClick(View view) {
    			setSound();
          	 }
		});   
        
        getSoundSettings();
	}
	
	public void setSound(){
		boolean WRITE = false;
		
		WRITE = Rootcommands.runRootCommand("mount -o rw,remount -t ext4 /dev/block/mmcblk0p12 /system");
		
		if(WRITE) {
			Rootcommands.runRootCommand("echo " + seekBar.getProgress() + " > /system/etc/volumefactor.txt");
			WRITE = false;
			Toast complete = Toast.makeText(this, R.string.complete, 2000);
			complete.show();
		}
		else {
        	Log.d("X5 Settings", "Error writing file");
		}
	}
	
	public void getSoundSettings() {
		String settings = null;
		try {
			FileReader input = new FileReader("/etc/volumefactor.txt");
	    	BufferedReader reader = new BufferedReader(input);
	    	
	    	settings = reader.readLine();
	    	
	    	reader.close();
	    	input.close();
	    	
          seekBar.setProgress(Integer.valueOf(settings));
		} catch (Exception e) {
			Log.d("X5 Settings", "Unexpected error: "+e.getMessage());
		}
	
	}
}
