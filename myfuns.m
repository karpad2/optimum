function [f] = myfuns()
i=1;
f=[];
%f{i}=@(x) x; i=i+1; pelda sor
f{i}=@(x) 4*(x(1)-5)^2+(x(2)-6)^2; i=i+1; %201
f{i}=@(x) (-13+x(1)-2*x(2)+5*x(2)^2-3*x(2)^3)^2+(-29+x(1)-14*x(2)+x(2)^2+x(2)^3)^2; i=i+1; %202
f{i}=@(x) (1.5-x(1)*(1-x(2)))^2+(2.25-x(1)*(1-x(2)^2))^2+(2.625-x(1)*(1-x(2)^3))^2; i=i+1; %205
f{i}=@(x) (x(2)-x(1)^2)^2+100*(1-x(1))^2; i=i+1; %206
f{i}=@(x) (x(2)-x(1)^2)^2+(1-x(1))^2; i=i+1; %207
f{i}=@(x) 100*(x(2)-x(1)^2)^2+(1-x(1))^2; i=i+1; %208
f{i}=@(x) 10^4*(x(2)-x(1)^2)^2+(1-x(1))^2; i=i+1; %209
f{i}=@(x) 10^6*(x(2)-x(1)^2)^2+(1-x(1))^2; i=i+1; %210
f{i}=@(x) 100*(x(2)-x(1)^3)^2+(1-x(1))^2; i=i+1; %211
f{i}=@(x) (4*(x(1)+x(2)))^2+(4*(x(1)+x(2))+(x(1)-x(2))*((x(1)-2)^2+x(2)^2-1))^2; i=i+1; %212
f{i}=@(x) (10*(x(1)-x(2))^2+(x(1)-1)^2)^4; i=i+1; %213
f{i}=@(x) (10*(x(1)-x(2))^2+(x(1)-1)^2)^1/4; i=i+1; %214


end
