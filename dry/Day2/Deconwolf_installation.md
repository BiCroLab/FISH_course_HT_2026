# Mini Guide to use Deconwolf on our HPC

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

## 1. Deconwolf as a module

First of all, you need to login our HPC.

Deconwolf has been already conveniently installed on our HPC as a module. All you have to do is:

```bash
module load deconwolf
```
You can find detailed info about dw on the [`repository`](https://github.com/elgw/deconwolf) on GitHub.

Deconwolf acts on .tif images. You can directly export your images in this format from Fiji or read below.


## 2. Use `.nd2` File to Get Information About Your Image

Go to the folder where you downloaded the release of `nd2tool` and use the `--info` flag to inspect metadata and acquisition details:

```bash
./n2dtool.AppImage image.nd2 --info
```
---

## 3. Convert `.nd2` to `.tif`

To convert your image, run:

```bash
./n2dtool.AppImage image.nd2
```

The `.tif` files will be generated automatically in the directory with the `nd2 image`.

---

## 4. Generate a Deconwolf Script and launch it!

Run:

```bash
./n2dtool.AppImage image.nd2 --deconwolf
```

This command generates a basic skeleton for a Deconwolf script.

Here you can find an example of a Deconwolf [`script`](dw_example_script.sh) adapted to our HPC environment.

---

## Extra

There is also a nice package to do Deconvolution directly in Fiji: [`DeconvolutionLab2`](https://bigwww.epfl.ch/deconvolution/deconvolutionlab2/).
