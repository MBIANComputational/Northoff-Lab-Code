### fMRI Motion Censoring and Interpolation: Practical Guidance

This document summarizes internal discussions and prior testing on head-motion censoring and interpolation in fMRI, with a focus on implications for functional connectivity (FC) and phase-based measures such as ITPC.

### 1. Choosing a Framewise Displacement (FD) Threshold

Voxel size matters. The acceptable FD threshold depends on voxel size. With larger voxels, the same amount of head motion produces smaller relative displacement of brain tissue across voxels, so a somewhat higher FD threshold may be tolerable. With smaller voxels, the same motion leads to larger relative displacement, so you generally want a more conservative (lower) FD threshold.

What does “0.5” mean? FD thresholds are software-dependent. In AFNI, FD is typically defined as the Euclidean norm of the motion parameters (translations and rotations converted to displacement). Other software packages may use different definitions or scalings for FD, so do not assume “0.5” is equivalent across tools. Always verify how FD is computed in the specific preprocessing pipeline.

Practical guidance on 0.5 vs 0.25: An FD threshold of 0.5 mm is relatively high by AFNI’s definition. It can still be useful as a way to remove only the worst TRs with extreme motion. A more conservative choice like 0.25 mm may be preferable for higher-resolution data (smaller voxels) or analyses particularly sensitive to motion artifacts.

### 2. Interpolation Methods: Is There a “Best” One?

There is no universally optimal interpolation method. Based on prior testing with our interpolation scripts, no single interpolation method (linear, spline, polynomial, etc.) is always best. Performance depends on the specific temporal structure of each timeseries and the pattern of missing or censored points.

Reasonable defaults versus per-subject tuning: In principle, one could tune interpolation parameters per subject, ROI, or voxel, but this is not practically feasible at scale. Our approach is to test a variety of interpolation methods and settings on representative data, select a set of parameters that works well in most cases, and accept that this may not be optimal for every individual series but is a reasonable, pragmatic compromise.

Key takeaway: Use tested, lab-wide default settings (such as a particular spline or polynomial approach), and do spot checks rather than trying to custom-tune interpolation for each single voxel.

### 3. Impact on Functional Connectivity (FC)

Censoring versus interpolation for FC: For functional connectivity, removing or censoring TRs with high motion does not usually harm the correlation structure much, as long as the same TRs are removed in all timeseries used to compute the correlation. Correlation summarizes how two signals co-vary, not a strictly time-continuous dynamic measure. Deleting a few timepoints (for example, TR 30 and 55) from both series removes those data points but does not distort the remaining temporal structure of the overlapping points used in the correlation. Head motion censoring is generally not seen as a major problem for FC, in line with the broader fMRI literature.

Role of interpolation in FC: For many FC analyses, simply censoring (removing) problematic TRs is acceptable, and interpolation may not be strictly necessary. Interpolation might still be used if methods or pipelines require contiguous time series lengths, or when downstream tools cannot handle missing TRs gracefully.

### 4. Impact on Phase-Based Measures (e.g., ITPC)

Why censoring is more problematic here: Measures like Inter-Trial Phase Coherence (ITPC) or other phase-based or dynamic metrics are highly sensitive to the temporal structure of the signal. Removing data points by censoring breaks the continuity of the time series, changes the timing and dynamics of the signal, and can therefore distort the phase and alter the outcome of phase-based analyses.

Interpolation versus deletion: For phase-based measures, simply erasing TRs is more problematic than in FC. The recommended approach for phase-based metrics is to censor high-motion TRs (identify with an FD threshold) and then interpolate the censored data to reconstruct a continuous time series. While this approach still introduces assumptions, in practice it can be less damaging to phase dynamics than hard deletions, provided the interpolation behaves reasonably.
