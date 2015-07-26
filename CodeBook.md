- title: "Code Book"
- author: "David Morton"
- date: "July 26, 2015"


===========================================
Transformations
===========================================
1. Created complete datasets for each training and testing by combining the labels, sets, and subjects for each
2. Brought the test and training sets together in one unified dataset
3. Filtered out the data that was not a straight mean or standard deviation
4. Applied human readable names for the activities
5. Applied human readable names for the variables
6. Grouped the dataset by subject who participated and their activity
7. Summarized each of the variables getting the mean for the groupings (e.g. subject 1, SITTING)

===========================================
Raw Data
===========================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

===========================================
Variables
===========================================

"subject_id"
- The subject who performed the activity for each window sample. Its range is from 1 to 30.
    
"activity"
- Acitvity Name - one of 6 values
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
      
The columns below are features selected for analyhsis and are broken down by sevaral levels:
- Level 1 - 'time' OR 'frequency'
  - 'time.': time domains that were captured at a consistent rate of 50 Hz. Applies to features from the accelerometer and gyroscope
  - 'frequency.': features withe frequency doman signals, that is where a Fast Fourier Transformation was applied

- Level 2 - 'body' OR 'gravity'
  - 'body.': indicates the body signal when the acceleration or gyroscope signals was used (a further level of refinement)
  - 'gravity.': indicates the body signal when ONLY the acceleration signal was used (a further level of refinement)

- Level 3 - 'accelerometer' OR 'gyroscope'
  - 'accelerometer.': indicates the base raw signal type 
  - 'gyroscope.': indicates the base raw signal type (using a 3-axle gyroscope)
  
- Level 4 (if applied) - 'jerk' 
  - 'jerk.': when body linear acceleration and angular velocity where used

- Level 5 (if applied) - 'magnitude' 
  - 'magnitude.': magnitude of the three-dimensional signals calculated using the Euclidean norm

- Level 6 - 'mean' OR 'stddev'
  - 'mean.': the mean that was estimated for each combination of levels 1-5 & 7  
  - 'stddev.': the standard deviation that was estimated for each combination of levels 1-5 & 7  

- Level 7 (if applied) - 'x', 'y' OR 'z'
  - The axis that was measured
  - does not apply when level 5 is measured

"time.body.accelerometer.mean.x"
"time.body.accelerometer.mean.y"                         
"time.body.accelerometer.mean.z"
"time.body.accelerometer.stddev.x"                       
"time.body.accelerometer.stddev.y"
"time.body.accelerometer.stddev.z"                       
"time.gravity.accelerometer.mean.x"
"time.gravity.accelerometer.mean.y"                      
"time.gravity.accelerometer.mean.z"
"time.gravity.accelerometer.stddev.x"                    
"time.gravity.accelerometer.stddev.y"
"time.gravity.accelerometer.stddev.z"                    
"time.body.accelerometer.jerk.mean.x"
"time.body.accelerometer.jerk.mean.y"                    
"time.body.accelerometer.jerk.mean.z"
"time.body.accelerometer.jerk.stddev.x"                  
"time.body.accelerometer.jerk.stddev.y"
"time.body.accelerometer.jerk.stddev.z"                  
"time.body.gyroscope.mean.x"
"time.body.gyroscope.mean.y"                             
"time.body.gyroscope.mean.z"
"time.body.gyroscope.stddev.x"                           
"time.body.gyroscope.stddev.y"
"time.body.gyroscope.stddev.z"                           
"time.body.gyroscope.jerk.mean.x"
"time.body.gyroscope.jerk.mean.y"                        
"time.body.gyroscope.jerk.mean.z"
"time.body.gyroscope.jerk.stddev.x"                      
"time.body.gyroscope.jerk.stddev.y"
"time.body.gyroscope.jerk.stddev.z"                      
"time.body.accelerometer.magnitude.mean"
"time.body.accelerometer.magnitude.stddev"               
"time.gravity.accelerometer.magnitude.mean"
"time.gravity.accelerometer.magnitude.stddev"            
"time.body.accelerometer.jerk.magnitude.mean"
"time.body.accelerometer.jerk.magnitude.stddev"          
"time.body.gyroscope.magnitude.mean"
"time.body.gyroscope.magnitude.stddev"                   
"time.body.gyroscope.jerk.magnitude.mean"
"time.body.gyroscope.jerk.magnitude.stddev"              
"frequency.body.accelerometer.mean.x"
"frequency.body.accelerometer.mean.y"                    
"frequency.body.accelerometer.mean.z"
"frequency.body.accelerometer.stddev.x"                  
"frequency.body.accelerometer.stddev.y"
"frequency.body.accelerometer.stddev.z"                  
"frequency.body.accelerometer.jerk.mean.x"
"frequency.body.accelerometer.jerk.mean.y"               
"frequency.body.accelerometer.jerk.mean.z"
"frequency.body.accelerometer.jerk.stddev.x"             
"frequency.body.accelerometer.jerk.stddev.y"
"frequency.body.accelerometer.jerk.stddev.z"             
"frequency.body.gyroscope.mean.x"
"frequency.body.gyroscope.mean.y"                        
"frequency.body.gyroscope.mean.z"
"frequency.body.gyroscope.stddev.x"                      
"frequency.body.gyroscope.stddev.y"
"frequency.body.gyroscope.stddev.z"                      
"frequency.body.accelerometer.magnitude.mean"
"frequency.body.accelerometer.magnitude.stddev"          
"frequency.body.body.accelerometer.jerk.magnitude.mean"
"frequency.body.body.accelerometer.jerk.magnitude.stddev"
"frequency.body.body.gyroscope.magnitude.mean"
"frequency.body.body.gyroscope.magnitude.stddev"         
"frequency.body.body.gyroscope.jerk.magnitude.mean"
"frequency.body.body.gyroscope.jerk.magnitude.stddev"  



