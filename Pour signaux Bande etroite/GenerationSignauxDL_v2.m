function GenerationSignauxDL_v2(NomFichier)
% NomFichier='G:\Deep learning\Signaux Protocoles Reels\\ARQ-M2-342.wav';
%     PLOT = 1 ; % On affichera les graphes des signaux.
%
% Script Matlab pour lire un fichier .wav contenant un signal I/Q en bande
% �troite (c'est � dire ne contenant qu'un seul �metteur) et g�n�rant en
% sortie les donn�es pouvant �tre plac�es en entr�e d'un r�seau deep learning
%
% Ce scripte ne traite qu'un seul signal � la fois. Pour traiter tous les
% signaux contenus dans un r�pertoire (et ses sous-r�pertoirs) utiliser la
% fonction 'TraiterRepertoir'.

% PARAMETRAGE
Ldsp = 1024; % Nombre de point pour les DSP
Lcyclo = 4096; % Nombre de point pour les Cyclospectres
Nbt = 8; % Nombre de d�calage temporel pour les cyclospectres
Lhisto = 256;       % nombre de classes dans les histogrammes
handles.Param.nb_raies_DSP = 8;   % nombre maximum de raies trait�es dans les DSP
handles.Param.nb_raies_Cyclo = 8;   % nombre maximum de raies trait�es dans les cyclo correlations
handles.Param.factConf = 10; % d�croissance de la confiance quand elle est bas�e sur le SNR
handles.Param.vireZero=0;
handles.Param.gardeZero=1;
handles.Param.TxResamp = 4; % Taux de r�-�chantillonnage � 4 fois la vistesse de modulation

handles.Param.DureeMaxSignal = 0.4 ; % Dur�e maximale du signal en seconde. si =0 n'est pas pris en compte
handles.Param.NbeMaxEchtSignal = 0 ; % Longueur maximale du signal en �chantillons. si =0 n'est pas pris en compte
%
%
% Si pas de signaux en entr�e, on demande � l'op�rateur d'en saisir un :
if nargin <1  % s'il n'y a pas de signal en entr�e !
    [FileName,PathName] = uigetfile('*.wav','S�lectionez un fichier .wav');
    if isequal(FileName,0)
       return ; % Aucune saisie
    else
       NomFichier = [PathName,'\',FileName] ;
    end
    PLOT = 1 ; % On affichera les graphes des signaux.
end
% V�rifications diverses et lecture du fichiers :
[pathstr, name, ext] = fileparts(NomFichier) ;
pathstr
name
if ~strcmp(ext,'.wav')
    errordlg('Le fichier s�lectionn� n''a pas d''extension .wav !','Erreur de choix de fichier');
    return ;
end
[X,Fe] = wavread(NomFichier);
if isempty(X) || isempty(Fe)
    errordlg('Le fichier s�lectionn� n''a pu �tre lu !','Erreur de lecture du fichier');
    return ;
end
if size(X,2) == 1
    x = X(:,1);
else
    x = X(:,1) + 1i*X(:,2) ;
end
clear X

% Calcul et sauvegarde des r�sultats:
S = PreCalculSignal2(x,Fe,Ldsp) ;
%save([pathstr, name, '.mat'], 'S') ;

% Si saisie manuelle, on affiche quelques signaux :
h_fig = figure(1) ;
PlotVisuSignal_2(h_fig, S,pathstr, name);


