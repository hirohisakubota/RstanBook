data {
	int N;
	real X[N];
	real Y[N];
	int N_new;
	real  X_new[N_new];

}	

parameters {
	real a;
	real<lower=0> b;
	real<lower=0, upper=30> x0;
	real<lower=0> s_Y;

}

transformed parameters {
	real mu[N];
	real mu_new[N_new];
	for (n in 1:N)
		mu[n] = a+b*(X[n]-x0)^2;
	for (n in 1:N_new)
		mu_new[n] = a+b*(X_new[n]-x0)^2; 

}

model {
	for (n in 1:N)
		Y[n] ~ normal(mu[n], s_Y);
}

generated quantities {
	real y_new[N_new];
	for (n in 1:N_new)
		y_new[n] = normal_rng(mu_new[n], s_Y);

}
