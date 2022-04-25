%%                                          Statistica Multivariata - Prof. Maurizio Vichi
%%                                                                   
%%                                                              Alessandro Sottile
%%                                                                 a.a. 2020-2021
% 
% Per i seguenti punti, si faccia riferimento al dataset utilizzato nell'Homework 
% 1. 
% 
% 1. Creare una nuova matrice di dimensione $\left(107\;x\;6\right)$ selezionando 
% le 6 variabili scelte al punto 4 dell'Esercizio 1 dell'Homework 1. ATTENZIONE: 
% Se tra le variabili scelte ci sono quelle ricodificate ai punti 6 e 7 dell'Esercizio 
% 1 dell'Homework 1, fare riferimento alle variabili originarie.

load("Dataset Qualità della Vita")
t = X(:,[7 13 21  24 29 37]); 
Nomi_t = {'Spesa pro capite in viaggi/turismo'; 'Startup innovative'; 'Indice climatico di escursione termica'; 
    'Indice di vecchiaia'; 'Durata media dei processi'; 'Indice di sportività'};
%% 
% t rapresenta la matrice usata nell'homework1. Nel vettore Nomi_t invece sono 
% inserite a cosa corrispondono le variabili citate.
% 
% 2. Costruire la matrice di correlazione con il dataset ottenuto al punto 1 
% (usare la funzione scritta per risolvere        il punto 2 dell'Esercizio 1 
% dell'Homework 1). Rappresentare graficamente la matrice di correlazione mediante 
% una  heatmap e commentare le relazioni tra le variabili selezionate. 

[~,~,Rt]=Funzione1(t);
h1=heatmap(Rt)
h1.Title = 'Correlazioni tra le variabili';
h1.Colormap = parula;
h1.CellLabelColor = 'k';
h1.YDisplayLabels = {'Var 7','Var 13','Var 21','Var 24','Var 29','Var 37'};
h1.XDisplayLabels = {'Var 7','Var 13','Var 21','Var 24','Var 29','Var 37'};
%% 
% Dalla matrice di correlazione possiamo notare come per molte delle coppie 
% vi sia un grado di correlazione positiva/negativa molto poco intenso, quasi 
% inesistente addirittura, come per esempio la coppia formata dalle variabili 
% 24 e 13. Per altre, invece, troviamo un grado di correlazione, legermente pù 
% alto, ad esempio la coppia Var 21 e Var 13, le quali risultano godere di un 
% livello appena apprezzabile di correlazione positiva.
% 
% Solo due coppie possiedono un livello di correlazione almeno considerevole:la 
% coppia formata da Var 21 e Var 29, e quella formata da Var 7 e Var 29;  le ultime 
% due variabili addirittura possono beneficiare di un intenso livello di correlazione 
% negativa.
% 
% 
% 
% 3. È possibile evidenziare dei clusters mediante la rappresentazione fatta 
% al punto 4 dell'Esercizio 1 dell'Homework 1? Se sì, continuare le analisi con 
% i seguenti punti; altrimenti, modificare opportunamente la matrice creata al 
% punto 1 selezionando una variabile per ciascuna dimensione (al fine di individuare 
% una struttura di clustering nei dati).

T_s=zscore(t);
[S,AX,BigAx,H,HAx] = plotmatrix(T_s);
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
title(BigAx,'Plot di tutte le Coppie di variabili della matrice T_s');
%% 
% Analizzando il grafico, ci si accorge che le variabili selezionate non hanno 
% sufficiente potere discriminante per identificare i cluster. Si devono quindi 
% selezionare altre variabili per cercare di migliorare la situazione, per queste 
% ragioni definisco la nuova matrice Mod.

Mod =  X(:,[4 10 19  25 29 42]) ;
Mod_s=zscore(Mod);
Nomi_Mod = {'Consumi'; 'Tasso di disoccupazione giovanile'; 'I city rate'; 
    'Saldo migratorio interno'; 'Durata media dei processi'; 'Onlus'};
%% 
% Il vetore Nomi_Mod contiene il nome delle nuove variabili scelte.

[S,AX,BigAx,H,HAx] = plotmatrix(Mod_s);
ylabel(AX(1,1),'Var 4','Rotation',0,'HorizontalAlignment','right');
ylabel(AX(2,1),'Var 10','Rotation',0,'HorizontalAlignment','right');
ylabel(AX(3,1),'Var 19','Rotation',0,'HorizontalAlignment','right');
ylabel(AX(4,1),'Var 25','Rotation',0,'HorizontalAlignment','right');
ylabel(AX(5,1),'Var 29','Rotation',0,'HorizontalAlignment','right');
ylabel(AX(6,1),'Var 42','Rotation',0,'HorizontalAlignment','right');
xlabel(AX(end,1),'Var 4','Rotation',90,'HorizontalAlignment','right');
xlabel(AX(end,2),'Var 10','Rotation',90,'HorizontalAlignment','right');
xlabel(AX(end,3),'Var 19','Rotation',90,'HorizontalAlignment','right');
xlabel(AX(end,4),'Var 25','Rotation',90,'HorizontalAlignment','right');
xlabel(AX(end,5),'Var 29','Rotation',90,'HorizontalAlignment','right');
xlabel(AX(end,6),'Var 42','Rotation',90,'HorizontalAlignment','right');
title(BigAx,'Plot di tutte le Coppie di variabili della matrice Mod_s');
for i=1:6
H(i).EdgeColor = 'k';
H(i).FaceColor = 'r'; 
end
for i=1:6
    for j=1:6
        S(i,j).Color='r';
    end
end
%% 
% Per cercare di migliorare la situazione, tramite vari tentativi, si è riusciti 
% a modificare le scelte delle variabili da inserire, infatti controllando graficamente 
% i mutamenti che avvenivano all'interno del plotmatrix, con il cambiamento di 
% alcune variabili, quelle che rendevano più nitida la presenza dei cluster, erano 
% candidate ad entrare nella matrice.
% 
% Per avere anche un supporto analitico riguardo l'inclusione della variabile, 
% per ogni cambiamento  effettuato era importante andare a controllare come variava 
% il valore della pseudoF, infatti ogni variabile che aumentava il valore della 
% funzione obiettivo rispetto ai dati usati in precedenza, veniva inserita nella 
% matrice, almeno fino alla comparsa di una migliore per quel dominio.
% 
% Con la nuova matrice si riesce ad intuire meglio la presenza dei cluster all'interno 
% del plotmatrix, sembrerebbero essere due i cluster presenti nella struttura 
% dei dati. Vediamo tramite il calcolo della pseudoF se l'intuizione sarà confermata.
% 
% 4. *K-means:* si implementi il k-medie sulla matrice creata al punto 1 (o 
% punto 3), scegliendo il numero ottimale di clusters sulla base della pseudo  
% F - F max o  F di Calinski Harabasz - mediante la funzione scritta in classe 
% (laddove non si era presenti, scrivere una funzione che restituisca in output 
% un vettore contenente i valori della pseudo F per un range di valori K). Quali 
% variabili contribuiscono maggiormente alla classificazione? Commentare i risultati. 
% ATTENZIONE: ricordandone le proprietà analizzate in classe, si applichi il k-means 
% dopo una appropriata trasformazione dei dati.

[F] = pseudoF(Mod_s,1,10);
F
maxF = max(F(2:10))
find(F==maxF)
%% 
% In questo modo è stato trovato il k che rende massima la funzione obiettivo 
% della pseudoF, in questo caso k = 2 e quindi l'intuizione avuta analizzando 
% il plotamtrix di Mod_s è corretta.

evalclusters(Mod_s,'kmeans','CalinskiHarabasz','Klist',[2:10])
%% 
% Possiamo notare che anche la funzione evalclusters restituisce lo stesso valore 
% di k riportato sopra.

[Ft] = pseudoF(T_s,1,10);
Ft;
maxFt = max(Ft(2:10));
find(Ft==maxF);
maxF
maxFt
%% 
% Il valore assunto dalla pseudoF in corrispondenza di un k fissato, può anche 
% essere interpretato come una misura di diagnostica del modello, più è alta e 
% più sarà grande la porzione di devianza speigata dalla devianza between.
% 
% E' interessante notare come il valore della psuedoF calcolato in corrispondenza 
% di k = 2, usando però questa volta la matrice standardizzata T_s, sia molto 
% inferiore rispetto a quello calcolato tramite Mod_s; si passa infatti da un 
% valore di 39.22 ad uno di 178.0.9,  questo risultato rafforza l'dea che la nuova 
% matrice Mod_s ha migliorato decisamente la divisione in cluster.
% 
% Si può il k-medie sulla matrice dei dati standardizzati, in quanto il k-medie 
% è uno strumento che risente fortemente della differenza di scala tra le variabili.

[loop,U,f,iter] = kmeansVICHI(Mod_s,2,100)
%% 
% U rappresenta la matrice di appartenenza, la quale identifica per ogni unità 
% il cluster di appartenenza.
% 
% E' interessante studiare quali siano le variabili che influenzino maggiormente 
% la classificazione ottenuta.Per compiere questa analisi, si parte osservando 
% il plotmatrix di Mod_s realizzato nel punto 3.
% 
% Di notevole interesse dovrebbe essere studiare le distribuzioni delle  variabili 
% riportate nella diagonale del grafico citato precedentemente, quelle che dovrebbero 
% influenzare maggiormente la classificazione sono quelle che tendono ad avere 
% una distribuzione plurimodale, in quanto  variabili con queste caratteristiche 
% riescono a creare dei sottogruppi all'interno della popolazione studiata. La 
% variabile che più di tutti corrisponde al requesito è la 4  ovvero Consumi.
% 
% Per avere anche un supporto analitico, si può calcolare il valore della pseudoF 
% per ciascuna delle variabili, fissato il valore di k pari a 2.
% 
% La variabile che avrà maggior peso nella classificazione sarà quella con la 
% pseudoF maggiore

for i=1:6;
    [gl(:,i)]=pseudoF(Mod_s(:,i),2,2);
end
gl'
%% 
% Analizzando il vettore gl , si capisce come la variabile 4 sià quella più 
% importante per la classificazione, confermando l'ipotesi.
% 
% Inoltre nello scatterplot tra la variabile 4 e la 42 risulta essere ben apprezzabile 
% la divisione effettuata.

X_Mean = pinv(U)*Mod_s

gs1= gscatter(Mod_s(:,1),Mod_s(:,6),U)
xlabel('Consumi')
ylabel('Onlus')
hold on
plot(X_Mean(:,1),X_Mean(:,6),'kx','MarkerSize',15,'LineWidth',3) 
legend('Custer 2','Cluster 1','Centroidi','Location','northwest')
%% 
% E' interessante notare come i centroidi non siano valori realmente osservati, 
% ma solo risultati teorici ottenuti con la media condizionata.
%% 
% 5. *K-medoid:* applicare il k-medoide sulla matrice creata al punto 1 (o punto 
% 3) e con il numero ottimale di clusters scelto al punto 4, mediante la relativa 
% funzione esistente in MATLAB. Commentare i risultati e confrontarli con quelli 
% del punto 4, dopo aver calcolato la matrice di confusione (ATTENZIONE al label 
% switching) e l'Adjusted Rand Index (ARI). ATTENZIONE: si applichi il k-medoide 
% dopo una appropriata trasformazione dei dati.
% 
% Bisogna implementare il k-medoide  sulla matrice dei dati standardizzati, 
% in quanto è uno strumento che non gode della proiprietà di invarianza di scala.

[idx,C,sumd,D,midx,info] = kmedoids(Mod_s,2)
I = eye(107);
m= I(idx,:);
Mt=m(:,[1 2]);
K = 2;
CU = zeros(K);
    for k = 1:K
        for g = 1:K
             CU(k,g) = sum((U(:,k)-Mt(:,g)).^2); 
        end
    end
    [PrU,unfeasU,DDU] = bghungar(-CU);
    Mt = Mt(:,PrU)
%% 
% 

Partizione_Medoidi=sum(Mt)
Partizione_Centroidi=sum(U)
%% 
% Ho ottenuto i due vettori contenenti le frequenze assolute dei cluster.

ConfMatr1=Mt'*U 
%% 
% Tramite la matrice di confusione, si nota che vi è stata una differenza di 
% classificazione per solamente 1 variabile.
% 
% Le due partizioni trovate sembrano quasi coincidere.
%% 
% 6. *Clustering gerarchico:* applicare i 4 metodi di clustering gerarchico 
% studiati e rappresentarli graficamente mediante un dendrogramma. ATTENZIONE: 
% si applichino i metodi di clustering gerarchico dopo una appropriata trasformazione 
% dei dati.

Mod_Dist=squareform(pdist(Mod_s));
%% 
% Tramite la trasformazione, è stata ottenuta una matrice delle distanze quadrate, 
% questo è necessario per poter applicare i metodi del clustering gerarchico.
% 
% Metodo legame medio:

figure()
[Up1,A1,B1,levfus1,of1] = upgma(Mod_Dist,1);
dendrogram([A1 B1 levfus1])
%% 
% Metodo legame semplice:

[Up2,A2,B2,levfus2,of2] = upgma(Mod_Dist,2);
dendrogram([A2 B2 levfus2])
%% 
% Metodo legame completo:

[Up3,A3,B3,levfus3,of3] = upgma(Mod_Dist,3);
dendrogram([A3 B3 levfus3])
%% 
% Metodo di Ward:

[Up4,A4,B4,levfus4,of4] = upgma(Mod_Dist,4);
dendrogram([A4 B4 levfus4])
%% 
% 
%% 
% 7. Scegliere uno dei metodi implementati al punto 6 ed individuare il numero 
% di clusters omogenei con il relativo dendrogramma. Costruire la matrice di appartenenza 
% a partire dalla partizione che si otterrebbe con il metodo di clustering gerarchico 
% scelto se si tagliasse il dendrogramma in corrispondenza del suddetto numero 
% di clusters omogenei (ATTENZIONE: si vedano gli output e gli input della funzione 
% _dendrogram;_ con il secondo output è possibile ottenere il vettore di classificazione 
% passando in input il numero di clusters omogenei individuati nel dendrogramma_)_. 
% Calcolare la matrice di confusione tra la partizione ottenuta e quella risultante 
% dal k-medie implementato al punto 4.

figure()
[~,T,~]= dendrogram([A1,B1,levfus1],2)
%% 
% ho deciso di usare il metodo del legame semplice

Us=eye(size(Mod_s,1),2);
Us=Us(T,:);
K = 2;
CU = zeros(K);
    for k = 1:K
        for g = 1:K
             CU(k,g) = sum((U(:,k)-Us(:,g)).^2); 
        end
    end
    [PrU,unfeasU,DDU] = bghungar(-CU);
    Us = Us(:,PrU)
Freq_ass_Gerarchico=sum(Us) 
%% 
% Us rappresenta la matrice di appartenenza, costruita tramite il clustering 
% gerarchico.
% 
% Freq_ass_Gerarchico è un vettore contenente le frequenze assolute riguardo 
% i due cluster.

ConfMatr2=Us'*U 
%% 
% Tramite l'imput grafico della matrice di confusione, si nota che vi è stata 
% una differenza di classificazione per 6 variabili.

AdjRI=mrand(ConfMatr2) 
%% 
% Il valore ottenuto da questo indice identifica la buona divisione effettuata.
%% 
% 8. *ACP:* aggiungere un'altra variabile per dominio al dataset costruito al 
% punto 1 (o punto 3). Individuare le componenti principali di questo nuovo dataset, 
% scegliendone il numero. Commentare i risultati e rappresentare le unità (e le 
% variabili) sulle prime due componenti principali.

X_Agg=X(:,[1 4 8 10 16 19 22 25 29 31 41 42])
X_AggS=zscore(X_Agg)
%% 
% X_Agg rappresenta la nuova matrice ottenuta, prima di applicarla per l'ACP 
% la standardizzo in quanto il metodo non è invariante rispetto ai cambiamenti 
% di scala.

[coeff,score,latent,~,explained,~]=pca(X_AggS);
%% 
% Esistono 3 metodi per scegliere le componenti principali:
% 
% Con il primo metodo si scelgono il numero di componenti principali, tante 
% quanti sono gli autovalori maggiori della media, in questo caso il valore della 
% media è pari a 1, in quanto i dati sono standardizzati.

size(find(latent>1),1)
%% 
% in questo caso il numero delle componenti deve essere pari a 3.
% 
% Ora proviamo ad usare l'approccio della varianza spiegata, dove si cerca il 
% numero minimo di elementi del vettore explained, che sommati riescano a spiegare 
% almeno il 70% della varianza totale.

sum(explained(1:4))
%% 
% Anche in questo caso, il numero di componenti da usare risulta essere pari 
% a 3.
% 
% Infine si può provare anche con il metodo grafico

p = plot(latent)
xlabel('Numero di componenti');
ylabel('Autovalori');
p.Color = 'red';
%% 
% Il quale non risulta di nitida interpretazione, però avendo lo scopo di trovare 
% il punto in cui la curva decresce meno rapidamente, possiamo intuire che ciò 
% avverrà quando il numero scelto per le componenti sarà 3 oppure 4.
% 
% Avendo analizzato i vari metodi, si più  dichiarare che il numero delle componenti 
% risulta essere pari a 3.

[coeff2,score2,latent2,~,explained2,~]=pca(X_AggS,"NumComponents",2)
label = {'Var 1','Var 2','Var 3','Var 4','Var 5','Var 6','Var 7','Var 8','Var 9','Var 10','Var 11','Var 12'};
h = biplot(coeff2(:, 1:2),'Scores',score2(:,1:2),'VarLabels',label)
xlabel('Componente 1');
ylabel('Componente 2');
for k = 25:36
    h(k).FontWeight = 'bold';  
end
%% 
% Osservando la matrice coeff2 , si può affermare che la componente 2 è influenzata 
% prevalentemente dalle variabili 10 e 11, le quali hanno rispettivamente peso 
% pari a 0.55 e 0.56. Passando invece alla componente 1, non si riesce a trovare 
% la variabile che eserciti maggior peso sull'nfluenzare questa componente, infatti 
% i valori della matrice coeff2 evidenziano il fatto che nessuna variabile ha 
% un peso maggiore di 0.36,ma anzi quasi tutte tendando ad avere un valore simile 
% a quest'ultimo.
%% 
% 
% 
% 9. *ACP "confermativa":* costruire un indicatore sintetico delle 42 variabili 
% originali. Scegliere la prima componente principale per ogni dominio, ossia 
% applicare una ACP separata per ciascun gruppo di variabili associate ad un dominio. 
% Calcolare le 6 componenti principali $Y$ e valutarne le relazioni mediante la 
% loro matrice di correlazione. Infine, calcolare una media delle 6 componenti 
% principali per ciascuna provincia.

X_S=zscore(X);
%% 
% Questa volta si parte dalla matrice dei dati originali X, ma per gli stessi 
% motivi del punto precedente anche quest'ultima va standardizzata.

[B1,L1]=eigs(cov(X_S(:,1:7),1));
Y1=X_S(:,1:7)*B1(:,1)
[B2,L2]=eigs(cov(X_S(:,8:14),1));
Y2=X_S(:,8:14)*B2(:,1)
[B3,L3]=eigs(cov(X_S(:,15:21),1)); 
Y3=X_S(:,15:21)*B3(:,1)
[B4,L4]=eigs(cov(X_S(:,22:28),1)); 
Y4=X_S(:,22:28)*B4(:,1)
[B5,L5]=eigs(cov(X_S(:,29:35),1)); 
Y5=X_S(:,29:35)*B5(:,1)
[B6,L6]=eigs(cov(X_S(:,36:42),1)); 
Y6=X_S(:,36:42)*B6(:,1)

MatrComp= [Y1 Y2 Y3 Y4 Y5 Y6]
%% 
% Tramite i codici elencati sopra, si riesce a calcolare l'ACP per ogni sottogruppo, 
% e successivamente viene estratta la prima componente da ognuno di essi, in quanto 
% per definizione sarà quella associata al più grande autovalore di ciascuna matrice 
% analizzata. Infine si può creare la matrice contenenti le componenti principali.

h2 = heatmap(corrcoef(MatrComp))
h2.Title = 'Correlazioni tra le componenti';
h2.Colormap = parula;
h2.CellLabelColor = 'k';
h2.YDisplayLabels = {'Y1','Y2','Y3','Y4','Y5','Y6'};
h2.XDisplayLabels = {'Y1','Y2','Y3','Y4','Y5','Y6'};
%% 
% Analizzato il grafico ottenuto si notano diversi aspetti interessanti:  solamente 
% tre coppie di componenti godono di una forte correlazione, negativa  per (Y1,Y2) 
% e (Y2,Y3), mentre è positiva per (Y1,Y3).
% 
% Alcune coppie possiedono una correlazione discreta, che risulta essere positiva 
% come nei (Y3,Y6),(Y1,Y6) ed(Y2,Y5), mentre negativa per (Y2,Y6), (Y3,Y6) ed 
% (Y1,Y5).
% 
% Le coppie non citate possono essere valutate come tendenzialmente incorrelate.

MedieComponenti=mean(MatrComp,2);
Posizioni = (1:107)';
MedieComponentiInd= [MedieComponenti Posizioni];
Medie=sortrows(MedieComponentiInd,1, 'descend') ;

for i=1:107
    for j=1:107
        if j==Medie(i,2)
            Stampa(i,:)=[Medie(i,1) Province(j,1)];    
        end
    end
end
Classifica=Stampa(:,[2 1])
%% 
% Il vettore Classifica contiene la classifica di tutte le 107 province analizzate, 
% ordinate in base alla media delle 6 componenti principali, la quale rappresenta 
% una misura di qualità della vita.
%% 
% *Il seguente esercizio non dovrà essere svolto da coloro che sosterranno il 
% preappello e dovrà dunque essere inserito nella tesine di coloro che sosterranno 
% l'esame dall'appello di Gennario 2021.*

% Funzioni usate
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
function [F] = pseudoF(X,minK,maxK)
for k = minK:maxK
    % [loopOtt,UOtt,fOtt,iterOtt]=kmeansVICHI(X,K,Rndstart);
    [~,U,~,~] = kmeansVICHI(X,k,30);
    Y = pinv(U)*X;
    F(k-minK+1) = (trace((U*Y)'*(U*Y))/trace((X-U*Y)'*(X-U*Y)))*((size(X,1)-k)/(k-1));
end
end
