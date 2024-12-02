# Illumination Engineering Homework Repository

This repository contains my solutions for the **Illumination Engineering** course at KMITL. Below are the key responsibilities and tasks undertaken in this work:

## Tasks Overview

### 1. Plotting Polar Curves using MATLAB
#### Script Name: `Extra_1_Q4_Polar_Curve_Plot.m`
- **Input File**: `Extra_1_Q4_Luminous_Intensity_Distribution.xlsx`
- **MATLAB Add-on**: [Perfect Polar Plot](https://www.mathworks.com/matlabcentral/fileexchange/73967-perfect-polar-plots)

**Steps and Principles**:
1. The Excel file contains vertical and horizontal headers (`Gamma`, `CPlane`) prefixed as `Y*` and `C*`.
2. The script reads luminous intensity data for `C0°`, `C15°`, `C30°`, `C45°`, and `C90°` and stores it in respective variables.
3. A `gamma` array is initialized (0° to 90° with a 2.5° step).
4. Polar curves are plotted using the `Perfect Polar Plot` add-on. Plot specifications include:
   - Start at 0° (bottom) with counterclockwise increments.
   - Set plot bounds (0, 3000 cd) with interval markings (500, 1000, ..., 3000 cd).
   - Transform polar to Cartesian coordinates using `polgrid2cart`.
   - Plot for the specified C-planes with distinct colors and labels.

**Plot Title**:  
`Extra 1 Q4 Polar Curve of Luminous Intensity for C0°, C15°, C30°, C45°, C90°`

---

### 2. Plotting Polar Curves for TLP22S2-4L using IES Files
#### Files Used:
1. `TLP22S2-4L_HIGH_HW3.ies`
2. `Extra_2_convert_ies_to_csv.m`
3. `Extra_2_TLP22S2_4L_Polar_Curve_Plot.m`
4. `Extra_2_TLP22S2_4L_Polar_Curve_Plot_Symmetrical_C0.m`
5. `Extra_2_TLP22S2-4L_Luminous_Intensity_Distribution.csv` (generated from `Extra_2_convert_ies_to_csv.m`)

**Steps and Principles**:
1. Convert the IES file to CSV format using `Extra_2_convert_ies_to_csv.m`. The CSV headers (`C-Plane`, `Gamma`) are formatted without prefixes.
2. Use `Extra_2_TLP22S2_4L_Polar_Curve_Plot.m` to:
   - Transpose the table and adjust headers to `C0, C10, ..., C360`.
   - Plot the polar curves for specified C-planes (0°, 30°, 60°, 90°).
3. Create symmetrical polar curves (positive and negative gamma) using `Extra_2_TLP22S2_4L_Polar_Curve_Plot_Symmetrical_C0.m`:
   - Compare results with those from the IESviewer software.

**Additional Details**:
- Plot symmetrical gamma values on `C-plane = 0°`.
- Align results for comparison with IESviewer outputs.

---

## Notes
- Detailed Thai instructions for each task are included in the respective scripts.
- Homework details and data tables can be found in the provided [HW3 document](HW3-2567-Sept-6-2024-Unlocked.pdf).
