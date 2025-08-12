Numerical solutions codes for the article titled “The in-flight cooling of ballistic pyroclasts during mafic explosive eruptions: a numerical model” authored by
Chiedozie C. Ogbuagu, Kuang C. Lin, Thomas J. Jones and Silvio De Angelis and published in the Journal of Volcanology and Geothermal Research.

These MATLAB codes are supplementary files to the main research article mentioned above, please cite this orginal article when using any of the codes.

-------------------------------
1. System requirements
This code was written and tested on MATLAB version R2023A (Update 5, 64bit Windows). 

-------------------------------
2. Instructions for use

Ensure that all the .m files listed below are in the same folder. 

Open the codes in MATLAB and edit the variables or input parameters to suit your case.

To run the transport model (Transport_model.m), the FXY.m (function file) and CD.m file must also be open.

Also, to run any of the coupled models (E to H, below), ensure the FXY.m and CD.m files are also open.

The transient cooling model, can run on its own to solve the cooling of a stationary body, without the FXY.m and CD.m files being open.

-------------------------------

    m-file                   		  				Purpose						Variable to input
    ------                     						------- 					-----------------
A. FXY.m          				Function file for the Runge Kutta solver for particle trajectory.	Air/gas velocity
		       				Main outputs are particle velocity along X (U) and Y (V) directions

B. CD.m	       					Calculates the flow Reynolds number (Re) and assigns drag coefficient	Air/gas density
		       				based on the Re.

C. Transient_cooling_model.m 			Solves for the transient cooling of a hot stationary body		Radius, initial and ambient temperatures, thermal conductivity, 
															thermal diffusivity and heat transfer coefficent of the 																body/pyroclast
D. Transport_model.m 				Solves for the trajectory of erupted pyroclast(s)			Exit velocity, launch angle(s), pyroclast density and diameter. Also 															check for the air/gas density and viscosity

E. Trajectory_transient_cooling_Achenbach.m 	Solves for the trajectory and cooling of an erupted pyroclast		All inputs in C and D above
 						in-flight. The coupling equation was adapted from Achenbach (1978)
						and can be found in the article.

F. Trajectory_transient_cooling_Moitra.m 	Solves for the trajectory and cooling of an erupted pyroclast		All inputs in C and D above
 						in-flight. The coupling equation was adapted from Moitra et al. (2018)
						and can be found in the article.

G. Trajectory_transient_cooling_Stroberg.m 	Solves for the trajectory and cooling of an erupted pyroclast 		All inputs in C and D above
						in-flight. The coupling equation was adapted from Stroberg et al. (2010)
						and can be found in the article.

H. Trajectory_transient_cooling_Whitaker.m  	Solves for the trajectory and cooling of an erupted pyroclast 		All inputs in C and D above
						in-flight. The coupling equation was adapted from Whitaker (1972) 
						and can be found in the article.
