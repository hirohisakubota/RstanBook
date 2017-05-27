data {
	int I;
	int<lower=0, upper=1> A[I];
	real<lower=0, upper=1> Score[I];
	real<lower=0, upper=1> W[I];
	int<lower=0, upper=1>Y[I]; 

}

parameters {
	real b1;
	real b2;
	real b3;
	real b4;
}

transformed parameters {
	real q[I];
	for (i in 1:I)
		q[i] = inv_logit(b1+b2*A[i]+b3*Score[i]+b4*W[i]);

}

model {
	for (i in 1:I)
		Y[i] ~ bernoulli(q[i]);
}

generated quantities {
	real Y_pred[I];
	for (i in 1:I)
		Y_pred[i] = bernoulli_rng(q[i]);


}
