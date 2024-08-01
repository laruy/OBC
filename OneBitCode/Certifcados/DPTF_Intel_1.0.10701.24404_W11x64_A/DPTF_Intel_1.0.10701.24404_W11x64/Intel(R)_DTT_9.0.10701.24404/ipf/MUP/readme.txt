================================================================================
Dell Manageable Update Package (MUP) Creation Instructions
================================================================================

1.0 Overview

    This document provides instructions for creation of Manageable Update
    Packages (MUP's) for Dell automation.  Instructions are provided to create
    packages conforming to MUP specification revisions 2.4.5 and 3.0.

2.0 MUP 2.4.5 Package Creation Instructions

    To create a MUP 2.4.5 package, take the provided MUP.XML and the self-
    extracting version of the DTT installer (dttinstaller.exe) and zip the two
    together into a zip file.  That is all that is required.

3.0 MUP 3.0 Package Creation Instructions

3.1 Install the Dell Dominion tool (Not provided)

3.2 Browse to the location of the x64 directory for the drivers to be included in
    the MUP package.  Browse into the x64 directory.  Zip all the files in the
    directory into an x64.zip archive.
    NOTE:  The ZIP created must be in a folder which contains no other folders
           or the Dominion tool will have issues determining the location.
           BKM is to place the ZIP in the x64 directory itself.

3.2 Start the Dell Dominion tool

3.3 Select the "MUP" tab on the left side

3.4 Click on the "Browse" button next to the option for "DCH Driver Payload (WU
    zip file)".  Browse to the location x64.zip archive create previously and
    click "OK".

3.5 Click the "Next" button at bottom of the screen.

3.6 Click the "Next" button at bottom of the screen. (On "Review Payload Content"
    screen.)

3.7 How to fill out the "Additional Details" screen

    1. Set the "Component ID" to 102309

    2. Set the "Package Version" to the version of the drivers

    3. Select "Chipset" in the "Sub System" pulldown item

    4. Set the "Driver Name" to "Intel(R) Innovation Platform Framework"

    5. In "Supported Device Names" put TBD

    6. Click the "Next" button at bottom of the screen.

        a.  A warning message will be displayed.  Click "OK."
    
3.8 Click the "Next" button at bottom of the screen. (On "Review the MUP Parts"
    screen.)

3.9 Save the created MUP

    1.  Select the "Browse" button on the "Create MUP Package" screen.

    2.  Browse to the location where you want to save the package.

    3.  Click "OK"

    4.  Click the "Finish" button at bottom of the screen.

4.0 MUP Package Validation

    There are different validation instructions depending on whether you
    verifying a 2.4.5 or 3.0 package.  See specific sections below for details.

4.1 MUP 2.4.5 (Legacy) Package Validation

    1. Select the "CVT" tab on the left side

    2. Click on the "Select MUP" tab on the top

    3. Click on the "..." button on the right side to browse to the location of
      the legacy MUP package

    4. Select the desired legacy MUP package and click on "Open"

4.1.1 Legacy Package Behavior Validation

    1. Select the "Validate Options" tab at the top

    2. Select "Behavior Validation" from the "Validation Options" pulldown

    3. Select the "unattended" radio button

    4. Click on the "Execute" button

    5. When execution is complete, check the validation results:

      a. Select "All Categories" from the "Result Categories" pull-down
      b. Review the results in the "Error" column.  (May need to scroll down.)
      c. All items should indicate "No issues found."

    6. Repeat Step 1-5 for the "attended" behavior

    7. Repeat Step 1-5 for the "extractdrivers" behavior

    8. Repeat Step 1-5 for the "freshinstall" behavior

4.1.2 Legacy Package Update Validation

    1. Install a previous version of the drivers

    2. Select the "Validate Options" tab at the top

    3. Select "Update Validation" from the "Validation Options" pulldown

    4. Expand the "Registry Key" and "PNP Inventory" items and verify that the
       tool does not indicate that the current version is already installed 
       
       a. If such warning is present, uninstall the current version and
          installing an older version.

       b. Select "Behavior Validation" from the "Validation Options" pulldown
          and then re-select the "Update Validation" option.  This should cause
          the tool to rescan the system and there should no longer be an issue
          shown under the "Registry Key" and "PNP Inventory" items

    5. Click on the "Update" button

    6. When execution is complete, check the validation results:

      a. Select "All Categories" from the "Result Categories" pull-down
      b. Review the results in the "Error" column.  (May need to scroll down.)
      c. All items should indicate "No issues found."
       
4.2 MUP 3.0 Package Validation

    1. Select the "CVT" tab on the left side

    2. Click on the "Select MUP" tab on the top

    3. Click on the "..." button on the right side to browse to the location of
      the MUP package

    4. Select the desired MUP 3.0 ZIP package and click on "Open"

4.2.1 MUP 3.0 Package Behavior Validation

    1. Select the "Validation Options" tab at the top

    2. Select "Behavior Validation" from the "Validation Options" pulldown

    3. Select the "unattended" radio button

    4. Click on the "Execute" button

    5. When execution is complete, check the validation results:

      a. Select "All Categories" from the "Result Categories" pull-down
      b. Review the results in the "Error" column.  (May need to scroll down.)
      c. All items except the "Content Check" under "MUP XML Validation Results"
         should indicate "No issues found."
      d. The "Content Check" under "MUP XML Validation Results" may show a
         warning indicating "For package type of dch_package legacy content will
         not be installed".  This is acceptable.

    6. Repeat Steps 1-4 for using the "attended" behavior

4.2.2 MUP 3.0 Package Update Validation

    Not required for the package type we create

   








