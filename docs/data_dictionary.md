# Data Dictionary

## Input Data

### MAF Files (Somatic Mutations)
| Column | Description |
|--------|-------------|
| Hugo_Symbol | HUGO gene symbol |
| Chromosome | Chromosome of variant |
| Start_Position | Genomic start position |
| End_Position | Genomic end position |
| Variant_Classification | Type: Missense, Nonsense, Frame_Shift, Splice_Site, etc. |
| Variant_Type | SNP, DNP, INS, DEL |
| Reference_Allele | Reference genome allele |
| Tumor_Seq_Allele2 | Alternate allele in tumor |
| Tumor_Sample_Barcode | TCGA sample barcode (28 chars) |
| HGVSc | HGVS coding sequence notation |
| HGVSp_Short | HGVS protein notation (short) |
| IMPACT | VEP impact: HIGH, MODERATE, LOW, MODIFIER |
| SIFT | SIFT prediction and score |
| PolyPhen | PolyPhen-2 prediction and score |

### Gene Expression Files (STAR-Counts)
| Column | Description |
|--------|-------------|
| gene_id | Ensembl gene identifier |
| gene_name | HUGO gene symbol |
| gene_type | Biotype (protein_coding, lncRNA, etc.) |
| unstranded | Raw read count (unstranded) |
| tpm_unstranded | Transcripts per million |
| fpkm_unstranded | Fragments per kilobase per million |

### CNV Segment Files
| Column | Description |
|--------|-------------|
| GDC_Aliquot | Sample aliquot barcode |
| Chromosome | Chromosome |
| Start | Segment start position |
| End | Segment end position |
| Num_Probes | Number of probes in segment |
| Segment_Mean | Log2(copy-number / 2) — 0 = diploid |

### Methylation Files (HM450)
| Column | Description |
|--------|-------------|
| Composite Element REF | CpG probe identifier (cg########) |
| Beta_value | Methylation beta value (0-1) |

### miRNA Quantification Files
| Column | Description |
|--------|-------------|
| miRNA_ID | miRBase mature miRNA identifier |
| read_count | Total aligned reads |
| reads_per_million_miRNA_mapped | Normalized expression (RPM) |

### Clinical Data
| Column | Description |
|--------|-------------|
| patient_id | TCGA patient barcode (12 chars, e.g., TCGA-BJ-A0Z9) |
| gender | male / female |
| age_at_diagnosis | Age at diagnosis in days |
| vital_status | Alive / Dead |
| days_to_death | Days from diagnosis to death (if dead) |
| days_to_last_follow_up | Days from diagnosis to last follow-up |
| tumor_stage | AJCC pathologic stage (Stage I-IV) |
| pathologic_T | Tumor classification (T1-T4) |
| pathologic_N | Nodal classification (N0-N1) |
| pathologic_M | Metastasis classification (M0-M1) |
| morphology | ICD-O-3 morphology code |

## Output Files

### mutation_matrix.tsv
Binary matrix (patients × genes). Value 1 = gene is mutated in patient. Only genes mutated in ≥2 patients included.

### expression_matrix.tsv
FPKM expression values (patients × genes). Raw values, not log-transformed.

### cnv_segments.tsv
All copy number segments from all patients, with Patient_ID and CNV_status columns added.

### methylation_matrix_top5k.tsv
Beta values for the 5,000 most variable CpG probes (patients × probes).

### mirna_matrix.tsv
RPM values for all detected miRNAs (patients × miRNAs).

### cluster_assignments.csv
| Column | Description |
|--------|-------------|
| Patient_ID | TCGA patient barcode |
| Cluster | Assigned molecular subtype (0, 1, ..., k-1) |
| PC1, PC2 | First two principal component scores |
