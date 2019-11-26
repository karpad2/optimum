%By Kovacs A, Virag D
%pkg load optim
%A �Schittkowski: More Test Examples for Nonlinear Programming Codes� cikkben aj�nlott felt�teln�lk�li optimaliz�ci�s teszt feladatokon hasonl�tsa 
%�ssze a kv�zi-Newton vonalmenti minimaliz�l�si algoritmusokat   �s   a   kv�zi-Newton   trust-region   (megb�zhat�s�gi   tartom�ny)   algoritmusokat.   
%Azirregul�ris teszt feladatokat ne vegye figyelembe


%DFP , BGS rendszerek �sszehasonl�t�save




funs=myfuns();

options_linesearch = optimset('PlotFcns',@optimplotfval); %DFP;
options_bfgs = optimset('Display','iter','LargeScale','off'); %BFGS
options_qnewton = optimoptions('fminunc','Display','iter','Algorithm','quasi-newton');

deltaf=[];deltafval=[];


f1=[];f2=[];f3=[];
x=1:length(funs);
for i=x
    
  x0=[0,0,0,0];
  disp('------------------------')
  disp(i)
  functions(funs{i})
  %disp(funs{i})
  %try
  disp('Quasi Newton:')
  [fmin,fval]=fminunc(funs{i},x0,options_qnewton);
  f1(i,:)=[fmin,fval];
  %catch ME
 % disp('Error:')
  %disp(ME.identifier);
  %end
  try
  disp('BFGS:')
  [fmin,fval]=fminunc(funs{i},x0,options_bfgs);% bfgs quasi newton
  f2(i,:)=[fmin,fval];
  catch
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
end



plot(1:length(f1),f1(:,1)',f2(:,1)',f3(:,1)')