[signal, fs] = audioread('mike.wav');

% default delay in ms
K = 100;
mixed_delayed_signal = delay_signal(signal, fs, K) + signal;
% K = 100, changing N from 1 to 50
K = 100;
snr_1 = zeros(50, 1);
N_values = 1:50;
for N = N_values
    filtered = n_tap_filter(mixed_delayed_signal, fs, N, K);
    snr_1(N) = SNR(signal, filtered);
end
% SNR of mike and recovered signal
title = 'K = 100, changing N from 1 to 50';
figure_with_given_values(snr_1, N_values, title);



% N = 50, changing K between 100, 200, 300, 400 ms
N = 50;
K_values = [100 200 300 400];
snr_2 = zeros(4, 1);
for i = 1:length(K_values)
   delayed_signal = delay_signal(signal, fs, K_values(i)) + signal;
   filtered_signal = n_tap_filter(delayed_signal, fs, N, K_values(i));
   snr_2(i) = SNR(signal, filtered_signal); 
end

% SNR mike and recovered signal
title = 'N = 50, changing K between 100, 200, 300, 400 ms';
figure_with_given_values(snr_2, K_values, title);



% =========== FUNCTIONS ===========

% postpone given signal
function result_signal = delay_signal(signal, fs , k)
    N = length(signal);
    result_signal = zeros(N, 1);
    delay_in_sample = fs * k / 1000;
    for i = delay_in_sample+1:N
        result_signal(i) = signal(i-delay_in_sample);
    end
end

% appling N tap filter
function result = n_tap_filter(signal, fs, N, K)
    result = signal;
    for i=1:N
        signal = delay_signal(signal, fs, K);
        result = result + ((-1)*0.2)^i * signal;
    end
end

% calculate SNR
function result = SNR(original, recovered)
    result = 10 * log10(sum(original.^2) ./ sum((recovered-original).^2));
end

% figure with given values
function figure_with_given_values(snr, val, t)
figure;
plot(val, snr);
title(t);
end
