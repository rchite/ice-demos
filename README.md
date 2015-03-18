Table of Contents
-----------------

  1. Building the Demos
  2. Running the Ice Demos
  3. Running the C++ demos
  4. Running the Java demos
  5. Running the Android demos
  6. Running the C# demos
  7. Running the Python demos
  8. Running the Ruby demos
  9. Running the PHP demos


======================================================================
1. Building the Demos
======================================================================

This section describes how to build the demos included in the Ice demo
distribution.

The demo archive contains sample programs for each language mapping
that Ice supports. Not all demos will build against all Ice
distributions. Distributions for specific platform/tool combinations
may not support every Ice language mapping.

Depending on the language mapping, various build tools are required
for building the demos. The C++, C#, and PHP demos use makefiles, the
Java demos use the Apache Foundation's ant build tool, and the Android
demos require Eclipse and the Slice2Java plug-in.

NOTE: The Ruby and Python demos do not need to be built.


Prerequisites
-------------

The makefiles for C++, C#, and PHP require GNU make 3.80 or later. If
your system does not come with GNU make, you can find information on
how to acquire it at the following link:

  http://www.gnu.org/software/make/

The Ice for Java demos require Ant 1.7.0, but we recommend using the
most recent release available. Ant can be obtained at:

  http://ant.apache.org/bindownload.cgi

The Ice for Android demos require Eclipse and the Slice2Java plug-in.
The demos were tested with Eclipse Helios (3.6). Instructions for
installing the Slice2Java plug-in are available on the ZeroC web site:

  http://www.zeroc.com/eclipse.html


Build Instructions
------------------

To build the demos you need to:

  - Configure your system according to the directions in the main
    README file (for binary distributions) or the platform-specific
    INSTALL file (if you built Ice from sources).

  - If you are using a non-RPM installation and you did not install 
    Ice in its default location (/opt/Ice-3.4.2), set the environment
    variable ICE_HOME to point to your Ice installation root 
    directory. For example, in a Bash shell:

    $ export ICE_HOME=$HOME/testing/Ice-3.4.2

    With a non-RPM installation, you also need to either create an 
    /opt/Ice-3.4 symbolic link (as described in the binary 
    distribution README file), or add the Ice library directory to 
    your shared library search path. For example, on Linux x86:

    $ export LD_LIBRARY_PATH=$ICE_HOME/lib:$LD_LIBRARY_PATH
  
    The Ice library directory is $ICE_HOME/lib64 on Linux x86_64, 
    $ICE_HOME/lib/sparcv9 on Solaris for SPARC 64-bit and
    $ICE_HOME/lib/amd64 on Solaris for x86 64-bit.

  - Review the build settings found in config/Make.rules (C++),
    config/Make.rules.cs (C#), config/Make.rules.php (PHP) and
    config/build.properties (Java) and adjust any you want changed.
    For example, for C++ and C#, set OPTIMIZE=yes in order to build
    with optimization, or for C++ set LP64=yes if you are building
    against a 64-bit Ice installation (on Mac OS X, set CXXARCHFLAGS
    to build 32-bit and 64-bit FAT binaries).

  - Build the demos. For example:

    # C++ demos
    cd Ice-3.4.2-demos/demo
    make

    # C# demos
    cd Ice-3.4.2-demos/democs
    make

    # PHP demos
    cd Ice-3.4.2-demos/demophp
    make

    # Java demos
    cd Ice-3.4.2-demos/demoj
    ant


Build Instructions for Android
------------------------------

Several sample Android projects are provided in the demoj/android
subdirectory. You must use Eclipse and the Slice2Java plug-in to build
these projects.

In Eclipse, you can open a sample project by choosing File->Import...;
in the "General" group, select "Existing Project into Workspace", then
open one of the subdirectories of demoj/android.

The sample projects are configured to locate the Ice run time JAR file
(Ice.jar) via the ICE_HOME classpath variable, as described in the Ice
manual:

  http://doc.zeroc.com/display/Ice/Eclipse+Plug-in

If you installed Ice.jar in a different location, you will need to add
it as an external JAR file in each sample project:

 1. Open the project's properties and select Java Build Path
 2. Click on the Libraries tab
 3. Click Add External JARs... and navigate to Ice.jar
 4. Click OK to save your settings


======================================================================
2. Running the Ice Demos
======================================================================

Most demos consist of a single server and client. The instructions to
run a demo depend on the programming language. Instructions for each
language are included below. Some demo directories contain README
files if additional steps are necessary.


======================================================================
3. Running the C++ demos
======================================================================

To run a demo, open a terminal window, change to the desired demo
directory, and enter the following command to run the server:

$ ./server

To run the client, open another terminal window, also change to the
desired demo directory, and run:

$ ./client


======================================================================
4. Running the Java demos
======================================================================

After a successful build, the compiled classes are stored in a
subdirectory named "classes" in each demo directory. You need to add
this subdirectory to your CLASSPATH.

For example, with a bash shell:

$ export CLASSPATH=classes:$CLASSPATH

To run a demo, open a terminal window, change to the desired demo
directory, and enter the following command to run the server:

$ java Server

To run the client, open another terminal window, also change to the
desired demo directory, and run:

$ java Client


======================================================================
5. Running the Android demos
======================================================================

After successfully building an Android project, deploy it onto a
suitable emulator or device and review the README file in the project
subdirectory for further instructions.


======================================================================
6. Running the C# demos
======================================================================

The C# demos are only supported on SuSE Enterprise Linux Server but
may work on other platforms. Note however that the Ice for .NET run
time is included only in the RPM distribution for SuSE Enterprise
Linux Server.

To run a demo, open a terminal window, change to the desired demo
directory, and enter the following command to run the server:

$ mono server.exe

To run the client, open another terminal window, also change to the
desired demo directory, and run:

$ mono client.exe


======================================================================
7. Running the Python demos
======================================================================

To run a demo, open a terminal window, change to the desired demo
directory, and enter the following command to run the server:

$ python Server.py

To run the client, open another terminal window, also change to the
desired demo directory, and run:

$ python Client.py


======================================================================
8. Running the Ruby demos
======================================================================

Ice provides only client demos in Ruby since Ice for Ruby does not
support server-side activities. In order to run a sample client, you
must first start its corresponding server from another Ice language
mapping. For example, start the C++ hello server:

$ cd $HOME/testing/Ice-3.4.2-demos/demo/Ice/hello
$ ./server

To run the client, open another terminal window, change to the
corresponding demo directory, and run:

$ cd $HOME/testing/Ice-3.4.2-demos/demorb/Ice/hello
$ ruby Client.rb


======================================================================
9. Running the PHP demos
======================================================================

PHP demos are provided in the demophp directory.

The Ice extension for PHP is provided as a dynamically-loadable shared
library in Linux RPM distributions. On all other Unix platforms,
you will need to build PHP and the Ice extension from source code.
Please refer to the php/INSTALL file included in the Ice source
distribution for more information.

The examples in demophp/Ice/hello and demophp/Glacier2/hello
demonstrate the use of the Ice extension for PHP in a dynamic Web
page, whereas the example in demophp/Ice/value requires PHP's command
line interpreter. All examples require that an Ice server be
available; a matching server from any of the other language mappings
can be used. A README file is provided in each of the example
directories.

Note that you may need to modify the php.ini files in each demo
directory to match your PHP installation and ensure that the Ice
extension is loaded properly.
