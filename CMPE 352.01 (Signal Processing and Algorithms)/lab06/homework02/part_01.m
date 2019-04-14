[sound_mike, fs_mike] = audioread('mike.wav');
[sound_street, fs_street] = audioread('street.wav');

time_street = find_time(sound_street, fs_street);
time_mike = find_time(sound_mike, fs_mike);

% finding mixed sound and frequency
sound_mixed = sound_street + sound_mike;
fs_mixed = (fs_mike + fs_street) / 2;

time_mixed = find_time(sound_mixed, fs_mixed);

[fft_mike, f_mike] = time_to_frequency_domain(sound_mike, fs_mike);
[fft_street, f_street] = time_to_frequency_domain(sound_street, fs_street);
[fft_mixed, ~] = time_to_frequency_domain(sound_mixed, fs_mixed);

% filter sound with using given function
sound_filtered = filter_given_sound_and_frequency(sound_mixed, fs_mixed);
[fft_filtered, f_mixed] = time_to_frequency_domain(sound_filtered, fs_mixed);


% frequency domain representation for street, mike and mixed
figure_with_given_values(f_mike, fft_mike, 'Mike Frequecy Domain', f_street, fft_street, 'Street Frequecy Domain', f_mixed, fft_mixed, 'Mixed Frequecy Domain');  

% time domain representation for street, mike and mixed
figure_with_given_values(time_mike, sound_mike, 'Mike Time Domain', time_street, sound_street, 'Street Time Domain', time_mixed, sound_mixed, 'Mixed Time Domain');
    
% frequency domain representation for mixed and mike
figure_with_given_two_graphs(f_mike, fft_mike, 'Mike Frequecy Domain', f_mixed, fft_filtered, 'Filtered Mixed Frequecy Domain');
    
% time domain representation for mixed and mike
figure_with_given_two_graphs(time_mike, sound_mike, 'Mike Time Domain', time_mixed, sound_filtered, 'Mixed and Filtered Time Domain');

result1_SNR = find_SNR(sound_mike, sound_mixed);
result2_SNR = find_SNR(sound_mike, sound_filtered);



% =========== FUNCTIONS ===========

% finding time = 1/f * length OR T * length
function time = find_time(sound, frequency)
    time = (0:length(sound) - 1) / frequency;
end

% convert time to frequency domain
function [result_fft,result_freqs] = time_to_frequency_domain(signal, fs)
    result_fft = abs(fftshift(fft(signal)));
    result_freqs = ( -fs/2 : (1/(length(signal)-1)) * fs : fs/2);
end

function sound_filtered = filter_given_sound_and_frequency(sound_mixed, fs_mixed)
% Appling filter
filter_order = 3;
low_human_freq = 200 / (fs_mixed/2);
high_human_freq = 4000 / (fs_mixed/2);

% Design a 6th-order Butterworth bandstop filter
[b,a] = butter(filter_order, [low_human_freq, high_human_freq], 'stop');
sound_filtered = filter(b, a, sound_mixed);
end

% algorith for finding SNR value
function result_SNR = find_SNR(original, recovered)
    result_SNR = 10 * log10(sum(original.^2) ./ sum((recovered-original).^2));
end

% figure with given 3 graphs with 2, 1, 3 order
function figure_with_given_values(first, second, title1, third, fourth, title2, fifth, sixth, title3)
figure()
subplot(3,1,2), 
plot(first, second); 
title(title1);
subplot(3,1,1), 
plot(third, fourth); 
title(title2);
subplot(3,1,3), 
plot(fifth, sixth); 
title(title3);
end

% figure with given 2 graphs with 1, 2 order
function figure_with_given_two_graphs(time_mike, sound_mike, title1, time_mixed, sound_filtered, title2)
figure()
subplot(2,1,1), 
plot(time_mike, sound_mike); 
title(title1);
subplot(2,1,2), 
plot(time_mixed, sound_filtered); 
title(title2);
end
