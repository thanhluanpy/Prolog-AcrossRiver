goal([0,0,0,0]).

nosafe([0,1,1,_]).
nosafe([0,_,1,1]).
nosafe([1,0,0,_]).
nosafe([1,_,0,0]).

transit(X,Y):- transit_farmer_to_right(X,Y).
transit(X,Y):- transit_farmer_wolt_to_right(X,Y).
transit(X,Y):- transit_farmer_goat_to_right(X,Y).
transit(X,Y):- transit_farmer_cabbage_to_right(X,Y).

transit(X,Y):- transit_farmer_to_left(X,Y).
transit(X,Y):- transit_farmer_wolt_to_left(X,Y).
transit(X,Y):- transit_farmer_goat_to_left(X,Y).
transit(X,Y):- transit_farmer_cabbage_to_left(X,Y).

transit_farmer_to_right([1,B,C,D],[0,B,C,D]):- \+nosafe([0,B,C,D]).
transit_farmer_wolt_to_right([1,1,C,D],[0,0,C,D]):- \+nosafe([0,0,C,D]).
transit_farmer_goat_to_right([1,B,1,D],[0,B,0,D]):- \+nosafe([0,B,0,D]).
transit_farmer_cabbage_to_right([1,B,C,1],[0,B,C,0]):- \+nosafe([0,B,C,0]).

transit_farmer_to_left([0,B,C,D],[1,B,C,D]):- \+nosafe([1,B,C,D]).
transit_farmer_wolt_to_left([0,0,C,D],[1,1,C,D]):- \+nosafe([1,1,C,D]).
transit_farmer_goat_to_left([0,B,0,D],[1,B,1,D]):- \+nosafe([1,B,1,D]).
transit_farmer_cabbage_to_left([0,B,C,0],[1,B,C,1]):- \+nosafe([1,B,C,1]).

dfs(X,P,[X|P]):- goal(X),!.
dfs(X,P,Path):- transit(X,Y), X\=Y, \+member(Y,P), dfs(Y,[X|P],Path).
