# Multi-Omics Analysis of Genetic Heterogeneity in Thyroid Cancer

[![Python 3.10](https://img.shields.io/badge/Python-3.10-blue.svg)](https://python.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![TCGA](https://img.shields.io/badge/Data-TCGA--THCA-orange.svg)](https://portal.gdc.cancer.gov/projects/TCGA-THCA)

## Overview

A comprehensive **multi-omics bioinformatics pipeline** analyzing genetic heterogeneity in thyroid carcinoma (TCGA-THCA). This project integrates **6 data types** from the NCI Genomic Data Commons (GDC) to identify molecular subtypes and characterize the mutational landscape of thyroid cancer.

### Data Sources (~3,200+ files)

| Data Type | GDC Category | Files | Description |
|-----------|-------------|-------|-------------|
| Somatic Mutations | Masked Somatic Mutation (MAF) | ~498 | SNVs, indels, variant classification |
| Gene Expression | RNA-Seq (STAR-Counts) | ~572 | mRNA quantification (FPKM/TPM) |
| Copy Number Variation | Masked CNV Segment | ~494 | Chromosomal gains and losses |
| DNA Methylation | Illumina HM450 | ~567 | CpG methylation beta values |
| miRNA Expression | miRNA-Seq Quantification | ~570 | MicroRNA expression profiles |
| Clinical Data | GDC Cases API | ~507 | Demographics, staging, survival |

## Key Results

### Mutation Landscape
- Identified the most frequently mutated genes across ~500 thyroid cancer patients
- BRAF V600E confirmed as the dominant driver mutation
- Variant classification and impact distribution analysis

### Multi-Omics Molecular Subtypes
- Integrated mutation, expression, miRNA, and methylation data
- PCA dimensionality reduction on combined feature matrix
- KMeans clustering with optimal k determined by silhouette analysis
- Subtypes characterized by differential mutation patterns and clinical features

### Generated Figures
| Figure | Description |
|--------|-------------|
| `fig1_top_mutated_genes.png` | Top 30 most frequently mutated genes |
| `fig2_variant_classification.png` | Variant classification and type distribution |
| `fig3_impact_distribution.png` | Mutation impact (HIGH/MODERATE/LOW) |
| `fig4_expression_heatmap.png` | Top 50 variable genes expression heatmap |
| `fig5_cnv_summary.png` | Copy number alteration landscape |
| `fig6_clinical_overview.png` | Clinical demographics (age, stage, gender) |
| `fig7_pca_variance.png` | PCA scree plot and cumulative variance |
| `fig8_elbow_silhouette.png` | Optimal cluster selection (elbow + silhouette) |
| `fig9_pca_clusters.png` | Multi-omics PCA colored by molecular subtype |
| `fig10_mutation_clustermap.png` | Mutation heatmap by cluster |
| `fig11_clinical_by_cluster.png` | Clinical features stratified by subtype |
| `fig12_survival_curves.png` | Kaplan-Meier survival by molecular subtype |

## Project Structure

```
thyroid_cancer_project/
├── README.md
├── PORTFOLIO_SUMMARY.md
├── LICENSE
├── .gitignore
├── setup_environment.sh
├── data/
│   ├── maf/                  # Somatic mutation MAF files
│   ├── expression/           # RNA-Seq gene expression files
│   ├── cnv/                  # Copy number variation segments
│   ├── methylation/          # DNA methylation beta values
│   ├── mirna/                # miRNA expression quantification
│   └── clinical/             # Clinical data (CSV)
├── notebooks/
│   ├── 01_data_download.ipynb      # GDC API data acquisition
│   ├── 02_mutation_analysis.ipynb  # Somatic mutation landscape
│   └── 03_multiomics_integration.ipynb  # Multi-omics PCA + clustering
├── figures/                  # Publication-quality figures (13 PNGs)
├── results/                  # Processed matrices and tables
├── reports/                  # PDF reports for portfolio
└── docs/
    ├── methods.md            # Detailed methodology
    ├── data_dictionary.md    # Column definitions and data sources
    └── references.md         # Citations and resources
```

## Installation & Setup

### Prerequisites
- Python 3.10+
- Conda (Miniconda or Anaconda)
- Git
- ~10 GB disk space for data

### Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/kurshid1991/Genetic-heterogeneity-thyroid-cancer.git
cd Genetic-heterogeneity-thyroid-cancer

# 2. Create conda environment
conda create -n thyroid_cancer python=3.10 -y
conda activate thyroid_cancer

# 3. Install dependencies
pip install pandas numpy matplotlib seaborn scikit-learn scipy requests jupyterlab

# 4. Run the pipeline
jupyter lab notebooks/03_multiomics_integration.ipynb
```

### Environment Setup (automated)

```bash
bash setup_environment.sh
```

## Methods

### Data Acquisition
All data downloaded programmatically from the [GDC Data Portal](https://portal.gdc.cancer.gov/) using the GDC REST API. Only open-access data is used (no dbGaP authorization required).

### Mutation Analysis
- MAF files merged and filtered (genes mutated in ≥2 patients)
- Binary mutation matrix constructed (patients × genes)
- Variant classification and functional impact assessed via VEP annotations

### Multi-Omics Integration
1. **Feature selection** per omics layer:
   - Mutations: top 200 recurrently mutated genes (binary)
   - Expression: top 500 most variable genes (log2-FPKM, z-scored)
   - miRNA: top 200 most variable miRNAs (log2-RPM, z-scored)
   - Methylation: top 500 most variable CpG probes (z-scored)
2. **Concatenation** into a unified patient × feature matrix
3. **PCA** for dimensionality reduction
4. **KMeans clustering** with optimal k via silhouette analysis
5. **Characterization** by differential mutation rates and clinical features

### Survival Analysis
Kaplan-Meier estimator with log-rank test across molecular subtypes.

## Tools & Technologies

- **Languages:** Python 3.10
- **Data Source:** NCI Genomic Data Commons (GDC) REST API
- **Libraries:** pandas, NumPy, scikit-learn, SciPy, Matplotlib, Seaborn
- **Environment:** Conda, JupyterLab, WSL2 (Ubuntu)
- **Version Control:** Git, GitHub

## References

1. The Cancer Genome Atlas Research Network. *Integrated genomic characterization of papillary thyroid carcinoma.* Cell, 159(3), 676-690 (2014).
2. Grossman et al. *Toward a Shared Vision for Cancer Genomic Data.* NEJM, 375, 1109-1112 (2016).
3. GDC Data Portal: https://portal.gdc.cancer.gov/
4. TCGA-THCA Project: https://portal.gdc.cancer.gov/projects/TCGA-THCA

## Author

**Kurshid**
- GitHub: [@kurshid1991](https://github.com/kurshid1991)

## License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.
