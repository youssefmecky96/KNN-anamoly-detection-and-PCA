clc
clear
close all
parameters=xlsread('house_prices_data_training_data.csv');
target=parameters(:,3);
target_norm=(target-mean(target))./std(target);
m=length(parameters);
x=parameters(:,4:21);
 for w=1:18
    if max(abs(x(:,w)))~=0
    x(:,w)=(x(:,w)-mean((x(:,w))))./std(x(:,w));
    end
end
Corr_x=corr(x);
x_cov=cov(x);
[U S V] =  svd(x_cov);
alpha=1;
K=0;
di=diag(S);
sum_n=trace(S);
while(alpha>=0.001)
     K=K+1;
    trial = di(1:K);
    sum_k=sum(trial);
    alpha=1-sum_k/sum_n;
   
end

R=U(:,1:K)'*x';
x_apx=U(:,1:K)*R;   
x_apx=x_apx';

error_dataset=(1/m)*sum(sum((x-x_apx).^2));
R=R';
p=[ones(m,1) R];
n=length(p(1,:));
theta=zeros(n,1);
alpha=0.1;
 iter=1;
 error(iter)=(1/(2*m))*sum((p*theta-target_norm).^2);
 converged=0
 while (converged~=1)
     theta=theta-(alpha/m)*p'*(p*theta-target_norm);
     iter=iter+1
     error(iter)=(1/(2*m))*sum((p*theta-target_norm).^2);
    
      if error(iter-1)-error(iter)<0
          
    break
end 
q=(error(iter-1)-error(iter))./error(iter-1)
if q <.000001;
    converged=1;
end
  
 end

    
