function [somnegativa] = geneticpatternmod(cromosoma)
load train.mat
load test.mat
newf=[];
cromosoma    = approx_quantization(cromosoma);
disp('Current parameters:');
disp(cromosoma);
somnegativa=0;
X=Training(:,2:end);
Y=Training(:,1)+1;
Xt=Testing(:,2:end);
Yt=Testing(:,1)+1;
%--------------------------------
t=1;p=1;ff=[];
for t=1:1069
    if cromosoma(t)==1 
        XTest(:,p)=Xt(:,t);
        Xtrain(:,p)=X(:,t);
        p=p+1;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=0;
SVMStruct = svmtrain(Xtrain,Y);
Group = svmclassify(SVMStruct,XTest);
for i=1:37
if Group(i)==Yt(i)
    k=k+1;
end
end
SI=k/37*100
somnegativa=-SI;
