Fs= 44100;                 
t= 0:1/Fs:2;             
f= 440;                    
y= sin(2*%pi*f*t);

wavwrite(y, Fs, "wave.wav");

[data, Fs_read, bits]= wavread("wave.wav");
disp("Fs: ", Fs_read);
disp("Data", data);
