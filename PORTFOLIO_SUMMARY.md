# Portfolio Summary — Multi-Omics Thyroid Cancer Genomics Pipeline

## Project Title
**Multi-Omics Analysis of Genetic Heterogeneity in Thyroid Cancer (TCGA-THCA)**

## One-Line Summary
End-to-end bioinformatics pipeline integrating 6 omics data types from 3,200+ files across ~500 thyroid cancer patients to identify molecular subtypes through unsupervised multi-omics clustering.

## Problem Statement
Thyroid cancer is the most common endocrine malignancy, yet its molecular heterogeneity remains incompletely characterized. Understanding the distinct molecular subtypes is critical for precision medicine approaches to diagnosis and treatment.

## What I Built
A complete Python bioinformatics pipeline that:
- Downloads ~3,200 files from the NCI Genomic Data Commons (GDC) API
- Processes 6 data types: somatic mutations, gene expression (RNA-Seq), copy number variation, DNA methylation, miRNA expression, and clinical data
- Constructs patient × feature matrices for each omics layer
- Integrates multi-omics data via concatenated feature matrices with per-layer normalization
- Performs PCA dimensionality reduction and KMeans clustering with automated k selection
- Generates 13 publication-quality figures
- Includes Kaplan-Meier survival analysis stratified by molecular subtype

## Technical Skills Demonstrated
- **Bioinformatics:** MAF file processing, mutation matrix construction, variant annotation, CNV analysis, methylation data handling
- **Data Engineering:** GDC REST API integration, automated download pipeline (3,200+ files), data merging and cleaning
- **Machine Learning:** PCA, KMeans clustering, silhouette analysis, StandardScaler normalization
- **Statistical Analysis:** Differential mutation frequency, Kaplan-Meier survival estimation, clinical feature association
- **Visualization:** Matplotlib, Seaborn — heatmaps, clustermaps, survival curves, PCA scatter plots
- **Software Engineering:** Modular notebook design, reproducible pipeline, conda environment management, Git/GitHub

## Key Deliverables
- 3 Jupyter notebooks (download → analysis → integration)
- 13 publication-quality figures
- Processed data matrices (mutation, expression, CNV, methylation, miRNA)
- Cluster assignments with clinical characterization
- Comprehensive documentation (methods, data dictionary, references)

## Data Scale
| Metric | Value |
|--------|-------|
| Total files processed | ~3,200+ |
| Patients analyzed | ~500 |
| Omics layers integrated | 6 |
| Combined features | ~1,400 |
| Figures generated | 13 |

## GitHub
[github.com/kurshid1991/Genetic-heterogeneity-thyroid-cancer](https://github.com/kurshid1991/Genetic-heterogeneity-thyroid-cancer)
