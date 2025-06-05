# Artifact Appendix

Paper title: Locally Differentially Private Frequency Estimation via Joint Randomized Response

Artifacts HotCRP Id: #9

Requested Badge: Available, Functional, Reproduced

## Description
This paper introduces a correlated randomized response mechanism for frequency estimation under local differential privacy (LDP). The artifact provides experimental evidence demonstrating improved data utility compared to traditional, non-correlated randomized response (RR) mechanism.

We have simplified the reproduction process — it should take less than 20 minutes if you are familiar with Matlab.

### Security/Privacy Issues and Ethical Concerns (All badges)
The artifact does not require any security modifications for installation or execution. Most evaluations are theoretical or comparative in nature. The four datasets included are small and publicly available, with no sensitive information involved.

## Basic Requirements (Only for Functional and Reproduced badges)
### Hardware Requirements
A standard modern laptop or desktop is sufficient.

### Software Requirements
The artifact is implemented entirely in Matlab. It only requires a working Matlab environment. 
Development was done using Matlab R2023a, and the artifact has been tested on both Windows desktop Matlab and online Matlab. It should run on any system with a working Matlab environment. 

### Estimated Time and Storage Consumption
* **Time**: Approximately 20 minutes in total if you have a working Matlab environment.

* **Storage**: The project occupies approximately 5MB.

## Environment
### Accessibility (All badges)

GitHub repository: https://github.com/ZhengYeah/JRR

Commits after `3af0827` (dated June 5) are expected to work.

### Setting Up the Environment (Only for Functional and Reproduced Badges)

1. **Install Matlab:** Ensure you have access to a working Matlab environment. If you do not have Matlab installed locally, you can use the online Matlab environment at [https://matlab.mathworks.com/](https://matlab.mathworks.com/).

2. **Clone the Repository:** Download the artifact by cloning the repository to your local machine:
  ```
  git clone https://github.com/ZhengYeah/JRR.git
  ```

3. **Open the Project in Matlab:** 
  - For desktop Matlab: Open Matlab and navigate to the cloned repository using the file browser.
  - For online Matlab: Upload the cloned folder (preferably as a `.zip` file for faster upload) to your online workspace. After uploading, double-click the `.zip` file to extract its contents.

### Testing the Environment (Only for Functional and Reproduced Badges)

To verify your environment is set up correctly, run any `.m` script from the repository. 
If prompted by a dialog box to change the current folder, click "Change Folder" to proceed.

## Artifact Evaluation (Only for Functional and Reproduced badges)

### Main Results and Claims
#### Main Result 1: Comparison with RR on Real-world Datasets
(Figure 1–2, Page 10) JRR has smaller MSE and ARE than RR on four real-world datasets, demonstrating its effectiveness in frequency estimation.

#### Main Result 2: Comparison with RR on Synthetic Datasets
(Figure 3–4, Page 10-11) JRR outperforms RR in terms of MSE and ARE on synthetic datasets with varying $n$ and $\varepsilon$ parameters.

#### Main Result 3: The Effect of $m$ on JRR

(Figure 5, Pages 11) This figure shows the effect of the number of adversaries $m$ on JRR.
The MSE increases with $m$, but strictly lower than RR.

#### Main Result 4: The Effect of $n_1/n$ on JRR

(Figure 6, Page 12) This figure shows the effect of $n_1/n$ on JRR.

#### Main Result 5: The Underperformance of JRR When $n_1/n \approx 1/2$

(Figure 7–8, Page 12) This figure shows the underperformance of JRR compared to RR when $n_1/n \approx 1/2$.

You can reproduce these results using quick scripts in the `reproduction` folder.

### Experiments

To reproduce the first result, cd into the `reproduction` folder and run the following files.

#### Experiment 1: Comparison with RR on Real-world Datasets

```
/reproduction/figure_1.m (<0.5 minute)
/reproduction/figure_2.m (<0.5 minute)
```

#### Experiment 2: Comparison with RR on Synthetic Datasets

```
/reproduction/figure_3.m (<0.5 minute)
/reproduction/figure_4.m (<0.5 minute)
```

#### Experiment 3: The Effect of $m$ on JRR

```
/reproduction/figure_5.m (<0.5 minute)
```

#### Experiment 4: The Effect of $n_1/n$ on JRR

```
/reproduction/figure_6.m (<0.5 minute)
```

#### Experiment 5: The Underperformance of JRR When $n_1/n \approx 1/2$

```
/reproduction/figure_7a.m (<0.5 minute)
/reproduction/figure_8a.m (<0.5 minute)
/reproduction/figure_7b_8b.m (<0.5 minute)
```

## Limitations (Only for Functional and Reproduced badges)
LDP mechanisms have randomness, so the results may vary slightly each time you run the scripts. However, the overall trends and conclusions should remain consistent.
