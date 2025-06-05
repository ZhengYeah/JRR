# JRR

Code for paper: [PETS'25] Locally Differentially Private Frequency Estimation via Joint Randomized Response

Contributions:
* The first correlated randomized response mechanism for frequency estimation under LDP.
* Theoretical analysis of privacy leakage and utility improvement by the proposed correlated perturbation model.

## Code Structure and Reproduction

The main code for the RR and JRR mechanisms are as follows:
```
|- RR.m: Perturbation results of the RR mechanism.
|- cal_p_rho2.m: Calculate p and rho for the JRR mechanism by the heuristic method in the paper.
|- cal_p_rho.m: Another method to calculate p and rho for the JRR mechanism.
|- gcoin.m: Generate the output data of the JRR mechanism by common coin flipping.
```

**Reproduction:** The code for experiments are in the following files:

```
|- Dataset: Processed datasets of the experiments.
|- real_world: (Figure 1) Comparison of RR and JRR on four real-world datasets.
|- real_world_percentile: (Figure 2) Percentiles of ARE under RR and JRR.
|- effect_epsilon: (Figure 3) Effect of privacy budget $epsilon$ on MSE and ARE.
|- effect_n: (Figure 4) Effect of $n$ on MSE and ARE.
|- effect_m: (Figure 5) Effect of colluding users on JRR.
|- effect_f: (Figure 6) Effect of $f = n_1 / n$ on JRR.
|- under_performance: (Figure 7 and 8) Underperformance statistics of JRR when $n_1 / n \approx 1/2$.
```
Each folder contains the code for comparison of RR and JRR (``*.m`` files), along with the collected results (``*.mat`` files), drawing scripts (``figure_*.m`` files), and the generated figures (``*.pdf`` files). The pdf files corresponds to the figures in the paper. 
