clc
clear
close all
parameters=xlsread('house_prices_data_training_data.csv');
x=parameters(:,4:21);
m=length(parameters);
Mean=mean(x);
STD=std(x);
for w=1:18
    if max(abs(x(:,w)))~=0
    x(:,w)=(x(:,w)-mean((x(:,w))))./std(x(:,w));
    end
end
epsilon=0.001;
anomaly_deteced=0;
anomaly_indices=[];
for i=1:m
    for j=1:length(x(1,:))
        if(qfunc(x(i,j))<epsilon || qfunc(x(i,j))>1-epsilon)
            anomaly_deteced=anomaly_deteced+1;
            anomaly_indices=[anomaly_indices;i,j];
            
        end
    end
end