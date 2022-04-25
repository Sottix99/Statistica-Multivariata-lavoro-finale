%%                                             Statistica Multivariata - Prof. Maurizio Vichi
%%                                                               
%%                                                              Alessandro Sottile
%%                                                                 a.a. 2020-2021
% 

% 1.Caricare il file "Dataset Qualità della Vita". Il dataset contiene informazioni 
% su 42 variabili rilevate sulle 107 province italiane, riportate nel vettore 
% stringa "Province" (<https://lab24.ilsole24ore.com/qdv2018/ https://lab24.ilsole24ore.com/qdv2018/>). 
% Le dimensioni del benessere rilevate sono 6 (non direttamente osservabili): 
% _Ricchezza e Consumi_, _Affari e Lavoro, Ambiente e Servizi, Demografia e Società, 
% Giustizia e Sicurezza, Cultura e Tempo Libero_. Ciascuna dimensione è definita 
% da 7 variabili manifeste: le prime 7 fanno riferimento all dimensione _Ricchezza 
% e Consumi_, dall'ottava alla quattordicesima alla dimensione _Affari e Lavoro_, 
% etc. La descrizione delle variabili è disponibile sul sito <https://lab24.ilsole24ore.com/qdv2018/indexT.html. 
% https://lab24.il><https://lab24.ilsole24ore.com/qdv2018/indexT.html. sole24ore.com/qdv2018/indexT.html.>

load("Dataset Qualità della Vita")
%% 
% 
% 
% 2.Analizzare il dataset: calcolare il vettore delle medie, la matrice di varianza 
% e covarianza e la matrice di correlazione mediante le funzioni esistenti in 
% Matlab e scrivendo una funzione che calcoli gli stessi elementi a partire dalle 
% definizioni studiate in classe.

Xm=mean(X)
Sx=cov(X,1) 
Rx=corrcoef(X)
%% 
% Xm rappresenta il vettore delle medie.
% 
% Sx rappresenta la matrice delle  varianze e covarianze.
% 
% Rx  Rappresenta la matrice delle correlazioni.

[Xm,Sx,Rx]=Funzione1(X)
%% 
% Usando la funzione creata otteniamo gli stessi valori di prima.
% 
% 3. Calcolare la matrice di correlazione a partire da quella di varianza e 
% covarianza e rappresentarla mediante una heatmap. Commentare il risultato.

U107= ones(107,1);
Jc=eye(107)-1/107*U107*U107';
S=(1/107)*X'*Jc*X;
D=diag(diag(S));
D=D.^(0.5);
Rricav = D^(-1)*S*D^(-1) 
%% 
% Si è giunti al risultato tramite la formula della matrice di correlazione

het1=heatmap(Rricav)
het1.Title = 'Correlazioni tra le variabili';
het1.Colormap = cool;
het2=heatmap(Rx)
het2.Title = 'Correlazioni tra le variabili';
het2.Colormap = cool;
%% 
% i due heatmap coincidono.
% 
% Guardando il grafico possiamo notare che non sono presenti forti tendenze 
% riguardo al modo in cui si distribuiscono i valori in un ottica generale, però 
% si può notare legami tra variabili appartenenti allo stesso dominio.
% 
% Ad esempio tutte le variabili afferenti al primo dominio, ovvero le variabili 
% comprese tra 1 e 7 estremi inclusi, hanno un deciso grado di correlazione positiva 
% tra loro, stessa cosa si può dire per quelle afferenti al terzo dominio.
% 
% 4. Scegliere una variabile per ciascuna dimensione e rappresentare i dati 
% per coppie di variabili (suggerimento: cercare una funzione in Matlab per ottenere 
% una rappresentazione compatta).

Oeh = X(:,[7 13 21  24 29 37]);
NomiIndici = {'spesa pro/capite in turismo'; 'Start up'; ' Escursione termica'; 
    'Indice Vecchiaia'; 'Durata Media Processi'; 'Sportività'};
%% 
% Le variabili sono state scelte in modo casuale.
% 
% Il vettore NomiIndici contiene i nomi degli indici selezionati dall'analisi 
% effettuata da Il Sole 24 Ore

[S,AX,BigAx,H,HAx] = plotmatrix(Oeh);
ylabel(AX(1,1),'Var 7','Rotation',0,'HorizontalAlignment','right');
ylabel(AX(2,1),'Var 13','Rotation',0,'HorizontalAlignment','right');
ylabel(AX(3,1),'Var 21','Rotation',0,'HorizontalAlignment','right');
ylabel(AX(4,1),'Var 24','Rotation',0,'HorizontalAlignment','right');
ylabel(AX(5,1),'Var 29','Rotation',0,'HorizontalAlignment','right');
ylabel(AX(6,1),'Var 37','Rotation',0,'HorizontalAlignment','right');
xlabel(AX(end,1),'Var 7','Rotation',90,'HorizontalAlignment','right');
xlabel(AX(end,2),'Var 13','Rotation',90,'HorizontalAlignment','right');
xlabel(AX(end,3),'Var 21','Rotation',90,'HorizontalAlignment','right');
xlabel(AX(end,4),'Var 24','Rotation',90,'HorizontalAlignment','right');
xlabel(AX(end,5),'Var 29','Rotation',90,'HorizontalAlignment','right');
xlabel(AX(end,6),'Var 37','Rotation',90,'HorizontalAlignment','right');
title(BigAx,'Plot di tutte le Coppie di variabili della matrice Oeh')
S(2,6).Color='r';
S(6,2).Color='r';
S(4,3).Color='r';
S(3,4).Color='r';
S(1,5).Color='g';
S(5,1).Color='g';
S(3,1).Color='y';
S(1,3).Color='y';
S(3,2).Color='y';
S(2,3).Color='y';
S(6,4).Color='y';
S(4,6).Color='y';

%% 
% La matrice scelta fa notare, grazie all'uso del plotmatrix, vari aspetti degni 
% di nota:
% 
% Inanzitutto si può partire analizzando gli istogrammi che rapresentano la 
% distribuzione della variabili, la maggior parte di queste infatti si distribuiscono 
% in modo asimmetrico, denotando la presenza di alcuni dati distanti dal corpo 
% centrale della distribuzione.
% 
% Si nota dagli scatterplot, che alcune coppie presenti nel grafico possono 
% essere correlate positivamente, negativamente o addirittura incorrelate.
% 
% Ad esempio le coppie (13,37) e (21,24) formano grafici con nuvole di punti 
% che non seguono una particolare tendenza, quindi possono essere considerate 
% incorrelate.
% 
% Analizzando la coppia (7,29) è facile notare come vi sia una forte correlazione 
% negativa, infatti a valori alti di una corrisponde un valore basso dell'altra.
% 
% Infine le coppie (7,21),(13,21) e (24,37) godono di una discreta correlazione 
% positiva.
% 
% Tutti questi legami possono essere riassunti tramite la matrice di correlazione:

heatmap(corrcoef(Oeh))
%% 
% 5. Campionare casualmente 50 province dalle 107 totali.

VettIndicatrice=(1:107)';
MatrIndicatrice= [ VettIndicatrice X];

CampioneIndicatore = datasample(MatrIndicatrice,50,"Replace",false);
Campione =  CampioneIndicatore(:,2:43) 
%% 
% Ho estratto dalla matrice CampioneIndicatore una sotto-matrice che non contiene 
% più la colonna 1, ovvero quella che serve per indicare a quale provincia appartiene 
% ogni riga di dati.

PosizioniCampione = CampioneIndicatore(:,1)
%% 
% 
% 
% 6. Ricodificare la variabile "Furti di autovetture" in 6 classi con percentuali 
% 5%, 20%, 25%, 
% 
% 30%, 10%, 10%. Si veda il punto 1 per la descrizione delle variabili.

FurtiAutovetture = Campione(:,35);
%% 
% Guardando il link del punto 1, si scopre che la colonna d'interesse è la 35

ClassiFurti = quantile(FurtiAutovetture,[0 0.05 0.25 0.50 0.80 0.90 1])
%% 
% ClassiFurti è il vettore che rappresenta gli estremi delle classi

DivisioneFurti= discretize(FurtiAutovetture,ClassiFurti,"categorical")
%% 
% Si è ottenuta la divisione usando gli estremi precedenti
% 
% 7. Ricodificare la variabile "Scippi e borseggi" in 5 classi con percentuali 
% 15%, 20%, 30%, 20%, 15%. Si veda il punto 1 per la descrizione delle variabili.

ScippiBorseggi = Campione(:,30);
ClassiScippi = quantile(ScippiBorseggi,[0 0.15 0.35 0.65 0.85 1]) 
DivisioneScippi= discretize(ScippiBorseggi,ClassiScippi,"categorical") 
%% 
% Per ottenere la ricodifica, sono stati usati gli stessi passaggi del punto 
% precedente
% 
% 8. Individuare la distribuzione semplice in classi delle due variabili al 
% punto 6 e 7.

u6=ones(6,1) ;
u5=ones(5,1); % vettore di elementi unitari
I6=eye(6); % matrice identità
I5=eye(5);
BF=I6(DivisioneFurti ,:); % matrice indicatrice
BS=I5(DivisioneScippi,:);
CS= BS'*BS*u5
CF= BF'*BF*u6 % vettore frequenze assolute
%% 
% Applicando la funzione tabulate ottengo la stessa divisione:

tabulate(DivisioneScippi) 
tabulate(DivisioneFurti)
%% 
% 9. Calcolare la tabella di contingenza con frequenze assolute, quella normalizzata 
% per riga e quella normalizzata per colonna delle due variabili ricodificate 
% in classi al punto 6 e 7.

CF= BF'*BF*u6 ;
CS= BS'*BS*u5;
Cfs = BF'*BS % matrice frequenze assolute
matr = [Cfs,CF;CS',size(BF,1)] 
% ho ottenuto la tabella di contingenza doppia
ca=(CF'*u6)^-1*CF 
% vettore frequenze relative
cb=(CS'*u5)^-1*CS
r=pinv(BF)*BS % normalizzo per riga
c=(pinv(BS)*BF)' % normalizzo per colonna
TabNormR=[r , ca; cb',size(BF,1)/size(BF,1) ] % ottengo le due tabelle 
TabNormC=[c , ca; cb',size(BF,1)/size(BF,1) ]

%% 
% 10. Calcolare il $\chi^{2}$, assoluto e relativo, tra le due distribuzioni 
% ricodificate in classi al punto 6 e 7. Utilizzare una funzione esistente in 
% Matlab (che include il calcolo della distribuzione doppia) e scrivere una funzione 
% che permetta di calcolare il chi-quadro nei vari modi studiati in classe.

[tbl,chi2] = crosstab(DivisioneFurti,DivisioneScippi) % ottengo il chiquadro assoluto
h= size(tabulate(DivisioneScippi),1) %numero righe
k= size(tabulate(DivisioneFurti),1) %numero colonne
n= size(DivisioneFurti,1) % numero di osservazioni
ChiMax= min(h-1,k-1)*n %rappresenta il chiquadro massimo
ChiRel= [,chi2]/ChiMax %rappresenta il chiquadro relativo

%% 
% Usando la funzione ChiquadroFinale, nella quale bisogna specificare L'argomento 
% Tipo, la funzione calcolerà il chiquadro usando il metodo dato in imput.

ChiquadroFinale(BF,BS,1)
ChiquadroFinale(BF,BS,2)
ChiquadroFinale(BF,BS,3)

%% 
% 11. Calcolare il vettore delle medie delle variabili "Delitti di stupefacenti" 
% e "Cause pendenti ultratriennali" condizionatamente alla distribuzione in classi 
% calcolata al punto 6. Si veda il punto 1 per la descrizione delle variabili.

DelittidiStuepfecenti = Campione(:,34);
CausePendentiUltratriennali = Campione(:,32);
MedieCondizionateDelitti =pinv(BF)*DelittidiStuepfecenti
MedieCondizionateCause = pinv(BF)*CausePendentiUltratriennali 
% ho ottenuto le medie condizionate
%% 
% 12. Calcolare la varianza delle variabili “Consumi” e “Prezzi medi di vendita 
% delle case”. Si veda il punto 1 per la descrizione delle variabili.

Consumi =  Campione(:,4);
PrezziMediCase =  Campione(:,6); % estraggo i valori richiesti
I50=eye(50);
Jcc = I50-1/50*ones(50)*ones(50); % matrice di centratura
ConsumiCentrati = Jcc*Consumi; % costruisco ora le matrici dei dati centrati
PrezziCentrati = Jcc*PrezziMediCase;
VarianzaConsumi = (ConsumiCentrati'*ConsumiCentrati)/50 
VarianzaPrezzi = (PrezziCentrati'*PrezziCentrati)/50
%% 
% 13. Calcolare la covarianza tra le variabili “PIL pro capite” e “Depositi 
% pro capite”.

Pil= Campione(:,1);
Depositi = Campione(:,2);
I50=eye(50);
Jcc = I50-1/50*ones(50)*ones(50);
PILCentrati = Jcc*Pil;    
DepositiCentrati = Jcc*Depositi;
CovPilDepositi = 1/50 *PILCentrati'*DepositiCentrati 
%% 
% 14. Calcolare la matrice dei dati standardizzati mediante la funzione esistente 
% in Matlab e scrivendo una funzione sulla base della definizione studiata in 
% classe.
% 
% 

MatriceDatiStandardizzati=zscore(Campione,1)
Standard(Campione)
%% 
% I risultati ottenuti con le due funzione coincidono
% 
% 15. Con la matrice calcolata al punto 14 (dati standardizzati), calcolare 
% la media delle variabili afferenti al dominio Giustizia e Sicurezza per ciascuna 
% provincia. Ordinare poi le province in ordine decrescente rispetto al valore 
% ottenuto (riportare in output solamente le prime dieci province). 


MatriceGiustizia = MatriceDatiStandardizzati(:,[29 30 31 32 33 34 35])
MedieGiustizia = mean(MatriceGiustizia,2) % calcolo le medie
MedieGiustiziaIndicatrice = [PosizioniCampione MedieGiustizia]  
% aggiungo il vettore contenente le posizioni delle province

MedieGiustiziaIndicatriceOrd= sortrows(MedieGiustiziaIndicatrice,2, 'descend')
% le ordino
Prime10=MedieGiustiziaIndicatriceOrd(1:10,:)

for i=1:10
    for j=1:107
        if j==Prime10(i,1)
            Stampa(i,:)=[Prime10(i,2) Province(j,1)] ;  
        end
    end
end
Risultato=Stampa(1:10,[2 1])
%% 
% Nella matrice risultato ho ottenuto la classifica delle prime 10 province, 
% ordinate in ordine decrescente sulla base del dominio Giustizia e Sicurezza, 
% quindi sono quelle più pericolose.
