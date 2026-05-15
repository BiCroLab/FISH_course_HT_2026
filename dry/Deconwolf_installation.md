# Mini Guide to use and install Deconwolf on our HPC

This guide explains first how to convert `.nd2` microscopy files into `.tif` format and then how to process them with [`Deconwolf`](https://github.com/elgw/deconwolf) (dw).

---

## Bonus tip

Deconwolf accepts `.tif` files as input. Erik Wernesson conveniently developed [`nd2tools`](https://github.com/elgw/nd2tool), a package that can:

- convert `.nd2` files into `.tif`

- provide useful metadata and acquisition information about the images

- generate a basic script template for running Deconwolf

For Apple/macOS users, there is a convenient AppImage available in the **Releases** section of the repository:

- https://github.com/elgw/nd2tool/releases

I would recommend to use this method.

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

Go on the dw [`repository`](https://github.com/elgw/deconwolf) and clone it:

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
mkdir builddir
cd builddir
cmake ..
cmake --install . --prefix $CONDA_PREFIX
```

Now that everything is set, let's get to work!

---

## 4. Use `.nd2` File to Get Information About Your Image

Go to the folder where you downloaded the release of `nd2tool` and use the `--info` flag to inspect metadata and acquisition details:

```bash
./n2dtool.AppImage image.nd2 --info
```
---

## 5. Convert `.nd2` to `.tif`

To convert your image, run:

```bash
./n2dtool.AppImage image.nd2
```

The `.tif` files will be generated automatically in the directory with the `nd2 image`.

---

## 6. Generate a Deconwolf Script

Run:

```bash
./n2dtool.AppImage image.nd2 --deconwolf
```

This command generates a basic skeleton for a Deconwolf script.

An adapted version for the HPC environment is available in the  folder, together with an example workflow for image analysis.

---
