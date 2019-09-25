# What is this?
Autopkg Recipes because a lot of the other ones are broken

# Who am I?
@Yohan on the MacAdmins slack

# Recipe List
	
* Jamf Connect, download and pkg
    * Jamf Connect Login
    * Jamf Connect Verify
    * Jamf Connect Sync
    * Jamf Connect Configuration
    
* NoMAD, jss
    * Includes Pre-Install and Post-Install scripts for low impact upgrades on systems currently running NoMAD
        * Script uploading and configuration uses the Script Template workaround for 0.5.1 for JCDS upload
    * Depends on the com.github.tbridge.pkg.NoMAD recipe

* Microsoft Intune Company Portal, jss, pkg, download
	* No Dependencies
	* Currently requires a post-install script that changes the permissions on the Company Portal application due to it not being configured correctly from Microsoft
	
* KeePassX, jss
	* Depends on the com.github.homebysix.pkg.KeePassX recipe
	
* Dashlane, jss, pkg
	* Depends on the com.github.joshua-d-miller.download.dashlane recipe
	
* WMware Horizon Client, jss
	* Depends on the com.github.rtrouton.pkg.VMwareHorizonClient recipe
