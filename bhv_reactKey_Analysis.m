%
% Behavioral data analysis
% Author: Kalpajyoti Hazarika
% Description:
% Visual Reactive Key Pressing Task



%%
addpath('D:\my drive\OneDrive - Indian Institute of Science\lab works\lab works\Reactive Task\keyPressing reactive task\visual_keyPress\reactSubArpan')
load('230630_arpan_keyVisReactive_keyPress_Reactive.mat')

%%
nb_trial = TrialRecord.CurrentTrialNumber;

actual_time = zeros(nb_trial,1);

for i = 1:nb_trial
    actual_time(i) = eval(strcat('Trial',num2str(i),'.UserVars.sound_seq'))./60;
end

response_time = zeros(nb_trial,1);

for i = 1:nb_trial
    response_time(i) = eval(strcat('Trial',num2str(i),'.BehavioralCodes.CodeTimes(4)')) - eval(strcat('Trial',num2str(i),'.BehavioralCodes.CodeTimes(3)'));
end

for i = 1:nb_trial
    response_time(i) = (eval(strcat('Trial',num2str(i),'.BehavioralCodes.CodeTimes(4)')) - eval(strcat('Trial',num2str(i),'.BehavioralCodes.CodeTimes(3)')))/1000;
end

percieve_time = zeros(nb_trial,1);

for i = 1:nb_trial
    percieve_time(i) = (eval(strcat('Trial',num2str(i),'.BehavioralCodes.CodeTimes(7)')) - eval(strcat('Trial',num2str(i),'.BehavioralCodes.CodeTimes(6)')))/2000;
end

  
plot(1:30,actual_time,'--sq','linewidth',1.2,'MarkerFaceColor','b','MarkerSize',8);
hold on;
plot(1:30,response_time,'--o','linewidth',1.2,'MarkerFaceColor','g','MarkerSize',8);
hold on;
plot(1:30,percieve_time,'--^','linewidth',1.2,'MarkerFaceColor','k','MarkerSize',8);
xlabel('Trial','FontSize',12,'FontWeight','bold')
ylabel('Time(second)','FontSize',12,'FontWeight','bold')
title('Comparison of time: cue/action/perception','FontSize',12,'FontWeight','bold');

legend('actual Time','Key Pressing Time','Percieved Time')
hold off;
%%
% scatter plot
% actual time vs action time
subplot(121)
scatter(actual_time,response_time,'*r')
xlim([0,max(actual_time)+1])
xlabel('Actual time','FontSize',12,'FontWeight','bold')
ylabel('Response time','FontSize',12,'FontWeight','bold')
line(0:length(actual_time),0:length(actual_time),'color','black','LineWidth',1)

subplot(122)
scatter(actual_time,percieve_time,'*b')
xlim([0,max(actual_time)+1])
xlabel('Actual time','FontSize',12,'FontWeight','bold')
ylabel('Percieved time','FontSize',12,'FontWeight','bold')
line(0:length(actual_time),0:length(actual_time),'color','black','LineWidth',1)

%%
figure(2)
histogram(percieve_time)
%%







