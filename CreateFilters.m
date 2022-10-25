function bBank = CreateFilters(freqArray, order, fS)
freqArrayNorm = freqArray/(fS/2);
bBank=[];
for k = 1:length(freqArray)
    if k==1
        mLow = [1, 1, 0, 0];
        freqLow = [0, freqArrayNorm(1), 2*freqArrayNorm(1), 1];
        bLow = fir2(order, freqLow, mLow);
        bBank=[bBank;bLow];
        
    elseif k == length(freqArray)
        mHigh = [0, 0, 1, 1];
        freqHigh = [0, freqArrayNorm(end)/2, freqArrayNorm(end), 1];
        bHigh = fir2(order, freqBand, mBand);
        bBank = [bBank; bHigh];
    else
        mBand = [0, 0, 1, 0, 0];
        freqBand = [0, freqArrayNorm(k-1), freqArrayNorm(k),freqArrayNorm(k+1), 1];
        bPass = fir2(order, freqBand, mBand);
        bBank=[bBank; bPass];
    end
    
end
    
