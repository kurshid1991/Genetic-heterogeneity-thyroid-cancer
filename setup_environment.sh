#!/bin/bash
# Setup script for Thyroid Cancer Multi-Omics Pipeline
# Run: bash setup_environment.sh

set -e

echo "============================================="
echo "Thyroid Cancer Multi-Omics Pipeline — Setup"
echo "============================================="

# Create conda environment
echo ""
echo "Creating conda environment 'thyroid_cancer'..."
conda create -n thyroid_cancer python=3.10 -y

# Activate
echo ""
echo "Activating environment..."
source $(conda info --base)/etc/profile.d/conda.sh
conda activate thyroid_cancer

# Install dependencies
echo ""
echo "Installing Python packages..."
pip install \
    pandas \
    numpy \
    matplotlib \
    seaborn \
    scikit-learn \
    scipy \
    requests \
    jupyterlab \
    nbformat \
    openpyxl

echo ""
echo "============================================="
echo "✅ Setup complete!"
echo ""
echo "To get started:"
echo "  conda activate thyroid_cancer"
echo "  jupyter lab notebooks/03_multiomics_integration.ipynb"
echo "============================================="
