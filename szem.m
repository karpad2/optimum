%By Kovacs A, Virag D
%pkg load optim
%A “Schittkowski: More Test Examples for Nonlinear Programming Codes” cikkben ajánlott feltételnélküli optimalizációs teszt feladatokon hasonlítsa 
%össze a kvázi-Newton vonalmenti minimalizálási algoritmusokat   és   a   kvázi-Newton   trust-region   (megbízhatósági   tartomány)   algoritmusokat.   
%Azirreguláris teszt feladatokat ne vegye figyelembe


%DFP , BGS rendszerek összehasonlításave




funs=myfuns();

options_dfp = optimset('Display','iter','LargeScale','off','HessUpdate','dfp'); %DFP;
options_bfgs = optimset('Display','iter','LargeScale','off'); %BFGS
options_qnewton = optimoptions('fminunc','Algorithm','quasi-newton');
options_grad = optimset('Display','iter','GradObj','on'); %Gradiensel való számolás

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