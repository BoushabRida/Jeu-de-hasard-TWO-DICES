/*la loi de Y; le gain d'un organisateur d'un jeu de hasard: deux dices*/
Data de;
 /*k c'est le nombre que l'utilisateur va entrer*/
/*d  correspondant au gros lot */
/*u moyenne*/
 k=100; 
 d=20;
 alpha=0.5;
 r=1.96;
 u=(100-d)/36;
 n=int(((53000+200*d+35*d**2)*probit(1-alpha/2))/(1296*r**2));
 do i=1 to k;
  s=0;
  do j=1 to n+1;
   x=min (rand("Integer", 1, 6),rand("Integer", 1, 6));
   if (x=1) then y=10;
   else if (x=2) then y=5;
   else if (x=3) then y=0;
   else if (x=4) then y=-5;
   else if (x=5) then y=-10;
   else if (x=6) then y=-d;
   else y='erreur';
  s=s+y;
  end;
  yn=s/n; /* le gain moyen*/
  if yn<u+r and u-r> yn then e=1;
  else e=0;
  put e=;
  output;
 end;
run;
proc sgplot data= de;
 title1 'Representation des 100 valeurs de gain moyen';
 scatter x=i y=yn ;
run;

proc sgpie data=de;
 title2 'Pourcentage des 100 valeurs qui sont efectivement dans l intervalle p';
 pie e;
run;

