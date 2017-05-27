data {
  int N;
  vector<lower=0, upper=1>[N] A;
  vector<lower=0, upper=1>[N] Score;
  vector<lower=0, upper=1>[N] Y;
  int N_mew;
  vector[N_new]   
}

parameters {
  real b1;
  real b2;
  real b3;
  real<lower=0> sigma;
}

transformed parameters {
  vector[N] mu;
  mu = b1 + b2*A + b3*Score;
}

model {
    Y ~ normal(mu, sigma);
}

generated quantities {
  real mu_new[N_new]
  y_pred = normal_rng(mu, sigma);
