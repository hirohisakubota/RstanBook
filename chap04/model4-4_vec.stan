data {
	int N;
	vector[N] X;
	vector[N] Y;
	int N_new;
	vector[N_new] X_new;

}

parameters {
	real a;
	real b;
	real<lower=0> sigma;

}

transformed parameters {
	vector[N] y_base;
	y_base = a + b*X;

}

model {
	Y ~ normal(y_base, sigma);

}


generated quantities {
	real y_base_new[N_new];
	real y_new[N_new];

	for (n in 1:N_new) {
		y_base_new[n] = a + b*X_new[n];
		y_new[n] = normal_rng(y_base_new[n], sigma);

	}
}
