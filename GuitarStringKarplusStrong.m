
f = 440;

fs = 44100;

a = 0.75;

d = 0.99;

x_n = 0; % this is a random value for part 1

x_nm1 = 0; % this is a random value for part 1

% 1. difference_equation(y_n) with x_n(current input), x_nm1(previous input), a(brightness), d(decay factor)

y_n = d * ( a * x_n + (1-a) * x_nm1 );

% 3. your chord or melody

Note1 = k_strong(440, fs, d);

soundsc(Note1,fs);

pause(0.8);

Note1 = k_strong(440, fs, d);

soundsc(Note1,fs);

pause(0.5);

Note1 = k_strong(523.25, fs, d);

soundsc(Note1,fs);

pause(0.3);

Note1 = k_strong(587.33, fs, d);

soundsc(Note1,fs);

pause(0.2);

Note1 = k_strong(659.25, fs, d);

soundsc(Note1,fs);

pause(0.5);



% 2. karplus strong algorithm

function y = k_strong(f, fs, d)

% when we are at the 1st sample of the buffer, the "previous" sample of a circular buffer is actually the last sample

 T = 3; % duration of a note

 a = 0.75; % mute 0 to 1 brighter

 L = round(fs/f);

 x = rand(L, 1)-0.5; % noise burst

 zero = zeros(T*fs-L,1);

 x = cat(1,x,zero);

 y = zeros(T*fs,1);

 pnt = 1;
 prevpnt = L; 

 for n = 1:length(x)

    pnt  = mod(n,L)+1;

    x(pnt) = d * ( a * (x(pnt) )+ (1-a) * x( prevpnt ));   

    y(n) = x(pnt);

   prevpnt = pnt;

   
 end
end
