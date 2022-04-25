%%                                             Statistica Multivariata - Prof. Maurizio Vichi
%%                                                                   
%%                                                              Alessandro Sottile
%%                                                                 a.a. 2020-2021
% 

% 1. Generare una matrice *X* da una normale bivariata, definendo arbitrariamente 
% il vettore delle medie, la matrice di varianze e covarianze e il numero di unità.

mu=[1 2]; % inserisco i valori per poter generare una normale bivariata
sigma=[1 1.5; 1.5 3];
y = mvnrnd(mu,sigma,99)
%% 
% 2. Rappresentare graficamente i dati in due dimensioni.

plot1=plot(y(:,1),y(:,2),'+')
title('Plot matrice generata da y')
%% 
% 
% 
% 3. Modifcare i valori all'interno della matrice di varianza e covarianza definita, 
% generare nuovamente e dati e rappresentarli graficamente.

mu=[1 2]; % cambio i valori di sigma
sigma2=[3 0.5; 0.5 3];
Z = mvnrnd(mu,sigma2,99)

plot2=plot(Z(:,1),Z(:,2),'+')
title('Plot matrice generata da Z')
% ottengo un grafico differente
%% 
% 4. Commentare i risultati ottenuti.
% 
% La differenza nei risultati ottenuti è dovuto al cambiamento di sigma, infatti 
% sono due campioni diversi ottenuti da  normali bivariate con parametri differenti
% 
% Nel plot dei dati generati dalla matrice Z si nota che i punti non sembrano 
% seguire una direzione ben precisa, infatti tendono ad ammassarsi sopratutto 
% nella zona centrale, anche se si nota la presenza di qualche dato anomalo. Si 
% può affermare che, data la mancanza di una relazione tra i punti, i dati sono 
% di fatto incorrelati.
% 
% Invece nel plot del campione generato da y la situazione cambia: sembra esserci 
% una marcata relazione lineare tra i dati, infatti a valori alti corrispondono 
% valori alti, e viceversa; non si nota la presenza di particolari dati anonimi.
% 
% Si può quindi affermare che i dati godono di un alto livello di correlazione 
% positiva.
% 
% 



% elenco delle funzioni usate
%% 
% 

%1
%%
function[Xm,Sx,Rx]=Funzione1(A)
nrow=size(A,1);
u1=ones(nrow,1);
Xm=(pinv(u1)*A)';
Jc=eye(nrow)-(1/nrow)*ones(nrow);
Sx=1/nrow*A'*Jc*A;
D=diag(diag(Sx));
D=D.^0.5;
Rx=D^-1*Sx*D^-1;
end

%2

function[Stampa1,Stampa2,Stampa3] = ChiquadroFinale(BF,BS,Tipo)
% con Tipo sto chiedendo di scegliere uno dei 3 metodi
% inoltre sto chiedendo di dare due matrici alla funzione 
NumclasseS=size(BS,2);
NumclasseF = size(BF,2);
N = size(BF,1);
CF= BF'*BF*ones(NumclasseF,1);
CS= BS'*BS*ones(NumclasseS,1);
Cfs = BF'*BS;
tCfs=N^-1*Cfs;
rCf=CF/N;
rCs=CS/N;
TabCont = [Cfs,CF;CS',N];
TabNCol=(pinv(BS)*BF)';
col=size(TabNCol,2);
r = size(TabCont,1);
% raccolgo tutti i dati e costruisco altre matrici che serviranno per i vari metodi
if Tipo == 1
Stampa2 = N*(trace(BS'*pinv(BF')*BF'*pinv(BS'))-1)
end
if Tipo == 2
Stampa1 = N^3*trace((BF'*BF)^-1*(tCfs-rCf*rCs')*(BS'*BS)^-1*(tCfs-rCf*rCs')')
end
if Tipo == 3
for i = 1:col
    parti(i) = N*(TabCont(r,i)*(TabNCol(:,i)-rCf)'*inv(BF'*BF)*(TabNCol(:,i)-rCf));
end

 Stampa3 = sum(parti)
end 
end


%3

function[Stampa]=Standard(A)
n=size(A,1)
In=eye(n)
jcc = In-(1/n)*ones(n,1)*ones(n,1)'
Sx= cov(A,1)
D=diag(diag(Sx))
Dnew= D.^0.5
Stampa = jcc*A*Dnew^-1
end
