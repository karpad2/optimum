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
fval1=[];fval2=[];fval3=[];
x=1:length(functions);
for i=1:length(functions)
  x0=[0,0];
  [f1(i),fval1(i)]=fminunc(functions{i},x0,options_dfp);% dfp quasi newton
  [f2(i),fval2(i)]=fminunc(functions{i},x0,options_bfgs);% bfgs quasi newton
  [f3(i),fval3(i)]=fminsearch(functions{i},x0);% vonalmenti
end



plot(x,f1,f2,f3)