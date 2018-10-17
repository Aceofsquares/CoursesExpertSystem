%%Rules for corequisites
is_a_coreq(Course, Coreq):-coreqs(Course, Coreqs),member(Coreq,Coreqs),!.

%Rules for prerequisites
is_a_prereq(Course, Prereq):-prereqs(Course, Prereqs),member(Prereq,Prereqs),!.
has_prereqs(Course):-prereqs(Course, _).

has_all_prereqs(Course, Taken):-prereqs(Course,Required), has_all_prereqs(Course, Taken, Required).
has_all_prereqs(Course, Taken, [Prereq|Rest]):-member(Prereq,Taken),has_all_prereqs(Course,Taken,Rest),!.
has_all_prereqs(_, _, []).