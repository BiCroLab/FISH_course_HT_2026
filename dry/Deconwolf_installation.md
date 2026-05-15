# Mini Guide to use and install Deconwolf on our HPC

This guide explains first how to convert `.nd2` microscopy files into `.tif` format and then how to process them with [`Deconwolf'](https://github.com/elgw/deconwolf) (dw).

---

## Bonus tip

Deconwolf accepts `.tif` files as input. Erik Wernesson conveniently developed [`nd2tools`](https://github.com/elgw/nd2tool), a package that can:

- convert `.nd2` files into `.tif`

- provide useful metadata and acquisition information about the images

- generate a basic script template for running Deconwolf

For Apple/macOS users, there is a convenient AppImage available in the **Releases** section of the repository:

- https://github.com/elgw/nd2tool/releases

---

## 1. Create the Conda Environment

The required packages and dependencies are already prepared in the accompanying environment files:

- `image_analysis_env.yml`
- `image_analysis_env.txt`

Using the `.yml` file:

```bash
conda env create -n deconwolf -f image_analysis_env.yml
```

Or using the `.txt` specification:

```bash
conda create --name deconwolf --file image_analysis_env.txt
```

---

## 2. Install Deconwolf

Go on the dw [`repository'](https://github.com/elgw/deconwolf) and clone it:

```bash
git clone https://github.com/elgw/deconwolf
```

> It is recommended to keep the `deconwolf` repository outside of the `nd2tool` folder structure.

Activate the conda environment created above:

```bash
conda activate deconwolf
```

Go inside the cloned repository and install:

```bash
cd deconwolf
cmake --install . --prefix $CONDA_PREFIX
```

---

## 3. Go to the Correct Folder and Activate the Conda Environment

```bash
cd /group/bienko/shared/04_image_analysis/nd2tool
conda activate deconwolf
```

---

## 4. Get Information About the `.nd2` File

Use the `--info` flag to inspect metadata and acquisition details:

```bash
./n2dtool.AppImage image.nd2 --info
```

Example:

```bash
./n2dtool.AppImage /group/bienko/data/scope/GiuliaDC/20251217_BICRO_GD006_PK1_15MIN_newAcq/pk1_15min_Allchannels_NewAcq_100X.nd2 --info
```

---

## 5. Convert `.nd2` to `.tif`

Run:

```bash
./n2dtool.AppImage image.nd2
```

Example:

```bash
./n2dtool.AppImage /group/bienko/data/scope/GiuliaDC/20251217_BICRO_GD006_PK1_15MIN_newAcq/pk1_15min_Allchannels_NewAcq_100X.nd2
```

The `.tif` files will be generated automatically in the output directory.

---

## 6. Generate a Deconwolf Script

Run:

```bash
./n2dtool.AppImage image.nd2 --deconwolf
```

This command generates a basic skeleton for a Deconwolf script.

An adapted version for the HPC environment is already available in the same folder, together with an example workflow for image analysis.

---
