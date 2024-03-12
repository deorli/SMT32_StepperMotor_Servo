# SMT32_StepperMotor_Servo
A control system built with a stepper motor and a potentiometer to hold a set position or speed.

## IDE
The IDE I use for programming is [Visual Code Studio](https://code.visualstudio.com/).

## Build
To build project we need:
- [make](https://www.gnu.org/software/make/#download)
- [GCC compiler](https://gcc.gnu.org/install/download.html)

We can compile the project in two ways.
Using the command:
``` Bash
make app
```
will compile without additional debugging information.
The second version is:
``` Bash
make debug
```
and it contains additional information that will be useful during troubleshooting.

## Flash
To flash our board we will need:
- [Open OCD](https://openocd.org/pages/getting-openocd.html)

With Open OCD we will also be able to debug our code, which is really very useful when analyzing bugs, especially with more complex projects.

Of course, the program alone is not enough and we will need a hardware part: a programmer. I will be using the ST-Link V2 programmer, as it is already built into the [Nucleo board](https://www.ebay.co.uk/p/25020387073) I am using for this project.

For more information on available commands, use the command:
``` Bash
make help
```

## Directory structure
The directory structure is based on the
[Nsumo](https://github.com/artfulbytes/nsumo_video) project.

| Directory            | Description                                                           |
|----------------------|-----------------------------------------------------------------------|
| build/               | Build output (object files + executable)                              |
| build_debug/         | Build output with debug information (object files + executable)       |
| documnets/           | Documentation (e.g., SW architecure, diagrams, images)                |
| external/            | External dependencies (as git submodules if possible)                 |
| Makefiles/           | Folder contains main makefile and compile configuration               |
| source/              | Source files (.c/.h)                                                  |
| source/app/          | Source files for the application layer (see SW architecture)          |
| source/common/       | Source files for code used across the project                         |
| source/drivers/      | Source files for the driver layer (see SW architecture)               |
| source/test/         | Source files related to test code                                     |
| .github/             | Configuration file for GitHub actions                                 |