%Rules for corequisites
is_a_coreq(Cours, Coreq):-coreqs(Course, Coreqs),member(Coreq,Coreqs),!.

%Rules for prerequisites
is_a_prereq(Course, Prereq):-prereqs(Course, Prereqs),member(Prereq,Prereqs),!.
has_prereqs(Course):-prereqs(Course, _).

%what if all courses are passed in?  Needs redone
has_all_prereqs(Course, Prereqs):-perm(Prereqs,Result),prereqs(Course, Result),!.

%Utilty Rules

%------------------Permutation of Lists----------------------------------------------
%Found at http://kti.ms.mff.cuni.cz/~bartak/prolog/combinatorics.html
%Will be changed so this is not needed.
perm(List,[H|Perm]):-delete(H,List,Rest),perm(Rest,Perm).
perm([],[]).
   
delete(X,[X|T],T).
delete(X,[H|T],[H|NT]):-delete(X,T,NT).
%-------------------------------------------------------------------------------------