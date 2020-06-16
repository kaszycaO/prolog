on(block1, block2).
on(block2, block3).
on(block3, block4).
on(block4, block5).
on(block5, block6).

above(X, W) :- on(W, X).
above(X, Y) :- 
	on(Y ,Z),
	above(X, Z).
	


