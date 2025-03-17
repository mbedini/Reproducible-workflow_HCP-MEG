## 0. Install the AWS CLI

```sh
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
$ unzip awscliv2.zip
$ sudo ./aws/install
```

### Verify the installation

```sh
$ aws --version
```

### To update your installation

```sh
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

## 1. Obtain the AWS HCP CREDENTIALS and validate your account (you will only be asked once on your local machine from the CLI)

```sh
$ aws configure
```

## 2. Download the dataset with Datalad to your project folder

```sh
$ datalad clone https://github.com/datalad-datasets/human-connectome-project-openaccess $HOME/Desktop/Think_Open_initiative/HCP_MEG/subjects

$ cd $HOME/Desktop/Think_Open_initiative/HCP_MEG/subjects

# If you want data from all the 95 subjects
$ datalad get */MEG

# For example subjects try something like
$ datalad get 100307/* 102816/* 106521/*
```

### With the -n flag (e.g., `$ datalad get -n`) you can obtain also the meta-data

### To get the files you need locally on your machine cd to the folder and type

```sh
$ datalad get .
```

### This verifies what's inside your subjects' folder

```sh
$ datalad status --annex all
```

## 3. Create a virtual enviornment using conda and install MNE-Python

```sh
$ conda create --name=Think_Open --channel=conda-forge mne
```

## 4. Install the MNE-HCP and MNE-BIDS modules

### 4.1 Install MNE_HCP first (for this you need to install MNE in your base env)

```sh
$ pip install mne

$ git clone https://github.com/mne-tools/mne-hcp/

$ cd mne-hcp/

$ python setup.py install

$ python -c 'import hcp'
```

### 4.2 Next, install MNE-BIDS

```sh
$ conda activate Think_Open

$ conda install --channel conda-forge --no-deps mne-bids
```

### 4.3 Check if the installation was successful

```sh
$ python -c 'import mne_bids'
```

## 5. Use MNE-HCP to format the data in the way MNE-Python likes it

### 5.1 Run 'main_loop.sh'

```sh
$ bash ./main_loop_mne-hcp.sh
```

### 5.2 Use the function make anatomy to map the data to MNE compatible coordinate system and convert it to BIDS format

```sh
# add your root folder to the Python path (e.g., $HOME/Desktop/Think_Open_initiative)

# run 'make_anatomy.py' from your IDE of choice (e.g., Spyder)
```

### 5.3 (Alternatively) Run MNE-BIDS from the CLI

```sh
# To see available options

$ mne_bids raw_to_bids --help

$ mne_bids raw_to_bids --subject_id sub01 --task rest --raw data.edf --bids_root new_path
```

#### Example command

```sh
$ mne_bids raw_to_bids --subject_id=sub01 --task=rest --raw=$HOME/Desktop/Think_Open_initiative/HCP_MEG/From_Aspera/subjects/102816/MEG/Restin/rmegpreproc/102816_MEG_3-Restin_rmegpreproc.mat --bids_root=$HOME/Desktop/Think_Open_initiative/HCP_MEG/hcp_meg_subjects_for_mne/102816
```

## 6. Parse the JSON file from the command line

```sh
$ jq . dataset_description.json
```

### 6.1 You can also use Python

```python
import json

# Converts it to a dictionary
json.loads()
```

## 7. From a .tsv file containing your demographic information

You could either: A. Randomly select a sample of a given size, or; B. Randomly split the twins in two unrelated groups and select a sub-sample of subjects

## 8. (Optional) Install PyBIDS to manipulate the dataset and automatically generate reports (about sample demographics for instance)

```sh
$ pip install pybids
```

#### Convert the layout to a pandas dataframe using pybids

```python
df = layout.to_df()
df.head()
```

