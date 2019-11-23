%By Kovacs A, Virag D
%pkg load optim
%A �Schittkowski: More Test Examples for Nonlinear Programming Codes� cikkben aj�nlott felt�teln�lk�li optimaliz�ci�s teszt feladatokon hasonl�tsa 
%�ssze a kv�zi-Newton vonalmenti minimaliz�l�si algoritmusokat   �s   a   kv�zi-Newton   trust-region   (megb�zhat�s�gi   tartom�ny)   algoritmusokat.   
%Azirregul�ris teszt feladatokat ne vegye figyelembe


%DFP , BGS rendszerek �sszehasonl�t�save




funs=myfuns();

options_dfp = optimset('Display','iter','LargeScale','off','HessUpdate','dfp'); %DFP;
options_bfgs = optimset('Display','iter','LargeScale','off'); %BFGS
options_qnewton = optimoptions('fminunc','Algorithm','quasi-newton');
options_grad = optimset('Display','iter','GradObj','on'); %Gradiensel val� sz�mol�s

deltaf=[];deltafval=[];


f1=[];f2=[];f3=[];
x=1:length(funs);
for i=x
  x0=[0,0];
  f1(i,:)=fminunc(funs{i},x0,options_qnewton);% quasi newton
  f2(i,:)=fminunc(funs{i},x0,options_bfgs);% bfgs quasi newton
  f3(i,:)=fminsearch(funs{i},x0);% vonalmenti
end



plot(x,f1,f2,f3)