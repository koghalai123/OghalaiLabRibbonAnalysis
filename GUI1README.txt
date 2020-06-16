Instructions for analyzing a dataset:
1. add all the necessary files to a folder in Matlab
2. add bfmatlab amd sphereFit to the path. This needs to be done everytime Matlab is restarted. Just right click it and you will see an option to do this
3. Launch GUI1.mlapp
4. Run the program
5. Enter the filename of the dataset into the "File Name" entry and press the "Load Data" button. This will load in the data from t he datset and save the metadata. 
It takes 2-3 mins normally.
6. Use the various settings on the first page of the left hand tab group to set settings which look good for this particular data set. You can check how it looks by pressing 
the "Graph 1 Slice" button. You can also select the type of organ you want to look at, after putting in which organ corresponds to each channel of the dataset. Using the "Look
At Slice" entry, you can flip between slices easily, and it automatically updates the graphs
7. The first screen in the "Preliminary Viewing" tab is the actual data from the data set along with the places where the program detected a organ. The second screen is 
the data after it has been thresholded and enhanced, and the last screen is the second screen wtih the detected organs as well. The "Show Circles" button allows the detected 
organ locations to be toggled on and off. DO NOT TOUCH THE "SET CIRCLES" OR "USE CIRCLES" BUTTON.
8. The contrast and brightness of the dataset can be set with their respective sliders(You will have to go full screen to see it). I usually set their values to be about half of
the maximum. This doesnt change the data, but allows ribbons to be seen much more clearly, and will carry over to viewing the final data.
9. EXPLANATIONS OF EACH OF THE SETTINGS: 
UNDER SETTINGS
"Look At Slice" what slice you are looking at.     
"Look at CHannel" what organ you are looking at.    
"Nucleus Sensitivity" how sensitive the nucleus detection program is.    
"Epsilon" The search range for ribbons,in other words, how far apart ribbons have to be to be considered separate.     
"Minimum Ribbon Size" how many pixels the ribbon must take up after having been thresholded. Increase it to get rid of noise, decrease it to make the ribbon detection more sensitive.    
"Nucleus Channel", "Presynaptic Channel", "Postsynaptic Channel", "Last Channel" which channel corresponds to which type of organ.   
"Threshold(Nucleus)", "Presynaptic Threshold", "Postsynaptic Threshold" the minimum intensity for data to be included after the before the image enhancement. Decrease to get more detected organs, increase to get more detections.    
"Nucleus min. Range", ... The minimum/maximum x values of each type of organ. This allows OHC nucleu and ribbons to be removed while still keeping the ones for the IHC.    
"Nucleus Medican Range" ... Removes noise from the channels with the nucleus/ribbons. Increase to get rid of noise, decrease to get more detections.    
"Nucleus Radius Max" how big the nuclei should be. The minimum is 40 less than the maximum.    
"Ribbon Radius" purely for graphing. This just affects how they look in the data analysis, as the program does not detect the size of the ribbons.
UNDER MORE SETTINGS
"First Slice" ... allows the first/last x slices in the dataset to be ignored in the computer detection of organs.    "X rotation"... not implemented yet.    
"Load Data(From workspace)" mainly used for debugging. Just allows the dataset to be run through "loadData.m" so that it can be loaded into the GUI quickly and avoids the calculations. 
"Graph Slice: " allows the final data to be looked at at each slice. The channel button is the same as on the "Settings" tab, and the graphs show up under the "After Analysis" tab
"Update Starting Info" runs the entire dataset through the organ detection programs using the settings inputted by the user. This takes about 8 mins usually. Check to see if it is done using task manager(Once it is done, the CPU used by matlab will disappear).
"Save To" Enter the name of dataset file minus the .czi
"Save" saves the ribbon and nucleus data to a file.
10. Look through the data to see if the computer did a good job. It can be done with the "Graph Slice: " entry, but it is easier if you use the "Check That Data!" entry on the "After Analysis" tab.
It graphs the data in 3D, and allows you to scroll through it to go through slices. Rotate it with the built in tools to get a more intuitive sense of what it actually shows. NOTE:
You cannot add, take away, or scroll while the rotate tool is on, so turn it off before those. Add a ribbon with double left click. Take away ribbons with a right click(This is a '
little buggy and you may have to rotate the view angle before it works).
11. Look at the data using the "3D Graph" tab. The "Graph 3D" entry allows it to be done with xyz as pixels,pixels,slice respectively(using 'pixels'), or with xyz as microns(scaled).
12. The "Background" entry is just a  3D representation that looks pretty cool and shows all the data together.
13. The "NoOverlap" tab gets rid of nuclei that overlap in the X Axis and their associated nuclei.
14. The "Representative" tab shows the associated nuclei and ribbons.

