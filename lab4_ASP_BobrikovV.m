%% Filters design %%
freqArray = [31, 62, 125, 250, 500, 1000, 2000, 4000, 8000,16000];
order = 1024;
fS = 44100;
bBank = CreateFilters(freqArray, order, fS);
nums=randperm(10,3);
bTmp=bBank(nums,:);
for i = 1:3
    [H(i, :), w(i, :)] = freqz(bTmp(i,:), 1, order);
end
todB = @(x) 20*log10(x);
a = todB(abs(H));
b = (w/pi)*(fS/2);
%% Graph with standard functions %%
plot(b,a(1,:),'-k', 'LineWidth',1)
hold on;
plot(b,a(2,:),':*b', 'LineWidth',1)
plot(b,a(3,:),'-.rs', 'LineWidth',1)
legend('N1','N2','N3');
title('фильтрs','Fontsize',16);
xlabel('f,KHz','Fontsize',16);
ylabel('|H|,dB','Fontsize',16);
xticks([2000,8000,16000]);
xticklabels({'2 KHz','8 KHz','16 KHz'});
xlim([0,21000]);
ylim([-60;10]);
%% Graph with changing object properties %%
f = figure('DefaultAxesFontsize',14);
ax = axes;
p1 = plot(b,a(1,:));
p2 = plot(b,a(2,:));
p3 = plot(b,a(3,:));
PropNames = {'xlim','ylim'};
PropValues = {[0,21000],[-60,10]};
set(ax, PropNames, PropValues);
