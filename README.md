# Reproducible-workflow-HCP-MEG-subjects

Introduction: The MEG community has witnessed a rise in interest in implementing
standard and reproducible pipelines for data analysis (Gross et al. 2013; Jas et al. 2018; Niso
et al. 2018). Recently, increasing efforts have been put forward by the core developers of the
main software tools available (Brainstorm, Fieldtrip, and MNE-Python) to implement and
enable robust and efficient compliance with those guidelines.

Main objectives: The aim of this project was to prepare the MEG data from the HCP-MEG
subjects (Larson-Prior et al. 2013; HCP_dataset) in a reproducible way to enable subsequent
analyses using open-source software. First, the MEG data was converted into a format
compatible with MNE-Python (stable_release). The next goals were to organize the data in
the BIDS standard, validate this process, and use scripting tools to automatically query the
dataset based on demographic information stored as file meta-data (as the sample includes 68
twins). This opens up the possibility of investigating the role of genetic contributions to
resting-state connectivity patterns (for example, see Haak & Beckmann 2019). Another use
case would be randomizing sample selection to exclude potential genetic confounds.

Technical implementation: I used Datalad (https://www.datalad.org/) to access the
HCP-MEG dataset from the command line (through an Amazon Web Services account).
Datalad leverages git-annex, a version control tool, to download an exact and synchronized
copy of this dataset. Next, I created a conda virtual environment where I installed all the
Python packages and dependencies required: first, MNE-HCP to convert the files into an
MNE compatible format (mne-hcp), second, MNE-BIDS (Appelhoff et al. 2019;
MNE-BIDS_docu) to ‘BIDS-ify’ the data, and finally PyBIDS to query and manipulate the
dataset (pybids_docu).

Results: Overall the integration of the computational tools reported provides an effective way to interact with the HCP-MEG data. This project provides a fully reproducible and version-controlled workflow for the HCP-MEG data, from downloading, preparing, and analyzing this dataset potentially all the way to storing the results and code in a public repository.
