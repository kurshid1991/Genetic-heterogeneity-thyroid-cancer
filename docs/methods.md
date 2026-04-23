# Methods

## Data Source

All data was obtained from The Cancer Genome Atlas (TCGA) Thyroid Carcinoma project
(TCGA-THCA) via the NCI Genomic Data Commons (GDC) REST API. Only open-access,
harmonized (GRCh38/hg38) data was used.

## Data Types and Processing

### 1. Somatic Mutations (MAF)
- **Source:** Masked Somatic Mutation files (MuTect2 pipeline)
- **Format:** Mutation Annotation Format (MAF)
- **Processing:** All MAF files merged; binary mutation matrix constructed (1 = gene mutated in patient, 0 = wild-type). Genes mutated in fewer than 2 patients were excluded.
- **Key columns:** Hugo_Symbol, Variant_Classification, Variant_Type, IMPACT, SIFT, PolyPhen

### 2. Gene Expression (RNA-Seq)
- **Source:** STAR-Counts workflow (HTSeq quantification)
- **Metric:** FPKM (Fragments Per Kilobase of transcript per Million mapped reads)
- **Processing:** Log2(FPKM+1) transformation. Top 500 most variable genes selected for integration. Z-score normalization applied.

### 3. Copy Number Variation (CNV)
- **Source:** Masked Copy Number Segment files
- **Processing:** Segment mean values classified as amplification (>0.3), deletion (<-0.3), or neutral. Gene-level CNV summarized per patient.

### 4. DNA Methylation
- **Source:** Illumina Infinium HumanMethylation450 (HM450) BeadChip
- **Metric:** Beta values (0-1 scale, proportion of methylated signal)
- **Processing:** Top 5,000 most variable CpG probes selected. Top 500 used for multi-omics integration after z-score normalization.

### 5. miRNA Expression
- **Source:** miRNA-Seq Quantification
- **Metric:** Reads per million miRNA mapped (RPM)
- **Processing:** Log2(RPM+1) transformation. Top 200 most variable miRNAs selected. Z-score normalized.

### 6. Clinical Data
- **Source:** GDC Cases API endpoint
- **Fields:** Demographics (age, gender, race, vital status), pathologic staging (AJCC T/N/M), diagnosis, follow-up times

## Multi-Omics Integration

### Feature Matrix Construction
Features from each omics layer were selected based on variance and combined into a single patient × feature matrix:
- Mutations: 200 most recurrently mutated genes (binary encoding)
- Expression: 500 most variable genes (z-scored log2-FPKM)
- miRNA: 200 most variable miRNAs (z-scored log2-RPM)
- Methylation: 500 most variable CpG probes (z-scored beta values)

Total: ~1,400 features per patient across 4 omics layers.

### Dimensionality Reduction
Principal Component Analysis (PCA) applied to the integrated feature matrix. Components explaining 80% cumulative variance retained for clustering.

### Clustering
KMeans clustering tested for k = 2 through 10. Optimal k selected by maximum silhouette score. Final clustering performed with 50 random initializations and 1,000 maximum iterations.

### Cluster Characterization
Each cluster characterized by:
- Differentially mutated genes (frequency in-cluster vs. out-of-cluster)
- Clinical feature distributions (age, gender, tumor stage)
- Kaplan-Meier survival estimation

## Software and Tools
- Python 3.10 with pandas, NumPy, scikit-learn, SciPy, Matplotlib, Seaborn
- Conda environment management
- Jupyter notebooks for reproducible analysis
- GDC REST API for programmatic data access
