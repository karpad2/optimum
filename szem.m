%By Kovacs A, Virag D
%pkg load optim
%A �Schittkowski: More Test Examples for Nonlinear Programming Codes� cikkben aj�nlott felt�teln�lk�li optimaliz�ci�s teszt feladatokon hasonl�tsa 
%�ssze a kv�zi-Newton vonalmenti minimaliz�l�si algoritmusokat   �s   a   kv�zi-Newton   trust-region   (megb�zhat�s�gi   tartom�ny)   algoritmusokat.   
%Azirregul�ris teszt feladatokat ne vegye figyelembe


%Quasi newton, BFGS, Vonalmenti, dfp


clear;clc;


funs=myfuns();

options_linesearch = optimset('PlotFcns',@optimplotfval); %Vonalmenti;
options_bfgs = optimset('Display','iter','LargeScale','off'); %BFGS
options_qnewton = optimoptions('fminunc','Display','iter','Algorithm','quasi-newton'); % quasi newton
options_trust_region = optimoptions('fminunc','Display','iter','Algorithm','quasi-newton','HessUpdate','dfp'); % quasi newton~ trust region

deltaf=[];deltafval=[];


f1=[];f2=[];f3=[];f4=[];
l1=1:length(funs);
for i=l1
    
  x0=[0,0,0,0];
  disp('------------------------')
  disp(i)
  %functions(funs{i})
  disp(funs{i})
  try
  disp('Quasi Newton:')
  [fmin,fval]=fminunc(funs{i},x0,options_qnewton);
  f1(i,:)=[fmin,fval];
  catch ME
  disp('Error:')
  disp(ME.identifier);
  end
  try
  disp('BFGS:')
  [fmin,fval]=fminunc(funs{i},x0,options_bfgs);% bfgs quasi newton
  f2(i,:)=[fmin,fval];
  catch ME
  disp('Error:')
  disp(ME.identifier);
  end
  
  try
  disp('Vonalmenti:')
 [fmin,fval]=fminsearch(funs{i},x0,options_linesearch);% vonalmenti
    f3(i,:)=[fmin,fval];
   catch
   disp('Error:')
  disp(ME.identifier);
  end
  
  try
  disp('Trust region:')
  [fmin,fval]=fminunc(funs{i},x0,options_trust_region);% dfp quasi newton
  f4(i,:)=[fmin,fval];
  catch ME
  disp('Error:')
  disp(ME.identifier);
  end 
   avg = mean([f1(i,1),f2(i,1),f3(i,1),f4(i,1)])
   
  pause(15)
 % clc
  
end



plot(1:length(f1),f1(:,1)',f2(:,1)',f3(:,1)',f4(:,1)')


% Felhaszn�lt irodalom
% https://www.mathworks.com/help/optim/ug/fminunc.html
