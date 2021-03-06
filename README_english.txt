                                      #-#-#    R E A D   M E   #-#-#


This software aims at recognizing the modulation of a given signal by analysing its spectrogram thanks to an Artificial
Neuronal Network. It has been developped as part of a project in Télécom Bretagne, based on an idea proposed by INEO Défense.


In order to launch the software, two options are currently available. You can either run it directly in a console by typing
"python main.py <file_path>" where <file_path> is the relative path to the spectrogram, or run it via the Graphical User
Interface by typing "python ProjetS4.py".


Both relative and absolute path to your signal or spectrogram are accepted. Splitted images of signals and final analyzed 
spectrogram are available in the "tmp/" folder, depending on the stage of the calculation.
At the moment, only .jpg, .bmp and .wav files are supported. In the case of a .wav file, the spectrogram will automatically
be generated and saved as a jpg.


Python is highly sensitive to indentation. Current files are written with an indentation of four spaces. If you happen to
modify something in one or several of those files, please respect this indentation system or it will not compile.


This software has some dependencies and needs several items to be installed in order to work: Python 3 (a compatibility mode is
integrated for Python2 though), numpy, Pillow, scipy and theano. If you try to run it without installing the dependancies, an 
error message should appear in the console and invite you to run the setup.py script. Please note that you should run this 
setup script with root privileges.
As a general principle, we invite you to launch the software from a shell, and not directly by clicking on it, as more messages
will be displayed, which can be useful in case of an unexpected behavior.


The GUI runs on tkinter, which comes by default with Python. You can select a file with the dedicated button, set the threshold
and margin values, lines' width and color, and choose between the CNN network or the SDA network with the appropriate toggle
button. The compute button will then launch the calculation and display the spectrogram.


The software has several modules. Basically, the main module starts by calling the spectrogram module in order to generate the 
spectrogram if needed, then by calling sign_detect2 module in order to detect signals. After that, it calls the resize module 
to generate matrixes directly usable by the ANN. The use_CNN_compatible module is then called in order to get the ANN's 
prediction. Finally, it will call the reass module that will reassemble the complete spectrogram. If the GUI is used, then the 
ProjetS4 module will display the GUI and proceed similarly to the main module. Almost all modules have some functions in common
that are in the tools module.



Contact: s4-projet-52-2016@mlistes.telecom-bretagne.eu
         benoit.porteboeuf@telecom-bretagne.eu
