clc
clear
close all
parameters=xlsread('house_prices_data_training_data.csv');
x=parameters(:,4:21);
m=length(parameters);
cost_graph=[];
for w=1:18
    if max(abs(x(:,w)))~=0
    x(:,w)=(x(:,w)-mean((x(:,w))))./std(x(:,w));
    end
end
b=1;
for(K=2:10)
centeroids=[];
iterations=0;

i=1;
converged =0;
 while(i<=K)
  centeroids=[centeroids rand(18,1)];
  i=i+1;
  
 end
while(converged==0&&iterations<5)
    clusters=zeros(17999,K);
for(i=1:length(x(:,1)))
    current=x(i,:);
    
    minimum_dis=mean(abs(current-centeroids(1)));
    current_i=1;
    for(v=2:K)
        distance=mean(abs(current-centeroids(v)));
        if(distance<minimum_dis)
            minimum_dis=distance;
            current_i=v;
        end
    end
    
    clusters(i,current_i)=i;
end
old_centeroids=centeroids;
for(r=1:K)
    
        count=0;
        sum1=0;
        sum2=0;
        sum3=0;
        sum4=0;
        sum5=0;
        sum6=0;
        sum7=0;
        sum8=0;
        sum9=0;
        sum10=0;
        sum11=0;
        sum12=0;
        sum13=0;
        sum14=0;
        sum15=0;
        sum16=0;
        sum17=0;
        sum18=0;

    for(j=1:17999)
        
        
        if(clusters(j,r)~=0)
            count=count+1;
           
           sum1= x(clusters(j,r),1)+sum1;
           sum2= x(clusters(j,r),2)+sum2;
           sum3= x(clusters(j,r),3)+sum3;
           sum4= x(clusters(j,r),4)+sum4;
           sum5= x(clusters(j,r),5)+sum5;
           sum6= x(clusters(j,r),6)+sum6;
           sum7= x(clusters(j,r),7)+sum7;
           sum8= x(clusters(j,r),8)+sum8;
           sum9= x(clusters(j,r),9)+sum9;
           sum10= x(clusters(j,r),10)+sum10;
           sum11= x(clusters(j,r),11)+sum11;
           sum12= x(clusters(j,r),12)+sum12;
           sum13= x(clusters(j,r),13)+sum13;
           sum14= x(clusters(j,r),14)+sum14;
           sum15= x(clusters(j,r),15)+sum15;
           sum16= x(clusters(j,r),16)+sum16;
           sum17= x(clusters(j,r),17)+sum17;
           sum18= x(clusters(j,r),18)+sum18;
           
          
        end
    end
    
    centeroids(1,r)=sum1/count;
    centeroids(2,r)=sum2/count;    
    centeroids(3,r)=sum3/count;    
    centeroids(4,r)=sum4/count;    
    centeroids(5,r)=sum5/count;    
    centeroids(6,r)=sum6/count;    
    centeroids(7,r)=sum7/count;    
    centeroids(8,r)=sum8/count;    
    centeroids(9,r)=sum9/count;    
    centeroids(10,r)=sum10/count;    
    centeroids(11,r)=sum11/count;    
    centeroids(12,r)=sum12/count;    
    centeroids(13,r)=sum13/count;    
    centeroids(14,r)=sum14/count;    
    centeroids(15,r)=sum15/count;    
    centeroids(16,r)=sum16/count;    
    centeroids(17,r)=sum17/count;    
    centeroids(18,r)=sum18/count;   
    
     
            
    
end
iterations=iterations+1;
centeroids

if (iterations==5)
        converged=1;
        cost=0;
        for(h=1:17999)
            for(l=1:K)
                if(clusters(h,l)~=0)
                    cost=cost+(x(clusters(h,l),:)-centeroids(:,l)').^2;
                end
            end
            
        end
        cost_graph(b)=1/m*sum(cost)
        b=b+1;
end
end
end
K=2:K;
plot(K,cost_graph)