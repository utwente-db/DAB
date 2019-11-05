Requirements:
	pip install selenium

front-end_tests.py uses selenium to automate browsers to test various use cases.
For every browser you test you will need a WebDriver included in the same directory.
WebDrivers can be found via: https://www.seleniumhq.org/download/
This release included zip-files for chromedriver for macOS, Windows and Linux.
Unzip the one for your operating system.

Before testing you may want to adjust some global variables in front-end_tests.py.
browsers:	This dict contains booleans for the browsers you want to test.
		When the tests are ran, the program will run the tests for all browsers
		that map to True. Make sure the accompanying WebDrivers are present
		in the file directory.
		Chrome is set to true in this release.
		To extend support for other browers, include the WebDriver, add the
		browser to the dict and extend the method __iterateBrowers near the 
		bottom of the file to include an elif-statement for your browser.
		
admin:		This user will be used for most tests.
		This user should be an existing, verified user with admin rights.
		This user should not be the owner of any databses before testing.
		For security reasons you will have to provide the admin credentials yourself.

sampleUser:	This user should not exist before testing.
		This user will be created and deleted during testing.
		When testing fails, make sure this user is deleted.

testCourse:	This course should not exist before testing.
		This course will be created and deleted during testing.
		When testing fails, make sure this course is deleted.

PATH:		Set this variable to the root address of the DAB webapp.
