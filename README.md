# Centered and Compact Signal and Image derivatives

The provided source code performs the following

 - List item Generates convolution kernels to calculate Signal and Image Derivatives by linear convolution
 - Calculates Signal and Image Derivatives using the work of Lele [--] and Belyayev [--], with a very efficient implementation using causal and anti-causal 1D filtering

Full details can be found in the relevant publication
[IFIP 2013 paper](https://link.springer.com/content/pdf/10.1007/978-3-642-41142-7_33.pdf)

The code can be executed in any version of Matlab and Octave and it does not require any toolboxes.

You are free to use this source code for any academic or non-academic purpose, provided that the code is redistributed as is, with the author credentials, and that the following paper is referenced:

> Delibasis, K. K., Kechriniotis, A., & Maglogiannis, I. (2013, September). On centered and compact signal and image derivatives for feature extraction. In _IFIP International Conference on Artificial Intelligence Applications and Innovations_ (pp. 318-327). Springer, Berlin, Heidelberg



## 1. Generating convolution kernels to calculate Signal and Image Derivatives
This source code implements the theorems for generating the finite impulse response (FIR) filters for signal derivatives of odd and even order. These filters are essentially symmetric finite differences, therefore we will use the terms, central, centered of FIR interchangeably. A very fast numerical implementation of central derivatives is also presented
### Example 1
Calculate the kernel <img src="https://render.githubusercontent.com/render/math?math=K"> with length <img src="https://render.githubusercontent.com/render/math?math=2n%2B1"> 
for the order <img src="https://render.githubusercontent.com/render/math?math=ord"> derivative

> K=descrete_deriv(ord,n)

Kernel <img src="https://render.githubusercontent.com/render/math?math=K"> is calculated as

> 0.0111,  -0.1500,  1.5000,  -2.7222,  1.5000,  -0.1500,  0.0111

### Example 2
Given an image <img src="https://render.githubusercontent.com/render/math?math=I">, calculate the <img src="https://render.githubusercontent.com/render/math?math=I_{xy}=\frac{\partial^2 I}{\partial x\partial y}"> using a kernel with size 9×9 

We set the following
> n=4;

> ord1=1;

> ord2=1;


Then the following function is called

> [I,kc]=image_der1(I,ord1, ord2, n1,n2)
The original cameraman image, the 1st order derivative along x and y axis and the 9x9 corresponding kernel are shown below.

![The original image](images/cameraman.bmp)
![The <img src="https://render.githubusercontent.com/render/math?math=I_{xy}"> image](images/cameraman_xy.png)
![The 9x9 kernel](images/kernel_xy.png)

## Calculating image derivatives using IIR filtering - Compact derivatives
Signal and image derivatives can also be calculated using compact derivatives. This is a sophisticated method that involves both FIR filtering (centered differences) as well as solving a tridiagonal or pentadiagonal system of linear equations. In our work, the later part has been formulaed as a cascade of causal and anticausal filter. For more details, see our [IFIP 2013 paper](https://link.springer.com/content/pdf/10.1007/978-3-642-41142-7_33.pdf).

Any combination of 1st and 2nd order derivatives of any image <img src="https://render.githubusercontent.com/render/math?math=I"> I is supported by the provided source code <img src="https://render.githubusercontent.com/render/math?math=I_{xy}, I_x, I_y, I_{xx}, I_{yy}, I_{xxy}, I_{xyy}, I_{xxyy}">. 
> [Ix,Iy,Ixy,Ixx,Iyy,Ixyy,Ixxy,Ixxyy]=image_der_IIR(I,n1,n2);

n1 is the accuracy of the 1st derivative, with possible values 6, 8 and 10

n2 is the accuracy of the 2nd derivative, with possible values 4, 6, 8 and 10


The spectral response of exemplar derivative operators (both centered and compact) for the 1st order derivative are shown below.
![1st order derivative operator spectral response](images/AIAI_fig2a.png)





You can open a file from **Google Drive**, **Dropbox** or **GitHub** by opening the **Synchronize** sub-menu and clicking **Open from**. Once opened in the workspace, any modification in the file will be automatically synced.





