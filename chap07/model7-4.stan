data {
	int T;
	real Time[T];
	real Y[T];
	int T_new;
	real Time_new[T_new];
}

parameters {
	real<lower=0, upper=100> a;
	real<lower=0, upper=5> b;
	real<lower=0> s_Y;

}

transformed parameters {
	real mu[T];
	real mu_new[T_new];
	for (n in 1:T)
		mu[n] = a*(1-exp(-b*Time[n]));
	for (n in 1:T_new)
		mu_new[n] = a*(1-exp(-b*Time_new[n]));
}

model {
	for (n in 1:T)
		Y[n] ~ normal(a*(1-exp(-b*Time[n])), s_Y);		

}

generated quantities {
	real y_pred[T];
	real y_new[T_new];
	for (n in 1:T)
		y_pred[n] = normal_rng(a*(1 - exp(-b*Time[n])), s_Y);
	for (n in 1:T_new)
		y_new[n] = normal_rng(a*(1 - exp(-b*Time_new[n])), s_Y);
}
