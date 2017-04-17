# EMOD-InputData
Full set of input data files for use with the EMOD disease modeling software. 

## *Important*
This repository uses [LFS](https://git-lfs.github.com/) (large file storage) to manage the binaries and large JSON file(s). Note that a standard clone of the repository will only retrieve the metadata about these files managed with LFS. In order to retrieve the actual data, please follow these steps:

1. `git clone https://github.com/InstituteforDiseaseModeling/EMOD-InputData.git` (standard clone command)
2. `git lfs fetch` (caches the actual data on your local machine)
3. `git lfs checkout` (replaces the metadata in the files with the actual contents)

*Additional Note:* the GitHub "Download .ZIP" button will not package and deliver the actual binary data of the LFS managed files. You will need to use Git and follow the steps listed above in order to download the input data files.

For more information on downloading and using these files, see the EMOD software documentation at [https://institutefordiseasemodeling.github.io/EMOD/](https://institutefordiseasemodeling.github.io/EMOD/).

<a href="https://zenhub.com"><img src="https://raw.githubusercontent.com/ZenHubIO/support/master/zenhub-badge.png"></a>
